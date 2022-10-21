% HDF5 reader 
% Input : .H5 file 
% Output : 
%   1: Name and index of datasets found.
%   2: Displays the dataset ( returns a struct if dataset is empty )
% Created by : Ajai Singh using MATLAB Version: 9.11.0.1769968 (R2021b)
% Last edited : '25-Jul-2022 18:41:49'



clear;clc;
H5File = uigetfile('*.h5','Select H5 file');
info = h5info(H5File);
DataSets = info.Datasets;
disp([num2str(length(DataSets)),' Dataset(s) Found : ']);
Dname = {DataSets.Name};

YorN = 'Y';
while( strcmpi('Y',YorN) )
    DisplayDataset(Dname);
    IndexNum = input('Enter index number to read or 0 to quit : ');
    if(IndexNum == 0 || IndexNum > length(Dname))
        break
    else
        h5read(H5File,strcat('/',Dname{IndexNum}))
    
    end
    YorN = input('Continue reading [ Y / N ] : ','s');
end

function DisplayDataset(Dname)
    for i = 1:length(Dname)
        disp(['[ ',num2str(i),' ] ',Dname{i} ]);
    end
end