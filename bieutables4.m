function Binomial= bieutables4(P,K,T1,T2,dt,cd)
sig = 0.3;
r = 0.05;
n = round(T1/dt);
S = round(T2/dt);
u=exp(sig*sqrt(dt));
d=exp(-sig*sqrt(dt));
p=(exp((r)*dt)-d)/(u-d);
q=1-p;
st = zeros(n+1,n+1);
st(1,1) = P;

    for j = 2:S
        st(1,j) = st(1,j-1)*u;
    end
    for j = 2:S
        for i = 2:j
            st(i,j) = st(i-1,j-1)*d;
        end
    end
    
    valueeu = zeros(n+1,n+1);
    for i = 1:S
        valueeu(i,S) = bieutables1(st(i,S)-cd, K, T1-T2, sig, r, round((T1-T2)/dt)); 
    end
    for j = S-1:-1:1
        for i = 1:j
            valueeu(i,j) = exp(-r*dt)*(p*valueeu(i,j+1) + q*valueeu(i+1,j+1));
        end
    end
    Binomial = valueeu(1,1);