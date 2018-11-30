

data/taracyc_data.csv: $(https://media.githubusercontent.com/media/HarjyotKaur/Data_Taracyc_Analysis/master/data/MASTERTABLE.tx) src/taracyc_data_load.R
	Rscript src/taracyc_data_load.R https://media.githubusercontent.com/media/HarjyotKaur/Data_Taracyc_Analysis/master/data/MASTERTABLE.txt data/taracyc_data.csv

taracyc_data_cleaned.csv: src/taracyc_data_explore_clean.R data/taracyc_data.csv results/figures
	Rscript src/taracyc_data_explore_clean.R data/taracyc_data.csv results/figures data/taracyc_data_cleaned.csv
