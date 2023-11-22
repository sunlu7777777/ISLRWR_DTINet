function Q=IMRWR(A, maxiter, restartProb)
[n,~]=size(A);
P=zeros(size(A));
k=degree(graph(A));
%% Compute transition probability (MH)
for i=1:n
    for j=1:n
        if i~=j
            if A(i,j)
                P(i,j)=min(1,k(i)/k(j))/k(i);
            end
        end
    end
    P(i,i)=1-sum(P(i,:));
end
%% Optimized transition probability (IM)
P_new=zeros(size(P));
for i=1:n
    neibor=find(A(i,:)~=0);
    kx=sum(k(neibor));
    for j=1:n
        if i~=j
            if A(i,j)
                P_new(i,j)=min(1,k(i)/k(j))/k(i)+k(j)/kx*P(i,i);
            end
        end
    end
    P_new(i,i)=0;% Delete self-loop probability
end
%% Random walk with restart
restart=eye(n);
Q = eye(n);
for i=1:maxiter
    Q_new = (1 - restartProb) * P_new * Q + restartProb * restart;
    delta = norm(Q - Q_new, 'fro');
    Q = Q_new;
    if delta < 1e-6
        % Converged
        break;
    end
end




