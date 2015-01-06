% step1:д��������
% step2:�����������M,D,B
% step3:���M�������
% step4:�γɳ�΢�ַ��̣����г�ֵ�ĳ�΢�ַ��̣�����ʱ�����ɢ��
%%
N=10;
a=0;
b=2;
%��������
[h,Env] = MeshGen1D(a,b,N);
%���㵥Ԫ
[M,D,BR,BL] = assemble_Elem(Env,N,h);
M
%�����ֵ
[U] = Initializeu(Env,M,N);
%%
 %�߽紦��,��ѭ����U�޹ص���
 UL=zeros(3*N,1);
 UL(1:3,1)=[1,1,1]';
 BL(1:3,1:3)=zeros(3,3);
 BL(1,1)=1;
 BL(2,2)=-h/2;
 BL(3,3)=h^2/4;
 %U
 %BL
%%
%ʱ�䲽��
time=1;
dt=0.001;
%ʱ����ɢ
for tstep=1:1000
    %�߽紦����ѭ��U�йص���
    for i=2:N
        UL(3*i-2:3*i,1)=U(3*i-5:3*i-3,1);
    end
   % UL
    %�����Ҷ���
    %U
    [Ut] = assemble_RH(U,UL,M,BR,BL,D,N,h,dt);
    U=Ut;
end
%U;
%%
x = linspace (0, 2, N+1);
t = linspace (0.0,1.0,100) ;
nu=zeros(N,1);
eu=zeros(N,1);

% select numerical solution nu
for i=1:N
    nu(i,1)=U(3*i-2);
end
%nu

% eaxct solution 
    for i= 1:N
        x(i)=(x(i)+x(i+1))/2;
        if x(i)>time +1
            eu(i,1) = x(i)-time -1.0;
        elseif x(i)<=time+1&&x(i) >time
            eu(i,1) =1-x(i)+time;
        elseif x(i)<=time
            eu(i,1) =1;
        end
    end
%eu
%%
%   error estimate
error=abs(nu-eu)
L1_error=sum(abs(nu-eu))/N
L2_error=sqrt(sum((nu-eu).^2)/N)
L3_error=max(abs(nu-eu))
%  draw 
plot ( x(1:N),nu,'.b:', x(1:N),eu,'+r:');
legend ( 'numrical solution ', 'exact    solution ') ;
grid on ;
u_min=min(min(nu));
u_max=max(max(nu));
axis([0 2 u_min-1.0,u_max+1.0]);
title ( sprintf ( ' NStep%d,Time%f \n ', N,1) );
xlabel ( '------X------' ) ;
ylabel ( '------U------' );

