function Q = ISLRWR(A, maxiter, restartProb)
	n = size(A, 1);
    %% Compute transition probability (SL)
	A = A + diag(sum(A) == 0);
	renorm = @(M) bsxfun(@rdivide, M, sum(M));
	P = renorm(A);

	%% Self-loop random walk with restart
	restart = eye(n);
	Q = eye(n);
	for i = 1 : maxiter
		Q_new = (1 - restartProb) * P * Q + restartProb * restart;
		delta = norm(Q - Q_new, 'fro');
		Q = Q_new;
		if delta < 1e-6
			% Converged			
			break;
        end
    end   
end
