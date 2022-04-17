# Maximum Edge Weight Clique Algorithm

For documentation check:

### A Maximum Edge-Weight Clique Extraction Algorithm Based on Branch-and-Bound,
#### Satoshi Shimizu, Kuzuaki Yamaguchi, Sumio Masuda,
##### on 'Discrete Optimization', 2020, doi: https://doi.org/10.1016/j.disopt.2020.100583

The algorithm takes as input a parity check matrix, computes its adjacency matrix
(https://en.wikipedia.org/wiki/Adjacency_matrix) as follows:

1. For every *column* of the parity check matrix it computes the number of shared 1s with the other columns;
2. that number will be the weight of the edge that connects the corresponding nodes, i.e.
if column _i_ shares _w_ positions with column _j_, the _(i,j)_-th and the _(j,i)_-th element of 
the adjacency matrix will be equal to _w_.
