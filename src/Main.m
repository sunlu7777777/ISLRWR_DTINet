clc
close all
clear all
%%
A=[0 1 0 0 0;
    1 0 1 0 0;
    0 1 0 1 0;
    0 0 1 0 0;
    0 0 0 0 0];
plot(graph(A))
title('Graph')
%% MHRW
maxiter=20;
restartProb=0.5;
P0=RWR_p(A);
P1=MHRW_p(A);
P2=IMRWR_p(A);
P3=ISLRWR_p(A);
S0=RWR(A, maxiter, restartProb);
S1=MHRW(A, maxiter, restartProb);
S2=IMRWR(A, maxiter, restartProb);
S3=ISLRWR(A, maxiter, restartProb);