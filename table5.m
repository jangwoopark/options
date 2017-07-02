clc;
clear all;

T=[1/12, 4/12, 7/12]';
r=.05;
sig=.3;
P=40;
K=[35, 40, 45]';
n=150;
tab5am=zeros(length(K),length(T));
tab5eu=zeros(length(K),length(T));
for i=1:length(K);
    for j=1:length(T);
    tab5am(i,j)=biamtablesput(P,K(i),r,T(j),sig,n);
    tab5eu(i,j)=bieutablesput(P,K(i),r,T(j),sig,n);
    end;
end;
tab5am
tab5eu

