# Blood-Biometrics
Spirometry, Pulse Oximetry, and Blood Pressure Analysis 
 Lung Volumes | PPG Data | Blood Pressure Data
:-:|:-:|:-:
![Spirometry_data_lung_volume](https://github.com/user-attachments/assets/34dc1018-e28e-481d-8b9d-50d99f862149) | ![ppg_data](https://github.com/user-attachments/assets/08f01c9e-f3bb-47e1-ac96-fc80b00a780e) | ![BP_data](https://github.com/user-attachments/assets/71bcab8b-6337-42a4-9cef-1eab77888017)

# Data Description
Flow_rate_data.mat : Flow rate data (L) between the lungs and the atmosphere collected with a spirometer.  
  
Breathing_data.csv : Heart rate, photoplethsmography (PPG), and saturation of peripheral oxygen (spO2) collected with a pulse oximeter connected to BioRadio. Data is collected while the subject is in a relaxed state breathing normally for ~ 20 seconds, then holding their breath for ~ 20 seconds.   
  
BP_data.csv : Blood pressure data (mmHg) collected with a blood pressure cuff connected to BioRadio. Data is collected using a standrd procedure for blood pressure measurement.  

# Code Description
In section 1, various respiratory metrics (tidal volume, forced vital capacity, 1-second forced expiratory volume) from Flow_rate_data.m
  
In section 2, pulse oximetry and blood pressure data are plotted to find relevant time periods from the collection process.  



