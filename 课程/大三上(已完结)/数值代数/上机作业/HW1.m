clc
A=zeros(100,100);
A1=ones(1,100)*10;
A2=ones(1,99);
A=A+diag(A1)+diag(A2,1)+diag(A2,-1);
b=ones(100,1);
A=improve(A);
L = tril(A, -1) + eye(100); 
X=forward_substitution(L,b);
X=X./diag(A);
X=backward_substitution(L',X);
X

function [A] = improve(A)
n=length(A);
D=zeros(1,n);
for i=1:n
    A(i,i)=A(i,i)-A(i,1:i-1).*D(1:i-1)*A(i,1:i-1).';
    D(i)=A(i,i);
    for t=i+1:n
        A(t,i)=(A(t,i)-A(t,1:i-1).*D(1:i-1)*A(i,1:i-1).')/A(i,i);
    end
end
end

function [X] = forward_substitution(N,b)
n=length(b);
X=zeros(n,1);
for j=1:n
    X(j)=(b(j) - N(j, 1:j-1) * X(1:j-1)) / N(j, j);
end
end

function [X] = backward_substitution(N,b)
n=length(b);
X=zeros(n,1);
for j=n:-1:1
    X(j)=(b(j) - N(j, j+1:n) * X(j+1:n)) / N(j, j);
end
end

