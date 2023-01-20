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
    tensor = cat(3,tensor,A)
end
