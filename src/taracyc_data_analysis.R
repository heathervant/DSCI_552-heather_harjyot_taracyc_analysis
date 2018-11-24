# taracyc_data_load.R

# Harjyot and Heather, Nov 2018
# Taracyc Ocean Virus Analysis  


# This script reads the dataset from a url
# This script takes in two arguments, the link for reading dataset and 
# file path for storing the data loaded.


# Rscript src/taracyc_data_analysis.R data/taracyc_data_cleaned.csv results/taracyc_results.csv


#load dependencies
library(tidyverse)
library(ggpubr)
library(car)


# Read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]

# define main function
main <- function() {
  
  # Read in data
  wrangled_data <- read.csv(input)
  res.aov3 <- aov(RPKM ~ LEVEL1 * DEPTH, data = wrangled_data)
  results <- broom::tidy(Anova(res.aov3, type = "III"))
  
  write.csv(results, file = output)
  
}

# call main function
main()
