function P=MHRW_p(A)
[n,~]=size(A);
P=zeros(size(A));
k=degree(graph(A));
%% Transition probability (MH)
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