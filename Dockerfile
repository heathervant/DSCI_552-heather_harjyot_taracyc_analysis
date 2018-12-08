# Dockerfile

# Harjyot and Heather, Nov 2018
# Taracyc Ocean Virus Analysis


# Using docker, this file creates an environment called `hkaur112/taracyc_ocean_virus_analysis`
# to run the entire data analysis pipeline

# Usage:
# To reproduce analysis:
# `docker run --rm -e PASSWORD=test -v PATH_ON_YOUR_COMPUTER:/home/rstudio/taracyc_analysis hkaur112/taracyc_ocean_virus_analysis make -C 'home/rstudio/taracyc_analysis' all`
#
# To remove files created:
# `docker run --rm -e PASSWORD=test -v PATH_ON_YOUR_COMPUTER:/home/rstudio/taracyc_analysis hkaur112/taracyc_ocean_virus_analysis make -C 'home/rstudio/taracyc_analysis' clean`

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse


# Install R packages

RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('car')"
RUN Rscript -e "install.packages('ggpubr')"
