function [predict,fall_time] = main(acc,bar)
% function [predict,fall_time] = main(acc,baro)
% INPUT :
%        acc = Nx4 matrix , include t,x,y,z .
%        baro = Nx3  ,include t,Pa,Temp
%  OUTPUT: predict : 0 or 1 
%          fall_time : timestamp or -1 in case of 0 predcition

% data extraction : 
%  acc data
g = 16000;
acc_t = acc(:,1);
acc_x = acc(:,2);
acc_y = acc(:,3);
acc_z = acc(:,4);
% normalized data to -1 <-> 1 
acc_x = acc_x/g;
acc_y = acc_y/g;
acc_z = acc_z/g;
% calc mag from x,y,z
acc_mag = sqrt(acc_x^2 + acc_y^2 + acc_z^2) - 1 ;

% baro data 
bar_t = bar(:,1);
bar_p = bar(:,2);
bar_temp = bar(:,3);

% vars
len = length(acc_mag);
candidats = [];
step = 25;
window_l = 54*60; % one min window
i = 1;
while i <= len - window_l
    window = i:i+(54)*60;
    t = acc_t(window);
    x = acc_x(window);
    y = acc_y(window);
    z = acc_z(window);
    mag = acc_mag(window);
    bool = autoRef(t,x,y,z,mag);
    
    if bool
       features = getFeatures(t,x,y,z,mag,t_bar,bar,temp); 
        [predict,fall_time] = class(features) ;
        break
    end
    i = i+step;
end






end