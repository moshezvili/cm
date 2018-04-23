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
AccCell = LoadAcc(acc);
if AccCell{1} > 1.6*10^4
    %Magnitued_mean
    if AccCell{2} < 2*10^4
        %Magnitued_max
        eventId= 9;
    else
        if AccCell{9} > 6*10^11
            %energy_consumption
            eventId= 4;
        else
            eventId = 10;
        end
    end
else
    if AccCell{2} > 2*10^4
        %Magnitued_max
        BaromFeatures =  baro(2);
        if (BaromFeatures(end) - BaromFeatures(1))>0
            %Pressure_increase
            eventId = 7;
        else
            eventId = 8; 
        end
        %Barometer features
    else
        if AccCell{7} > 2.41*10^8
            %Magnitude_mean_power_f
           eventId = 6; 
        else
            eventId = 5;
        end
        
    end
end
            
%% return estimated event id

end

%% acc
function AccCell =  LoadAcc(acc)
% Acc features :
acc_x = acc(:,2);
acc_y = acc(:,3);
acc_z = acc(:,4);
Acc_Mag = sqrt(acc_x.^2 + acc_y.^2 + acc_z.^2);
% acc_mag_features :
AccCell =  extraction_methods(Acc_Mag);
end
%%
%%methods
function features =  extraction_methods(X)
signal_mean = mean(X);
signal_max = max(X);
signal_min = min(X);
maxfft = maxFFT(X);
wfl = waveform_length(X);
rms = root_mean_square(X);
[mpf,sdf] = mean_power_f(X);
ec = energy_consumption(X);

features ={signal_mean,signal_max,signal_min,maxfft,wfl,rms,mpf,sdf,ec};
end

%maxFFT
function feature = maxFFT(X)
  feature = max(fft(X));
end


%waveform
function feature = waveform_length(X)
  feature = sum(abs(diff(X)));
end

% Root mean square
function feature = root_mean_square(X)
  feature = rms(X);
end

% Stats of power in frequency domain
function [ mean2, sd] = mean_power_f(X)
  y = fft(X);
  power = abs(y).^2/length(y);
  mean2 = mean(power);
  sd = std(power);
end

%Energy consumption - start
function feature = energy_consumption(x)
  m=fft(x);
  feature=sum(abs(m).^2) / length(m);
end
%Energy consumption - end

