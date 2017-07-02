clc;
clear all;

T=[1/12, 4/12, 7/12]';
r=.05;
sig=.3;
P=40;
K=[35, 40, 45]';
tab3cdam=zeros(length(T),length(K));
tab3cdeu=zeros(length(T),length(K));
tab3dyam=zeros(length(T),length(K));
tab3dyeu=zeros(length(T),length(K));
dy=.0125;
cd=.5;
%cd 1 month;

n=140;
dt = T(1)/n;
u=exp(sig*sqrt(dt));
d=exp(-sig*sqrt(dt));
p=(exp((r)*dt)-d)/(u-d);
q=1-p;
df=exp(-r*dt);
clear st
st = zeros(n+1,n+1);
st(1,1) = P;
    for j = 2:71
        st(1,j) = st(1,j-1)*u;
    end;
    for j = 2:71
        for i = 2:j
            st(i,j) = st(i-1,j-1)*d;
        end;
    end;
    
    for s = 1:3
    clear valueam
    clear valueeu
    valueam = zeros(n+1,n+1);
    valueeu = zeros(n+1,n+1);
    for i = 1:71
        valueam(i,71) = biamtables1(st(i,71)-cd, K(s), T(1)/2, sig, r, 70); 
        valueeu(i,71) = bieutables1(st(i,71)-cd, K(s), T(1)/2, sig, r, 70); 
    end;
    for j = 70:-1:1
        for i = 1:j
            valueeu(i,j) = exp(-r*dt)*(p*valueeu(i,j+1) + q*valueeu(i+1,j+1));
            valueam(i,j) = max( max( (st(i,j)-K(s)) ,0)  ,df*(p*valueam(i,j+1) + q*valueam(i+1,j+1))); 
        end;
    end;
    tab3cdam(s,1) = valueam(1,1);
    tab3cdeu(s,1) = valueam(1,1);
    end;

%dy 1 month;

n=140;
dt = T(1)/n;
u=exp(sig*sqrt(dt));
d=exp(-sig*sqrt(dt));
p=(exp((r)*dt)-d)/(u-d);
q=1-p;
df=exp(-r*dt);
clear st;
st=zeros(n+1,n+1);
st(1,1)=P;

    for j = 2:n+1
        if j == 70
            st(1,j) = st(1,j-1)*u*(1-dy);
        else
        st(1,j) = st(1,j-1)*u;
        end;
    end;
    for j = 2:n+1
        for i = 2:j
            if j == 70
                st(i,j) = st(i-1,j-1)*d*(1-dy);
            else
                st(i,j) = st(i-1,j-1)*d;
            end;
        end;
    end;
    for s = 1:3 
    clear valueeu
    clear valueam
    valueeu = zeros(n+1,n+1);
    valueam = zeros(n+1,n+1);
    for i = 1:n+1
        valueeu(i,n+1) = max((st(i,n+1)-K(s)),0); 
        valueam(i,n+1) = max((st(i,n+1)-K(s)),0); 
    end;
    for j = n:-1:1
        for i = 1:j
            valueeu(i,j) = exp(-r*dt)*(p*valueeu(i,j+1) + q*valueeu(i+1,j+1));
            valueam(i,j) = max( max( (st(i,j)-K(s)) ,0)  ,df*(p*valueam(i,j+1) + q*valueam(i+1,j+1))); 
        end;
    end;
    tab3dyam(s,1) = valueam(1,1);
    tab3dyeu(s,1) = valueeu(1,1);
    end;

%cd 4 months
n=160;
dt = T(2)/n;
u=exp(sig*sqrt(dt));
d=exp(-sig*sqrt(dt));
p=(exp((r)*dt)-d)/(u-d);
q=1-p;
df=exp(-r*dt);
clear st
st = zeros(n+1,n+1);
st(1,1) = P;
    for j = 2:21
        st(1,j) = st(1,j-1)*u;
    end;
    for j = 2:21
        for i = 2:j
            st(i,j) = st(i-1,j-1)*d;
        end;
    end;
    
    for s = 1:3
    clear valueam;
    clear valueeu;
    valueam = zeros(n+1,n+1);
    valueeu = zeros(n+1,n+1);
    for i = 1:21
        valueam(i,21) = biamtables4(st(i,21)-cd, K(s), T(2)-(1/24), (6/24), dt, 0.5); 
        valueeu(i,21) = bieutables4(st(i,21)-cd, K(s), T(2)-(1/24), (6/24), dt, 0.5); 
    end;
    for j = 20:-1:1
        for i = 1:j
            valueeu(i,j) = exp(-r*dt)*(p*valueeu(i,j+1) + q*valueeu(i+1,j+1));
            valueam(i,j) = max( max( (st(i,j)-K(s)) ,0)  ,df*(p*valueam(i,j+1) + q*valueam(i+1,j+1))); 
        end;
    end;
    tab3cdam(s,2) = valueam(1,1);
    tab3cdeu(s,2) = valueeu(1,1);
    end;

%dy 4 months
n=160;
u=exp(sig*sqrt(dt));
d=exp(-sig*sqrt(dt));
p=(exp((r)*dt)-d)/(u-d);
q=1-p;
df=exp(-r*dt);
clear st;
st=zeros(n+1,n+1);
st(1,1)=P;
    for j = 2:n+1
        if j == 20
            st(1,j) = st(1,j-1)*u*(1-dy);
        elseif j==140
            st(1,j) = st(1,j-1)*u*(1-dy);
        else
        st(1,j) = st(1,j-1)*u;
        end;
    end;
    for j = 2:n+1
        for i = 2:j
            if j == 20
                st(i,j) = st(i-1,j-1)*d*(1-dy);
            elseif j == 140
                st(i,j) = st(i-1,j-1)*d*(1-dy);
            else
                st(i,j) = st(i-1,j-1)*d;
            end;
        end;
    end;
    
    for s = 1:3 
    clear valueeu;
    clear valueam;
    valueeu = zeros(n+1,n+1);
    valueam = zeros(n+1,n+1);
    for i = 1:n+1
        valueeu(i,n+1) = max((st(i,n+1)-K(s)),0); 
        valueam(i,n+1) = max((st(i,n+1)-K(s)),0); 
    end
    for j = n:-1:1
        for i = 1:j
            valueeu(i,j) = exp(-r*dt)*(p*valueeu(i,j+1) + q*valueeu(i+1,j+1));
            valueam(i,j) = max( max( (st(i,j)-K(s)) ,0)  ,df*(p*valueam(i,j+1) + q*valueam(i+1,j+1))); 
        end;
    end;
    tab3dyam(s,2) = valueam(1,1);
    tab3dyeu(s,2) = valueeu(1,1);
    end;

%cd 7 months
n=140;
dt = T(3)/n;
u=exp(sig*sqrt(dt));
d=exp(-sig*sqrt(dt));
p=(exp((r)*dt)-d)/(u-d);
q=1-p;
df=exp(-r*dt);
clear st
st = zeros(n+1,n+1);
st(1,1) = P;
    for j = 2:11
        st(1,j) = st(1,j-1)*u;
    end
    for j = 2:11
        for i = 2:j
            st(i,j) = st(i-1,j-1)*d;
        end;
    end;
    
    for s = 1:3 
    valueam = zeros(n+1,n+1);
    valueeu = zeros(n+1,n+1);
    for i = 1:11
        valueam(i,11) = biamtables7(st(i,11)-cd, K(s), T(3)-(1/24), (6/24), (12/24), dt, 0.5); 
        valueeu(i,11) = bieutables7(st(i,11)-cd, K(s), T(3)-(1/24), (6/24), (12/24), dt, 0.5); 
    end;
    for j = 10:-1:1
        for i = 1:j
            valueeu(i,j) = exp(-r*dt)*(p*valueeu(i,j+1) + q*valueeu(i+1,j+1));
            valueam(i,j) = max( max( (st(i,j)-K(s)) ,0)  ,df*(p*valueam(i,j+1) + q*valueam(i+1,j+1))); 
        end;
    end;
    tab3cdam(s,3) = valueam(1,1);
    tab3cdeu(s,3) = valueeu(1,1);
    end;
    
%dy 7 months
n=140;
u=exp(sig*sqrt(dt));
d=exp(-sig*sqrt(dt));
p=(exp((r)*dt)-d)/(u-d);
q=1-p;
df=exp(-r*dt);
clear st;
st=zeros(n+1,n+1);
st(1,1)=P;
    for j = 2:n+1
        if j == 10
            st(1,j) = st(1,j-1)*u*(1-dy);
        elseif j==70
            st(1,j) = st(1,j-1)*u*(1-dy);         
        elseif j==130
            st(1,j) = st(1,j-1)*u*(1-dy);
        else
        st(1,j) = st(1,j-1)*u;
        end;
    end;
    for j = 2:n+1
        for i = 2:j
            if j == 10
                st(i,j) = st(i-1,j-1)*d*(1-dy);
            elseif j == 70
                st(i,j) = st(i-1,j-1)*d*(1-dy);
            elseif j == 130
                st(i,j) = st(i-1,j-1)*d*(1-dy);
            else
                st(i,j) = st(i-1,j-1)*d;
            end;
        end;
    end;
    
    for s = 1:3 
    clear valueeu;
    clear valueam;
    valueeu = zeros(n+1,n+1);
    valueam = zeros(n+1,n+1);
    for i = 1:n+1
        valueeu(i,n+1) = max((st(i,n+1)-K(s)),0); 
        valueam(i,n+1) = max((st(i,n+1)-K(s)),0); 
    end;
    for j = n:-1:1
        for i = 1:j
            valueeu(i,j) = exp(-r*dt)*(p*valueeu(i,j+1) + q*valueeu(i+1,j+1));
            valueam(i,j) = max( max( (st(i,j)-K(s)) ,0)  ,df*(p*valueam(i,j+1) + q*valueam(i+1,j+1))); 
        end;
    end;
    tab3dyam(s,3) = valueam(1,1);
    tab3dyeu(s,3) = valueeu(1,1);
    end;
