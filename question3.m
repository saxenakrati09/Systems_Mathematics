function question3
Mat=dlmread('question1_adjacency_matrix2.txt');
% Mat=[0,1,1,0,0; 1,0,1,0,0; 1,1,0,1,0; 0,0,1,0,1; 0,0,0,1,0];
% disp(Mat);
n=size(Mat);
n=n(1);
C=zeros(0,1);
i=1;
while i<=n
    count=0;
    for j=1:n
        if Mat(i,j)==1
            count=count+1;
        end
    end
    %disp(count);
    C=[C;count];
    i=i+1;
end
% disp(C);

Knn=zeros(0,1);
i=1;
while i<=n
    sumd=0;
    for j=1:n
        if Mat(i,j)==1
            sumd=sumd+C(j);
        end
    end
%     disp(sumd);
    nn=sumd/C(i);
%     disp(nn);
    Knn=[Knn, nn];
    i=i+1;
end
%degree distribution
M=zeros(0,1);
j=0;
while j<n
    count1=0;
    for i=1:n
        if C(i)==j
            count1=count1+1;
            %disp(count1);
            %M=[M;count1];
        end
        %disp(count1);
        %M=[M;count1];
    end
    M=[M, count1];
    
    j=j+1;
end
Y=0:n-1;
% disp('degree')
% disp(Y);

frac=M/n;
% disp('nodes with above degree');
% disp(M);
% disp('fraction of nodes with above degrees');
% disp(frac);
figure(1);
plot(Y,frac,'-');
xlabel('degree');
ylabel('fraction of nodes');

%degree correlation
figure(2);
plot(Y,Knn,'-');
xlabel('degree');
ylabel('Knn');
        
            
