function P=RWR_p(A, maxiter, restartProb)
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
