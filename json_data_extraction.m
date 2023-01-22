clc 
clear

%% Navigate to directory with JSON (.json) files and create envrionment

wd = '/Users/kospap/Documents/2022_Q4_FS/json/';

% mkdir('data/'); % Create data folder where all the .json files are stored
% mkdir('results/'); % Create results folder containing the .mat file and the CSV file with data from all .json files
% mkdir('scripts/'); % Create script folder containing the script to extract json file data


% movefile('json_data_extraction.m','scripts/');
subjs = dir('*.json'); % Create structure containing all .json file in folder

% Loop over all the json files to move them into the data folder
% for f = 1:numel(subjs(:,1))
%     movefile(subjs(f,1).name, 'data/');
% end

path2data = fullfile(wd, 'data');
path2scripts = fullfile(wd, 'scripts');
path2results = fullfile(wd, 'results');

%% Extract all .json files

filelist = dir(sprintf('%s/*.json', path2data)); % Only takes files with .json extension in data directory
files = struct2cell(filelist); 
files_T = files.';
names = files(1,:);

%% Extract all components for each subject

names_new = []; % Array containing the filenames without the .json extension

% Pipeline to read .json files and extract data from them

for f = 1:numel(files_T(:,1))
    filename = string(files_T(f,1));
    fid = fopen(sprintf('%s/%s' ,path2data ,filename));
    raw = fread(fid, inf);
    str = char(raw');
    fclose(fid);
    name = extractBefore(filename, '.'); % Removes file extension from filename
    names_new = [names_new, name]; % Add new filename without extension array

    data = jsondecode(str);
    result.(name) = data; % Save .json data for each subject into the result structure
end

%% Select only desired components from all components extracted


% Initialize selected variables

MFD = []; 
ET = [];

% Extract selected variables

for n = 1:numel(names)
    name = string(extractBefore(names(n), '.'));
    
    MFD = [MFD; result.(name).MagneticFieldStrength]; % Extracts Magnetic Field Strength
    ET = [ET; result.(name).EchoTime]; % Extracts the Echo time

end

%% Save data

disp('SAVING RESULTS')

StructureName='result'; % Select structure to save that contains the selected variables
save([path2results filesep StructureName], 'result','-v7.3');

% Create file to save the data to it

json_data=table(MFD,ET,...
'VariableNames',{'Magnetic_Field_Strength', 'Echo_Time'});
json_data.Properties.RowNames = names_new;

Expression=[path2results filesep 'json_data.csv'];
writetable(json_data, Expression, WriteRowNames=true);

disp('RESULTS SAVED')


