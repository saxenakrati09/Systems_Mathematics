function q=fq(x,t,delx)

if t==0
    q=sin(x*delx);
end
if x==0 && t>0
    q=0;
end
if x==pi && t>0
    q=0;
end
end
    