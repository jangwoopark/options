clc;
clear all;

T=[1/12, 4/12, 7/12]';
r=.05;
sig=.3;
P=40;
K=[35, 40, 45]';
n=300;
tab1am=zeros(length(K),length(T));
tab1eu=zeros(length(K),length(T));
for i=1:length(K);
    for j=1:length(T);
    tab1am(i,j)=biamtables(P,K(i),r,T(j),sig,n);
    tab1eu(i,j)=bieutables(P,K(i),r,T(j),sig,n);
    end;
end;
tab1am
tab1eu

