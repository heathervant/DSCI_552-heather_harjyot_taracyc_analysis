# taracyc_data_analysis.R

# Harjyot and Heather, Nov 2018
# Taracyc Ocean Virus Analysis


# This script analyzes the loaded and cleaned data from the data/taracyc_data_cleaned.csv stored in the data folder
# This script takes in two arguments, the input and output


# Usage: Rscript src/taracyc_data_analysis.R data/taracyc_data_cleaned.csv results/taracyc_results.csv

#Load Librarries
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(car))
suppressPackageStartupMessages(library(ggpubr))

# Read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]


# Define main function
main <- function() {

 
 #Read data
 wrangled_data <- read.csv(input)

 # Two-way ANOVA with interaction effect. Using type III ANOVA, since our data has
 # unequal numbers of subjects in each group.
 res.aov3 <- aov(RPKM ~ LEVEL1 * DEPTH, data = wrangled_data)
 results <- broom::tidy(Anova(res.aov3, type = "III"))

 write.csv(results, file = output)

}

# Call main function
main()