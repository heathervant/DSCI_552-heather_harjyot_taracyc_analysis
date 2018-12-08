
# Makefile
# Date: November 30, 2018

# This script creates the entire data analysis project pipeline
# Running all scripts and cleaning outputs created by the script

# Usage: For running the enitre pipeline use "make all"
# Usage: For cleaning the ouputs created use "make clean"



# Run all scripts

all: doc/taracyc_report.md

# Read Data from URL
data/taracyc_data.csv: $(https://raw.githubusercontent.com/HarjyotKaur/Data_Taracyc_Analysis/master/data/MASTERDATA.txt) src/taracyc_data_load.R
	Rscript src/taracyc_data_load.R https://raw.githubusercontent.com/HarjyotKaur/Data_Taracyc_Analysis/master/data/MASTERDATA.txt data/taracyc_data.csv
		$(info Loading Data)

# Making Plots
data/taracyc_data_cleaned.csv results/figures: src/taracyc_data_explore_clean.R data/taracyc_data.csv
	Rscript src/taracyc_data_explore_clean.R data/taracyc_data.csv results/figures data/taracyc_data_cleaned.csv
	 	$(info Creating EDA Plots and Cleaning Data)

#  Running Analysis
results/taracyc_results.csv: data/taracyc_data_cleaned.csv src/taracyc_data_analysis.R
	Rscript src/taracyc_data_analysis.R data/taracyc_data_cleaned.csv results/taracyc_results.csv
		$(info Running Analysis)

# Summarizing Results
results/figures/fig7_results.png: src/taracyc_results.R data/taracyc_data_cleaned.csv
	Rscript src/taracyc_results.R data/taracyc_data_cleaned.csv results/figures/fig7_results.png
	 	$(info Summarizing Results)

# Making Report
doc/taracyc_report.md: doc/taracyc_report.Rmd data/taracyc_data_cleaned.csv results/figures results/taracyc_results.csv results/figures/fig7_results.png
	Rscript -e "rmarkdown::render('doc/taracyc_report.Rmd')"
	 	$(info Generating Report)

clean:

	$(info Cleaning all outputs)
	rm -f data/taracyc_data.csv
	rm -f data/taracyc_data_cleaned.csv results/figures/*.png
	rm -f results/taracyc_results.csv
	rm -f doc/taracyc_report.md doc/taracyc_report.html
