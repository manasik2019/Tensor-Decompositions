%Singular Value Decomposition

%rehsaping 3D tensor into [22, 22*672] array  
[tensor1,DimXf] = nshape(tensor,1);
%econ to remove non needed zero elements
[u,s,v]=svd(tensor1, 'econ');


%constructing the tensor from the decomposed components
%q=@(n) u(:,1:n)*s(1:n,1:n)*v(:,1:n)';
%q=@(n) u(:,n)*s(n,n)*v(:,n)';

%check the mse
%mse1 = mse(tensor1,q(1))
%mse6 = mse(tensor1,q(6))

%plotting sigmas
x = 1:1:length(s); y= diag(s);

figure(1), plot(x, y, 'b*'), xticks(0:1:22), title('Singular Values', 'FontSize',12)

%figure (2), imagesc(tensor1), colorbar,xticks(0:96:672), xticklabels(0:1:7), xlabel(' 7 days'), ylabel('Traffic Between Countries'), title('Exchanged Traffic over time')%, set(gca, 'clim', [-50000 590324])

%for k = 1 : 10
 %   figure(k+2), imagesc(q(k)), colorbar, xticks(0:10:120), xlabel(' 116 days'), ylabel('Traffic Between Countries'), title('Component no. ', k)%, set(gca, 'clim', [-50000 590324])
%end

