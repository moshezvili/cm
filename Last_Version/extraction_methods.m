% Helper methods from Matlab

% Fast fourier transform
% Y = fft(X)  ----> . Converts time series data frequency domain data

% Discrete Fourier Transform
% [cA,cD] = dwt(X,'wname') ----> approximation coefficients vector cA and detail coefficients vector cD, wname is wavelet name
% https://www.mathworks.com/help/wavelet/ref/dwt.htmSl https://www.mathworks.com/help/wavelet/ref/wfilters.html

% Maximum frequency from FFT Output
function features =  extraction_methods(X)
signal_mean = mean(X);
signal_max = max(X);
signal_min = min(X);
maxfft = maxFFT(X);
wfl = waveform_length(X);
rms = root_mean_square(X);
[mpf,sdf] = mean_power_f(X);
ec = energy_consumption(X);
%hamm = hamming_window(X);
features ={signal_mean,signal_max,signal_min,maxfft,wfl,rms,mpf,sdf,ec,};
end


function feature = maxFFT(X)
  feature = max(fft(X));
end

% Zero crossing rate
function feature = zero_crossing_rate(X)
  feature = sum(abs(diff(X>0)))/length(X);
end

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

%Hamming window - start
function feature = hamming_window(x)
  feature = hamming(x);
end
%hamming window - end