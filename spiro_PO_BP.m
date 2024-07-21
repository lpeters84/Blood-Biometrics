%% Spirometry, Pulse Oximetry, and Blood Pressure 
% Author: Lauryn Peters
% Date: March 23, 2024

clear all; clc; close all;

%% Section 1 - Calculate Respiratory Metrics

load("Flow_rate_data.mat");

time = t'; 
volume = cumtrapz(time, FlowRate); 

figure(1)
plot(time, FlowRate)
title("Flow Rate")
xlabel("Time (s)")
ylabel("Flow Rate (L/s)")

figure(2)
plot(time, volume)
refline(0,0)
title("Volume")
xlabel("Time (s)")
ylabel("Volume (L)")
hold on

% FIND TIDAL VOLUME 
[trough, trough_idx] = findpeaks(-volume, MinPeakProminence=0.1);
[pk, peak_idx] = findpeaks(volume, MinPeakProminence=0.1);

plot(time(trough_idx),volume(trough_idx), "or");
plot(time(peak_idx), volume(peak_idx), "ok")

tidal_peaks = mean(pk(1:3));
tidal_troughs = mean(-1*trough(1:3));
tidal_vol = tidal_peaks - tidal_troughs;

disp('Tidal Volume:')
disp(tidal_vol)

% FIND FORCED VITAL CAPACITY
vc_peak = max(volume);
[vc_trough, min_idx] = min(volume);
FVC = vc_peak-vc_trough;

disp('Forced Vital Capacity (FVC):')
disp(FVC)

% FIND 1-SEC FORCED EXPIRATORY VOLUME
FEV_time = time(min_idx) + 1;
FEV_idx = find(time == FEV_time);
FEV = volume(FEV_idx)-volume(min_idx);

plot(time(min_idx), volume(min_idx), "xm")
plot(time(FEV_idx), volume(FEV_idx), "xm")
hold off

disp('1-second Forced Expiratory Volume (FEV_1):')
disp(FEV)

% FIND RATIO
ratio = FEV/FVC;

disp('FEV_1/FVC ratio:')
disp(ratio)

%% Section 2 - Part A

data_ox = readtable("Breathing_data.csv");
time = (0:0.004:100.044)';

% Determine time points where 
figure(3)
plot(time, data_ox.PPGPOX)
title("PPG Data")
xlabel("Time (s)")
ylabel("PPG (AU)")
xline(22, '-r', {'Start', 'Holding', 'Breath'})
xline(44, '-g', {'Stop', 'Holding', 'Breath'})

figure(4)
plot(time, data_ox.SpO2POX)
title("SpO2 Data")
xlabel("Time (s)")
ylabel("SpO2 (%)")
xline(22, '-r', {'Start', 'Holding', 'Breath'})
xline(44, '-g', {'Stop', 'Holding', 'Breath'})
ylim([97,100])

%% Section 2 - Part B

% load data
dataBP = readtable('BP_data.csv');

% Plotting
figure(5)
plot(dataBP.ElapsedTime, dataBP.BloodPressureBP)
title("Blood Pressure Data")
xlabel("Time")
ylabel("BP (mmHg)")

