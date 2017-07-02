function Binomial= biamtables7(P,K,T1,T2,T3,dt,cd)
sig = 0.3;
r = 0.05;
n = round(T1/dt);
S1 = round(T2/dt);
S1 = S1 +1;
S2 = round(T3/dt);
S2 = S2 +1;
u=exp(sig*sqrt(dt));
d=exp(-sig*sqrt(dt));
p=(exp((r)*dt)-d)/(u-d);
q=1-p;
st = zeros(n+1,n+1);
st(1,1) = P;
df=exp(-r*dt);
    for j = 2:S1
        st(1,j) = st(1,j-1)*u;
    end
    for j = 2:S1
        for i = 2:j
            st(i,j) = st(i-1,j-1)*d;
        end
    end
    
    valueam = zeros(n+1,n+1);
    for i = 1:S1
        valueam(i,S1) = biamtables4(st(i,S1)-cd, K, T1-T2, T3-T2, dt, cd);
    end
    for j = S1-1:-1:1
        for i = 1:j
            valueam(i,j) = max( max( (st(i,j)-K) ,0)  ,df*(p*valueam(i,j+1) + q*valueam(i+1,j+1)));
        end
    end
    Binomial = valueam(1,1);
