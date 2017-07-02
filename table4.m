clc;
clear all;
dy=[.0125 .025 .05 .075 .1]';
cd=[.5 1 2 3 4];

t4=zeros(18,10);
for g=1:5
    t4(:,(2*g)-1:2*g)=table3func(cd(g),dy(g));
end;