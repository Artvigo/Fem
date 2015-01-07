%%
a=0;
b=2;
N=24;
%����
[h,Env] = MeshGen1D(a,b,N);
%װ��ֲ�����
[M,D,R_BR,R_BL,Q_BR,Q_BL] = assemble_Elem(Env,N,h);
%��ʼ���Ҷ���
[Q] = Initializeu(Env,N);
%��װ��Ͼ���
[A] = assemble(M,R_BR,R_BL,Q_BR,Q_BL,D,N);
%%
%������Է�����
X=zeros(6*N,1);
U=zeros(3*N,1);
R=zeros(3*N,1);

X=A\Q;
U(1:3*N,1)=X(1:3*N,1);
%%
x = linspace (a, b, N+1);

nu=zeros(N,1);
eu=zeros(N,1);

% ��ֵ�� nu
for i=1:N
    nu(i,1)=U(3*i-2,1);
end

% ��� eu
    for i= 1:N
        x(i)=(x(i)+x(i+1))/2;
        eu(i,1) = sin(2*pi*x(i));        
    end
% eu


% ������
error=abs(nu-eu)


% L1_error=sum(abs(nu-eu))/N 
% L2_error=sqrt(sum((nu-eu).^2)/N)
L2_error=norm(eu-nu,2)
Lmax_error=max(abs(nu-eu))

% ��ͼ
plot ( x(1:N),nu,'.b:', x(1:N),eu,'+r:');
% plot ( x(1:N),nu,'.b:'); 
% plot ( x(1:N),error,'+r:');
legend ( 'numrical solution ', 'exact    solution ') ;
grid on ;
u_min=min(min(nu));
u_max=max(max(nu));
axis([0 2 u_min-1,u_max+1]);
title ( sprintf ( ' NStep%d', N ) );
xlabel ( '------X------' ) ;
ylabel ( '------U------' );


