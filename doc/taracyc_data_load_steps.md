## Dataset

We will be analyzing the metaviriome data collected from the Tara Oceans Project. The Tara Oceans Project collected water samples data worldwide for shotgun metagenomic sequencing, and this data was then mapped to metabolomic pathways. This is a real-world dataset, users can play, explore, and download the genome dataset from [Taracyc's R Shiny App](http://oganm.com/shiny/taracyc/)

Downloading data from the R Shiny App is a nine-step manual process. For ease and reproducibility of the analysis, the master table downloaded has been stored in the repository [Data_Taracyc_Analysis](https://github.com/HarjyotKaur/Data_Taracyc_Analysis) by using Github Large File Storage. The steps followed for data download have been outlined in the repository.

<br>

#### Data Load in R

```{R load data}
master_data <- read.delim("https://media.githubusercontent.com/media/HarjyotKaur/Data_Taracyc_Analysis/master/data/MASTERTABLE.txt")

head(master_data)
```
