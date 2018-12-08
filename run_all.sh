# run_all.sh


# This driver script completes the textual analysis of


# Usage: bash run_all.sh


# Read Data from URL
echo "Loading Data"
Rscript src/taracyc_data_load.R https://raw.githubusercontent.com/HarjyotKaur/Data_Taracyc_Analysis/master/data/MASTERDATA.txt data/taracyc_data.csv
wait $!

# Making Plots
echo "Creating EDA Plots and Cleaning Data"
Rscript src/taracyc_data_explore_clean.R data/taracyc_data.csv results/figures data/taracyc_data_cleaned.csv
wait $!

# Running Analysis
echo "Running Analysis"
Rscript src/taracyc_data_analysis.R data/taracyc_data_cleaned.csv results/taracyc_results.csv
wait $!

# Summarizing Results
echo "Summarizing Results"
Rscript src/taracyc_results.R data/taracyc_data_cleaned.csv results/figures/fig7_results.png
wait $!

# Making Report
echo "Generating Report"
Rscript -e "rmarkdown::render('doc/taracyc_report.Rmd')"
wait $!

# Completion Message
echo "Process Completed"
