function [quad1 quad2]= quadGauss(node1,node2)
%��취����������������������������������Ƿֱ���մ��ݹ�������������
%��ô�����������������
%g = (1 + (x-node1)/h)
%g = (1 + (x-node2)/h) �������� ��������Ҳ����ô����
%���������涨��һ���ڲ�������ͨ�����ݽ����Ĳ������ֱ��������������ʽ��

[f1,f2] = solvequad(node1,node2);
na = (node1-node2)/2;
nb = (node1+node2)/2;
quad1 = na*(0.2369269*subs(sym(f1),findsym(sym(f1)),na*0.9061793 + nb)+...
            0.2369269*subs(sym(f1),findsym(sym(f1)),-na*0.9061793 + nb)+...
            0.4786287*subs(sym(f1),findsym(sym(f1)),na*0.5384693 + nb)+...
             0.4786287*subs(sym(f1),findsym(sym(f1)),-na*0.5384693 + nb)+...
             0.5688889*subs(sym(f1),findsym(sym(f1)), nb));
quad2 = na*(0.2369269*subs(sym(f2),findsym(sym(f2)),na*0.9061793 + nb)+...
            0.2369269*subs(sym(f2),findsym(sym(f2)),-na*0.9061793 + nb)+...
            0.4786287*subs(sym(f2),findsym(sym(f2)),na*0.5384693 + nb)+...
             0.4786287*subs(sym(f2),findsym(sym(f2)),-na*0.5384693 + nb)+...
             0.5688889*subs(sym(f2),findsym(sym(f2)), nb));

function [f1,f2] = solvequad(node1,node2)
%������������Ĵ������Ľڵ������㺯���ı��ʽ
node=[node1,node2];
b=1;
a=0;
N=3;
h = (b-a)/N;
f1 = (1 - (x-node)/h);
f2 = (1 + (x-node)/h);
end

end