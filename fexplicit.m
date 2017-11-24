function fexplicit(delx, delt, x0, x1, t0, t1)
nx=((x1-x0)/delx)+1;
nt=((t1-t0)/delt)+1;
disp('nx');
disp(nx);
disp('nt');
disp(nt);
B=zeros(nx,nt);
x=1;
for i=delx:delx:x1-delx
    B(x,1)= fq(i,0,delx)+((delt/(delx^2))*(fq(i-1,0,delx)-2*fq(i,0,delx)+fq(i+1,0,delx)));
    x=x+1;
end
% for j=2:nt
%     x=1;
%     for i=2:nx-1
%         B(x,j)=B(i,j)+((delt/(delx^2))*(B(i-1,j)-2*B(i,j)+B(i+1,j)));
%         x=x+1;
%     end
% end
for j=2:nt
x=2;
for k=2:nx-1
    B(x,j)=B(k,j-1)+((delt/(delx^2))*(B(k-1,j-1)-2*B(k,j-1)+B(k+1,j-1)));
    x=x+1;
end
end
% B(2,2) =B(2,1)+((delt/(delx^2))*(B(1,1)-2*B(2,1)+B(3,1)));
% B(3,2) =B(3,1)+((delt/(delx^2))*(B(2,1)-2*B(3,1)+B(4,1)));
disp(B);
% dlmwrite('Bexplicit.txt', B,'delimiter','\t', 'newline', 'pc');
end