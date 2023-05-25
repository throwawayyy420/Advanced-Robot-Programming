clc
clear

syms l1 l2 l3 l4 t1 t2 t3;
Px = l1*cos(t1) + l2*cos(t1+t2);
Py = l1*sin(t1) + l2*sin(t1+t2);
Pz = l1 + (l2 + l3)*sin(t2) + l4;
beta = t2 + t3;

J = jacobian([Px,Py],[t1,t2]);
simplify(J)
J1 = inv(J);
simplify(J1)
%simplify(J*J1)
