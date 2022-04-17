%%%%calcolo \Gamma
function Gamma = Compute_gammaSimple(H)
Gamma = zeros(size(H,2));

for i = 1 : size(H,2)
    for j = 1 : size(H,2)
        if i == j
            Gamma(i,j) = 0;
        elseif i<j
            Gamma(i,j) = length(intersect(find(H(:,i)),find(H(:,j))));
        elseif i>j
            Gamma(i,j) = Gamma(j,i);
        end
    end
end

    