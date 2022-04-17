function Cmax = MECQ(Gamma,Cinitial)

Cmax = Cinitial;

Cmax = EXPAND(Cmax,[],[1:size(Gamma,1)],Gamma);



end