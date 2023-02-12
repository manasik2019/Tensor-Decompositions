%Initialize an empty 3D array
tensor = [];


% Get a list of all csv files in the current folder, or subfolders of it.
fds = fileDatastore('G:\My Drive\Theis\Data Challenge\Results2\*.csv', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
weekfileNames = fullFileNames(2594:3937);
numFiles = length(weekfileNames);

%extract the dates
newStr = repmat({''}, 1344, 1);
for a = 1:numFiles
    string = weekfileNames(a);
    newStr(a) = extractBetween(string,"Results2\2005",".csv");
end

% Loop over all csv files reading them and build the tensor.
for k = 1 : numFiles
    A=csvread(weekfileNames{k}, 1,0); %supress the 1 row
    % contatenate csv files into 3D Tensor
    tensor = cat(3,tensor,A);
end

%Get the countries names
list=readtable('G:\My Drive\Theis\Data Challenge\Daily\20050504.csv',VariableNamingRule='preserve');
countries = list.Properties.VariableNames;

%Plot the traffic evolution of each country over time
for k = 1 : 1344
    B=permute(tensor(k,:,:),[2 3 1]);
    figure(k );
    imagesc(B), colorbar, xticks(0:96:1344), xticklabels(newStr(1:96:1344)), xlabel('One week traffic'), yticks(1:22), yticklabels(countries(2:end))
    str = strcat('Traffic Evolution For',{' '}, countries(k+1));
    title(str);
    %saveas(figure(k ), fullfile('G:\My Drive\Theis\Data Challenge\Plots\Daily\2 weeks traffic',strcat(char(str), '.png')));
   %colormap("colorcube")
end
