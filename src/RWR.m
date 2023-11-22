function Q=RWR(A, maxiter, restartProb)
[n,~]=size(A);
P=zeros(size(A));
k=degree(graph(A));
%% Compute transition probability
for i=1:n
    for j=1:n
        if i~=j
            if A(i,j)
                P(i,j)=1/k(i);
            end
        end
    end
end
%% Random walk with restart
restart=eye(n);
Q = eye(n);
for i=1:maxiter
    Q_new = (1 - restartProb) * P * Q + restartProb * restart;
    delta = norm(Q - Q_new, 'fro');
    Q = Q_new;
    if delta < 1e-6
        % Converged
        break;
    end
end