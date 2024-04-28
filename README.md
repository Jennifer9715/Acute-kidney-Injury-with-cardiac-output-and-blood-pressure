# Acute-kidney-Injury-with-cardiac-output-and-blood-pressure

This project is for the thesis "Engineering a Large Matched MIMIC-III ICU Waveform Dataset with Clinical Covariates to Determine the Association Between Hemodynamic Variables and Acute Kidney Injury" written by Xiaofei Qu. 

This project is to manage the MIMIC-III dataset to engineer the waveform cohort to conduct time series observational research related to AKI. The code that were used to analyze the data and used to generate the tables and statistics that were included in the thesis were upload to this github.

## Description

This repository includes code, tables, and figures. 
Code: 
"Data_descriptions.Rmd" 
* the code includes the demographics for MIMIC-III patient (gender, age, and ethnicity)
* the code includes the tables for hospital admissions and ICU stays, frequencies for each number of hospital admissions and ICU stays
* the code generates "age_plot.jpg", "gender_plot.jpg", "ethnicity_plot.jpg", "hospital_data_with_timefreq.csv", "icu_data_with_time_and_freq.csv", "hospital_freq_plot.jpg", "icu_freq_plot.jpg"

"Creatinine.Rmd"
* the code includes the creatinine with serum creatinine measurements with mean, standard deviation, and range
* the code includes the combined table which includes both creatinine measurements, hospital admissions, ICU stays, and whether the measurement for creatinine was taken within the ICU admission's range
* the code generates "combine_creatinine_data.csv"

"load_store_data.m"
* the code includes loading waveform data, filtering out the ones with arterial blood pressure measurements(ABP or ART), store them as ".mat" file


## Authors

Contributors names and contact info

* Xiaofei qu
