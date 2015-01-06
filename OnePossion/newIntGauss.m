function [quad1 quad2] = newIntGauss(a,b,N)
%function filename : IntGauss
%Purpose:
%To learn the pentadiagonal method
%Record of revisions:
%Date       Programmer      Description of change
%=====    ==========     =================
%11/17     Artvigo               Original code 
%
%Define variables:inputs
%   A:is the 1xN vector of abscissas from nodes.txt ex.N=4,A=nodes(6:9,1);
%   w=nodes(6:9,1)
%   w:is the 1xN vector of weights from nodes.txt
%   a,b:are upper and lower limits of integration
%   f : is the integrand unput as a string 'f'
%  
%   outputs quad:the quadrature value.

%异常情况处理如下：
if (nargin<3)
        error(message('NotEnoughInputs'));
elseif (nargin>3)
     error(message('TooMuchInputs'));
end
    nodes=load('nodes.txt');
    switch N
        case 2
         A=nodes(1:2,1);
         w=nodes(1:2,2);
        case 3
            A=nodes(3:5,1);
            w=nodes(3:5,2);
        case 4
            A=nodes(6:9,1);
            w=nodes(6:9,2);
        case 5
            A=nodes(10:14,1);
            w=nodes(10:14,2);
        case 6
            A=nodes(15:20,1);
            w=nodes(15:20,2);
            case 7
            A=nodes(21:27,1);
            w=nodes(21:27,2);
    end
    N=3;
    a=0;
    b=1;
    h=(b-a)/N;
    syms x;
      f1 = sym('-2*(1-(x-node1)/(h))');
      f2 =sym('-2*(1+(x-node2)/(h))');
T = zeros(1,N);
T = ((a+b)/2) + ((b-a)/2)*A;
quad1 = ((b-a)/2)*sum(w*subs(f1,findsym(f1),T));
quad2 = ((b-a)/2)*sum(w*subs(f2,findsym(f2),T));
%quad1 = ((b-a)/2)*sum(w.*feval(f1,T));
%quad2 = ((b-a)/2)*sum(w.*feval(f2,T));
format rat;
end