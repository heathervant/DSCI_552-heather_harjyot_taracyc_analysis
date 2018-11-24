# taracyc_results.R
# Harjyot and Heather, Nov 2018
# Taracyc Ocean Virus Analysis  


# This script analyzes the loaded and cleaned data from the data/taracyc_data_cleaned.csv 
# and create a results errorbar plot with the mean DNA abundance levels for each pathway and depth 
# This script takes in two arguments, the input and output.
# The input is the name of the cleaned data csv file
# The output is the name of the newly generated results figure, 
# stored in the figures folder within the results folder


# Usage: Rscript src/taracyc_results.R data/taracyc_data_cleaned.csv results/figures/meanRPKM_figure.png 

# Read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]


# define main function
main <- function() {
  
  #load packages 
  library(tidyverse)
  library(car)
  library(ggpubr)
  
  #Read data
  wrangled_data <- read.csv(input)
  
  #set alpha to 0.05
  alpha = 0.05
  #create plots with means and errorbars
  depth_plot <- wrangled_data %>%
    #group by pathway name and depth
    group_by(LEVEL1, DEPTH) %>% 
    #calculate mean RPKM values and the standard error
    summarize(mean_RPKM = mean(RPKM),
              se        = sd(RPKM)/sqrt(length(RPKM))) %>%
    #plot mean RPKM values with errorbars for each pathway and facet by depth
    ggplot(aes(x = LEVEL1)) +
    geom_point(aes(y = mean_RPKM), colour = "red") +
    facet_wrap(~DEPTH) +
    # use 95% confidence intervals to create errorbars
    geom_errorbar(aes(ymin = mean_RPKM + qnorm(alpha/2)*se,
                      ymax = mean_RPKM - qnorm(alpha/2)*se),
                  colour = "red",
                  width  = 0.2) +
    theme_bw() +
    labs(x = "Biological Pathway", y = "DNA Abundance (RPKM)") +
    theme(axis.text.x=element_text(angle=90,hjust=1)) +
    ggtitle("Mean DNA abundance accross depths and pathways")
  
}

# call main function
main()
