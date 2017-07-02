function Binomial= bieutables1(P,K,T,sig,r,n)
dt=T/n;

u=exp(sig*sqrt(dt));
d=exp(-sig*sqrt(dt));
p=(exp((r)*dt)-d)/(u-d);
q=1-p;
    clear st
    st = zeros(n+1,n+1);
    st(1,1) = P;
    for j = 2:n+1
        st(1,j) = st(1,j-1)*u;
    end;
    for j = 2:n+1
        for i = 2:j
        st(i,j) = st(i-1,j-1)*d;
        end;
    end;
    value = zeros(n+1,n+1);
    for i = 1:n+1
        value(i,n+1) = max((st(i,n+1)-K),0);
    end;
    for j = n:-1:1
        for i = 1:j
            value(i,j) = exp(-r*dt)*(p*value(i,j+1) + q*value(i+1,j+1));
        end;
    end;
Binomial = value(1,1);