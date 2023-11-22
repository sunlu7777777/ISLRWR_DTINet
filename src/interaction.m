drugs = zeros(708)
proteins = zeros(1512)
D_P_interaction1 = [drugs,interaction]
D_P_interaction2 = [interaction',proteins]
D_P_interaction = [D_P_interaction1;D_P_interaction2]
%csvwrite('D_P_interaction.csv',D_P_interaction);

G=graph(D_P_interaction)
plot(G)