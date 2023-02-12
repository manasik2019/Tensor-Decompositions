%PARAFAC Decomposition

%The tensor rank
r = 3; 

model=parafac(tensor,r, [], [2 2 2]); %imposing non-negative values
[A1,B1,C1]=fac2let(model);


for i=1:r  

    figure(i), sgtitle(['Component no.', num2str(i)])
    %subplot(4,1,1),imagesc(A1(:,i)*B1(:,i)'), colorbar,xticks(1:22), xlabel(''), ylabel('Traffic Between Countries')
    subplot(1,2,1), imagesc(A1(:,i)*B1(:,i)'), colorbar,xticks(1:22), yticks(1:22), title('Traffic Between Countries'), xticklabels(countries(2:end)), yticklabels(countries(2:end)) % set(gca, 'clim', [0 110369719])
    subplot(1,2,2), fnplt( csapi([1:1344], C1(:,i)), 'LineWidth', [1], 'g'),  xticks(1:96:1344), xticklabels(newStr(1:96:956)), title('Time Space') % axis([1 120 -0.2 1]) % set(gca, 'YScale', 'log')
 

end




