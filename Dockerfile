# Dockerfile

# Harjyot and Heather, Nov 2018
# Taracyc Ocean Virus Analysis

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse


# Install R packages

RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('car')"
RUN Rscript -e "install.packages('ggpubr')"
