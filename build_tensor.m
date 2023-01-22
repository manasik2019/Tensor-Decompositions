%Initialize an empty 3D array
tensor = [];


% Get a list of all csv files in the current folder, or subfolders of it.
fds = fileDatastore('G:\My Drive\Theis\Data Challenge\Daily\*.csv', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);


% Loop over all csv files reading them in and build the tensor.
for k = 1 : numFiles
    A=csvread(fullFileNames{k}, 1,1); %supress the 1 row and cloumn
    % contatenate csv files into 3D Tensor
    tensor = cat(3,tensor,A);
end


%Get the countries names
list=readtable('G:\My Drive\Theis\Data Challenge\Daily\20050504.csv',VariableNamingRule='preserve');
countries = list.Properties.VariableNames;

%Plot the traffic evolution of each country over time
for k = 1 : 22
    B=permute(tensor(k,:,:),[2 3 1]);
    figure(k );
    %caxis([-10*10^6 20*10^6])
    imagesc(B)
    str = strcat('Traffic Evolution For',{' '}, countries(k+1));
    title(str);
end


