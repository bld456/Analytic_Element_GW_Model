function [ W ] = W_total (z, W0, Q, z0, rw)
W = W_Uniformflow(W0) + W_well(z, z0, rw, Q) - W_well(z, -z0, rw, Q);


end