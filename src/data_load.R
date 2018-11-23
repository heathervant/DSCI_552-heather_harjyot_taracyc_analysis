# data_load.R
# Harjyot and Heather, Nov 2018
# Taracyc Ocean Virus Analysis  



# This script loads the dataset from a url
# This script takes two arguments, the link for reading data and 
# output file path for storing the data loaded.


# Usage: Rscript data_load.R





# Read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
link <- args[1]
output <- args[2]

# define main function
main <- function() {
  
  # Read in data
  master_data <- read.delim(link)
  

  write.csv(master_data, file = output)
  
}

# call main function
main()
