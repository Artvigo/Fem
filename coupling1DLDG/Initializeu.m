function [Q] = Initializeu(Env,N)
%���� Initializeu ���ֵQ
%   ���������Env��Ԫ�ڵ�ֵ��NΪ��Ԫ��
%   ���������Q��ֵ

%Ԥ����
Q=zeros(6*N,1);
Q1=zeros(3*N,1);

% ��Ԫѭ��
for i=1:N
    a=Env(i,1);
    b=Env(i,2);
    mid=(a+b)/2;
    
    % ��������   
    f1=@(x)(sin(2*pi*x)+4*pi^2*sin(2*pi*x));
    f2=@(x)((sin(2*pi*x)+4*pi^2*sin(2*pi*x)).*(x-mid));
    f3=@(x)((sin(2*pi*x)+4*pi^2*sin(2*pi*x)).*(x-mid).^2);

    %���
    quad1=quadrature(f1,a,b);
    quad2=quadrature(f2,a,b);
    quad3=quadrature(f3,a,b);
    %��װ�Ҷ���
    Q1(3*i-2:3*i,1)=[quad1,quad2,quad3]';
end
Q(1:3*N,1)=Q1;
end


