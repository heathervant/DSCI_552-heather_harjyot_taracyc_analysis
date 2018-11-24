# taracyc_data_analysis.R
# Harjyot and Heather, Nov 2018
# Taracyc Ocean Virus Analysis  


# This script analyzes the loaded and cleaned data from the data/taracyc_data_cleaned.csv stored in the data folder
# This script takes in two arguments, the input and output


# Usage: Rscript src/taracyc_data_anaysis.R data/taracyc_data_cleaned.csv results/taracyc_results.csv 
# Usage: Rscript src/taracyc_data_anaysis.R data/taracyc_data_cleaned.csv results/figures/meanRPKM_figure.png 

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
  
  
  # Two-way ANOVA with interaction effect. using type III, since our data has 
  # unequal numbers of subjects in each group.
  res.aov3 <- aov(RPKM ~ LEVEL1 * DEPTH, data = wrangled_data)
  results <- broom::tidy(Anova(res.aov3, type = "III"))
  
  write.csv(results, file = output)
  
  #set alpha to 0.05
  alpha = 0.05
  #create plots with means and errorbars
  (depth_plot <- wrangled_data %>%
      group_by(LEVEL1, DEPTH) %>% 
      summarize(mean_RPKM = mean(RPKM),
                se        = sd(RPKM)/sqrt(length(RPKM))) %>%
      ggplot(aes(x = LEVEL1)) +
      #geom_jitter(data= wrangled_data, aes(y = RPKM), 
       #           alpha=0.2, width=0.1, size=0.5) +
      geom_point(aes(y = mean_RPKM), colour = "red") +
      geom_errorbar(aes(ymin = mean_RPKM + qnorm(alpha/2)*se,
                        ymax = mean_RPKM - qnorm(alpha/2)*se),
                    colour = "red",
                    width  = 0.2) +
      theme_bw() +
      labs(x = "Biological Pathway", y = "DNA Abundance (RPKM)")) +
      facet_wrap(~DEPTH)
      ggsave(output)
  #add dependencies: install.packages("ggpubr")
  
}

# call main function
main()
