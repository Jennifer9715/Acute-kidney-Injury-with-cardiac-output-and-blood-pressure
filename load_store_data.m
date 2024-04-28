clear;

% create a list for all the ".dat" file
% rootdir = '/Volumes/Drive/mimic3wdb-matched-1.0.physionet.org/matched/matched';
% dirData = dir(fullfile(rootdir, '**/*.dat'));

% load data and store them
% [signal, Fs, tm] = rdsamp('mitdb/100', 1);
record = readtable('/Volumes/Drive/mimic3wdb-matched-1.0.physionet.org/matched/matched/RECORDS-waveforms',ReadVariableNames=false, Delimiter='');

% record_1_ex = 'mimic3wdb-matched-1.0.physionet.org/matched/matched/p00/p000107/p000107-2124-01-10-05-53';
% record_1_content_ex = wfdbdesc(record_1_ex);
% record_1_dat_ex = rdsamp(record_1_ex, 3);
% 
% slash_idx = strfind(record_1_ex, '/');
% last_slash_idx = slash_idx(end);
% record_1_name = extractBetween(record_1_ex, last_slash_idx+1, strlength(record_1_ex));
% 
% record_name = char(fullfile('waveform_data_mat', strcat(record_1_name,'.mat')));
% save(record_name, 'record_1_dat_ex');


record_full_path = strcat('mimic3wdb-matched-1.0.physionet.org/matched/matched/', record.Var1);

for i = 21591:size(record_full_path, 1)
    record_path = char(record_full_path(i));
    record_content = wfdbdesc(record_path);

    slash_idx = strfind(record_path, '/');
    last_slash_idx = slash_idx(end);
    record_name = extractBetween(record_path, last_slash_idx+1, strlength(record_path));

    % find if ABP or ART is measured, both represent arterial blood pressure
    % get the index of this measurement
    if any(strcmpi({record_content.Description}, 'ABP'))
        idx = strcmpi({record_content.Description}, 'ABP');
    elseif any(strcmpi({record_content.Description}, 'ART'))
        idx = strcmpi({record_content.Description}, 'ART');
    elseif (record_content == "")
        sprintf('i = %1.0f, empty file %s.', i, char(record_name))
        continue
    else
        sprintf('i = %1.0f, no ABP/ ART found in file %s.', i, char(record_name))
        continue;

    end

    record_data = rdsamp(record_path, find(idx));

    file_name = char(fullfile('waveform_data_mat', strcat(record_name,'.mat')));
    save(file_name, 'record_data');

end
