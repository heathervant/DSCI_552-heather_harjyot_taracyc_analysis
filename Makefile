

data/taracyc_data.csv: $(https://media.githubusercontent.com/media/HarjyotKaur/Data_Taracyc_Analysis/master/data/MASTERTABLE.tx) src/taracyc_data_load.R
	Rscript src/taracyc_data_load.R https://media.githubusercontent.com/media/HarjyotKaur/Data_Taracyc_Analysis/master/data/MASTERTABLE.txt data/taracyc_data.csv

taracyc_data_cleaned.csv: src/taracyc_data_explore_clean.R data/taracyc_data.csv results/figures
	Rscript src/taracyc_data_explore_clean.R data/taracyc_data.csv results/figures data/taracyc_data_cleaned.csv

results/taracyc_results.csv: data/taracyc_data_cleaned.csv src/taracyc_data_analysis.R
	Rscript src/taracyc_data_analysis.R data/taracyc_data_cleaned.csv results/taracyc_results.csv

results/figures/fig7_results.png: src/taracyc_results.R data/taracyc_data_cleaned.csv
Rscript src/taracyc_results.R data/taracyc_data_cleaned.csv results/figures/fig7_results.png

doc/taracyc_report.Rmd: 
Rscript -e "rmarkdown::render('doc/taracyc_report.Rmd')"
