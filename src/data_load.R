# data_load.R

# Harjyot and Heather, 17 Nov 2018

# Tara Oceans Project: Master Table



# This script loads the dataset from a url

# This script takes no arguments.

#

# Usage: Rscript data_load.R


# Read in data


master_data <- read.delim("https://media.githubusercontent.com/media/HarjyotKaur/Data_Taracyc_Analysis/master/data/MASTERTABLE.txt")

head(master_data)