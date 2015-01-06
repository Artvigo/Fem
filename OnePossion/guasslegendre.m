function [ql,Ak,xk]=guasslegendre(fun,a,b,n,tol)
% ��˹-���õ���ֵ����
%
% ����˵��
% fun�����ֱ��ʽ�������Ǻ��������inline�����������������ַ������ʽ�����Ǳ�����Խ���ʸ������
% a,b�����������ޣ�ע���������̫��ή�;��ȣ���ʱ����ʹ�ø��������ʽ��Ĭ��[-1 1]
% n�����ֽ������������������������ǲ��������ù��󣬴�һ���ܵõ����õľ��ȣ�Ĭ��7
% tol�����־��ȣ�Ĭ��1e-6
% ql�����ֽ��
% Ak�����ϵ��
% xk������ڵ㣬����ql=sum(Ak.*fun(xk))
%
% ����˵��
% fun=@(x)exp(x).*cos(x); % ������Խ���ʸ������
% quadl(fun,0,pi) % ����MATLAB�ڲ����ֺ�������
% [ql,Ak,xk]=guasslegendre(fun,0,pi)

if nargin==1
    a=-1;b=1;n=7;tol=1e-8;
elseif nargin==3
    n=7;tol=1e-8;
elseif nargin==4
    tol=1e-8;
elseif nargin==2|nargin>5
    error('The Number of Input Arguments Is Wrong!');
end
% ��������ڵ�
syms x
p=sym2poly(diff((x^2-1)^(n+1),n+1))/(2^n*factorial(n));
tk=roots(p); % ����ڵ�
% �������ϵ��
Ak=zeros(n+1,1);
for i=1:n+1
    xkt=tk;
    xkt(i)=[];
    pn=poly(xkt);
    fp=@(x)polyval(pn,x)/polyval(pn,tk(i));
    Ak(i)=quadl(fp,-1,1,tol); % ���ϵ��
end
% ���ֱ�����������[a,b]�任��[-1,1]
xk=(b-a)/2*tk+(b+a)/2;
% ������ֺ���fun��Ч��
fun=fcnchk(fun,'vectorize');
% �����������֮����ֺ�����ֵ
fx=fun(xk)*(b-a)/2;
% �������ֵ
ql=sum(Ak.*fx);