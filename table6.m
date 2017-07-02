clc;
clear all;

T=[1/12, 4/12, 7/12]';
r=.05;
sig=.3;
P=40;
K=[35, 40, 45]';
tab3dyamput=zeros(length(T),length(K));
tab3dyeuput=zeros(length(T),length(K));
dy=.0125;
    
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
        valueeu(i,n+1) = max((K(s)-st(i,n+1)),0); 
        valueam(i,n+1) = max((K(s)-st(i,n+1)),0); 
    end;
    for j = n:-1:1
        for i = 1:j
            valueeu(i,j) = exp(-r*dt)*(p*valueeu(i,j+1) + q*valueeu(i+1,j+1));
            valueam(i,j) = max( max( (K(s)-st(i,j)) ,0)  ,df*(p*valueam(i,j+1) + q*valueam(i+1,j+1))); 
        end;
    end;
    tab3dyamput(s,1) = valueam(1,1);
    tab3dyeuput(s,1) = valueeu(1,1);
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
        valueeu(i,n+1) = max((K(s)-st(i,n+1)),0); 
        valueam(i,n+1) = max((K(s)-st(i,n+1)),0); 
    end
    for j = n:-1:1
        for i = 1:j
            valueeu(i,j) = exp(-r*dt)*(p*valueeu(i,j+1) + q*valueeu(i+1,j+1));
            valueam(i,j) = max( max( (K(s)-st(i,j)) ,0)  ,df*(p*valueam(i,j+1) + q*valueam(i+1,j+1))); 
        end;
    end;
    tab3dyamput(s,2) = valueam(1,1);
    tab3dyeuput(s,2) = valueeu(1,1);
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
        valueeu(i,n+1) = max((K(s)-st(i,n+1)),0); 
        valueam(i,n+1) = max((K(s)-st(i,n+1)),0); 
    end;
    for j = n:-1:1
        for i = 1:j
            valueeu(i,j) = exp(-r*dt)*(p*valueeu(i,j+1) + q*valueeu(i+1,j+1));
            valueam(i,j) = max( max( (K(s)-st(i,j)) ,0)  ,df*(p*valueam(i,j+1) + q*valueam(i+1,j+1))); 
        end;
    end;
    tab3dyamput(s,3) = valueam(1,1);
    tab3dyeuput(s,3) = valueeu(1,1);
    end;
