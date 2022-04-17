function [PI,upper] = CALC_SEQ_AND_UB(C,S,Gamma)

%C is a clique 
%S are neighbor nodes of the clique 
PI=zeros(1,1e5);
upper = NaN*ones(1,1e5);
sigma = zeros(1,length(S));
for i = 1 : length(S)
    v = S(i);
    sigma(i) = sum(Gamma(v,C)); %sigma[v] of the parent problem
end

T=S; %uncolored vertex set
k=0; %number of independet sets
I = cell(1,1e3);
count=1;
while ~isempty(T)
    k=k+1;
   I{k}=zeros(1,1e5);
    X=T;
    while ~isempty(X)
        sigmaX = sigma(find(ismembc(S,X)));
        i = find(sigmaX==min(sigmaX));
        i = i(1);
        v = X(i);  %a vertex of minimum sigma in X
        I{k}(count) = v;
        PI(count) = v;
        if k~=1
            temp = zeros(1,k-1);
            for j = 1 : k-1
                vec = find(ismember(S,I{j}));
                summy = max(sigma(vec));
                summy=summy(1);
                temp(j) = summy;
            end
            upd = sum(temp);
        else
            upd=0;
        end
        upper(count) = sigmaX(i)+ upd;
        count=count+1;
        N = find(Gamma(v,:)>0);
        X=X(~ismembc(X,N));
        X=X(~ismembc(X,v));
        T=T(~ismembc(T,v));
    end
    
    ind = ismember(S,T);
    auxS = S(ind); %v in T
    Ik = sort(I{k});
    for j = 1 : length(auxS)
            N = find(Gamma(auxS(j),:)>0);
            inters = Ik(ismembc(Ik,N));
            if ~isempty(inters)
                ii = find(S==auxS(j));
                sigma(ii) = sigma(ii)+ max(Gamma(auxS(j),inters));
            end
    end
   I{k}=I{k}(I{k}>0);
end
PI = PI(PI~=0);
PI = fliplr(PI);
upper = upper(~isnan(upper));
upper = fliplr(upper);
end