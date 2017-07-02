function Binomial= biamtables(P,K,r,T,sig,n)
dt=T/n;

u=exp(sig*sqrt(dt));
d=exp(-sig*sqrt(dt));
p=(exp((r)*dt)-d)/(u-d);
q=1-p;
df=exp(-r*dt);
for i = 0:n
    state = i + 1;
    St = P * u^i * d^(n - i);
    Value(state) = max(0, (K-St));
end
for t = (n - 1) : -1 : 0
    for i = 0:t
        state = i + 1;
        Value(state)=max(((K-P*u^i*d^(abs(i-t)))),(p*Value(state+1)+q*Value(state))*df);
    end
end

Binomial = Value(1);