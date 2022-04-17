
clc;
clear all;
close all;
dbstop if error;

%parity check matrix
H = [ 1 1 0 0 1 0 1;
      1 0 1 0 1 1 1;
      0 1 1 1 0 1 0];

A = Compute_gammaSimple(H); %adjacency matrix

Cmax = MECQ(A,[]);

Clique = H(:,Cmax)




    