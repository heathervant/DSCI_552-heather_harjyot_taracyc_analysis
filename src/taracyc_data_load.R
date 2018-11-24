# taracyc_data_load.R

# Harjyot and Heather, Nov 2018
# Taracyc Ocean Virus Analysis  


# This script reads the dataset from a url
# This script takes in two arguments, the link for reading dataset and 
# file path for storing the data loaded.


# Rscript src/data_load.R https://media.githubusercontent.com/media/HarjyotKaur/Data_Taracyc_Analysis/master/data/MASTERTABLE.txt data/data_load.csv





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
