function P = ISLRWR_p(A, maxiter, restartProb)
	n = size(A, 1);
    %% Compute transition probability (SL)
	A = A + diag(sum(A) == 0);
	renorm = @(M) bsxfun(@rdivide, M, sum(M));
	P = renorm(A);

