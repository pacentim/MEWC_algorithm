function Cmax = EXPAND(Cmax,C,S,Gamma)
if isempty(C)
    WC=0;
else
    WC = sum(sum(Gamma(C,C)))/2;
end
if isempty(Cmax)
    WCmax = 0;
else
    WCmax = sum(sum(Gamma(Cmax,Cmax)))/2;
end
if isempty(S)
    if (WC)>(WCmax)
        Cmax = C;
    end
else
    [PI,upper] = CALC_SEQ_AND_UB(C,S,Gamma);
    
    ind = (upper+WC)>WCmax;
    PI = PI(ind);
    upper = upper(ind);
    for i = 1 : length(PI)
            p = PI(i);
            N = find(Gamma(p,:)>0);
            newS = intersect(S(~ismember(S,PI((1:i-1)))),N);
            Cmax = EXPAND(Cmax,[C p],newS,Gamma);     
    end
end





end