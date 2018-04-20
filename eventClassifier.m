function eventId = eventClassifier(acc, acc_fs, baro, baro_fs, temp1, temp1_fs, temp2, temp2_fs)
% input:  acc: 4xN 2D-array (first column is the time stamps, columns 2-4 are the x,y,z acceleration measurements)  
%         acc_fs: acceleration sampling frequency (in Hz)   
%         baro: 2xN 2D-array (first column is the time stamps, second column is the barometer measurements)  
%         baro_fs: barometer sampling frequency (in Hz)
%         temp1: 2xN 2D-array (first column is the time stamps, second column is the upper temp sensor measurements)  
%         temp1_fs: temperature sampling frequency (in Hz) 
%         temp2: 2xN 2D-array (first column is the time stamps, second column is the bottom temp sensor measurements)  
%         temp2_fs: temperature sampling frequency (in Hz)
% output: eventId [4 - walking, 5 - sitting, 6 - sitting and typing,
%                  7 - going up the stairs, 8 - going down the stairs,
%                  9 - passanger in a vehicle, 10 - walking with sensor hanging]

%% write your code here
features = {@maxFFT,@zero_crossing_rate,@waveform_length,@root_mean_square,@mean_power_f,@vector_mean,@energy_consumption,@hamming_window};
for i = 1:length(features)
    features{i}(1:1:100)
end
% M = containers.Map(features,valueSet) %make map from keys to values





%% return estimated event id
eventId = 999;

end
