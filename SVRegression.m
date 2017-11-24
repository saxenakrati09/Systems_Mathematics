function [nsv,beta,bias]= SVRegression(X,Y,ker,C,loss,e)

% SVR Support Vector Regression
% Usage: [nsv beta bias]= svr(X<Y,ker,C,loss,e)
% Parameters:
% X= Training inputs
% Y=training targets
% ker= kernel function
% C=upper bound( non-separable case)
% loss= loss function
% e= insensivity
% nsv= number of support vectors
% beta= Difference of Lagrange multipliers
% bias= bias term

if(nargin<3 || nargin>6) %check the number of arguments
    helpsvr
else
    fprintf('Support Vector Regressing...')
    n=size(X,1); %number of rows in X (training input)
    if(nargin<6)
        e=0.0;
    end
    if(nargin<5)
        loss='einsensitive';
    end
    if(nargin<4)
        C=Inf;
    end
    if(nargin<3)
        ker='linear';
    end
    
    % tolerance for support vector detection
    epsilon=svtol(C);
    
    
    % construct the kernel matrix
    
    
    fprintf('Constructing kernel matrix...');
    H=zeros(n,n);
    for i=1:n
        for j=1:n
            H(i,j)=svkernel(ker, X(i,:), X(j,:));
        end
    end
    
    
    % Set up the parameters for the optimization problem
    switch (loss)
        case 'einsensitive'
            Hb= [H, -H; -H, H];
            c=[(e*ones(n,1)-Y); (e*ones(n,1)+Y)];
            vlb=zeros(2*n,1); %Set the bounds: alpha>=0
            vub= C*ones(2*n,1); %alpha<=C
            x0= C*ones(2*n1); %The starting point is [0 0 0 0]
            neqcstr= nobias(ker); %Set the number of equality constraints (1 or 0)
            if neqcstr
                A=[ones(1,n), -ones(1,n)];
                b=0;
                %Ste the constraint Ax=b
            else
                A=[];
                b=[];
            end
        case 'quadratic'
            Hb= H+eye(n)/(2*C);
            c=-Y;
            vlb= -1e30 * ones(n,1);
            vub= 1e30 * ones(n,1);
            x0= zeros(n,1); %The starting point is [0 0 0 0]
            neqcstr= nobias(ker); %Set the number of equality constraints (1 or 0)
            if neqcstr
                A=ones(1,n);
                b=0;
                %Ste the constraint Ax=b
            else
                A=[];
                b=[];
            end 
        otherwise
            disp('Error: Unknown Loss function');
    end
    
    % Avoid small amount of zero order regularization to
    % avoid problems when Hessian is badly conditioned.
    % Rank is always less than or equal to n
    % Note that adding to much reg will perturb solution
    
    Hb= Hb+1e-10*eye(size(Hb));
    
    % Solve the optimization problem
    
    fprintf(('Optimizing...');
    st= cputime;
    
    [alpha lambda how]= qp(Hb,c,A,b,vlb,vub,x0,neqcstr);
    fprintf('execution time: 4.1%fseconds', cputime -st);
    fprintf('Status: %s', how);
    
    switch lower(loss)
        case 'einsensitive'
            beta=alpha(1:n)-alpha(n+1:2*n);
        case 'quadratic'
            beta=alpha;
    end
    
    fprintf('|w0|2: %f', beta'*H*beta);
    fprintf('Sum beta: %f', sum(beta));
    
    %Compute the number of Support vectors
    svi= find(abs(beta)>epsilon);
    nsv= length(svi);
    fprintf('Support Vectors: %d(3.1%f)',nsv,100*nsv);
    
    %Implicit bias
    bias=0;
    
    %Explicit bias, b0
    if nobias(ker)==0
        switch lower(loss)
            case 'einsensitive'
                % find bias from average of support vectors with
                % interpolation error e
                % SVs with interpolation error e have alphas: 0<alpha<C
                svii= find(abs(beta)>epsilon && abs(beta)<(C-epsilon));
                if ~isempty(svii)
                    bias=(1/length(svii))*sum(Y(svii)-e*sign(beta(svii))-H(svii,svi)*beta(svi));
                else
                    fprintf('No support vectors with interpolation error e- cannot compute bias.');
                    bias=(max(Y)+min(Y))/2;
                end
            case 'quadratic'
                bias=mean(Y-H*beta);
        end
    end
end
end

                
                    
        
    
    