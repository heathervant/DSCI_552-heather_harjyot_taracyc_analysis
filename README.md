## Proposal - DSCI 522 Data Science Workflows


Team Information

| Name | CWL |
|---|---|
| Harjyot Kaur | hkaur112 |
| Heather Van Tassel | hvan |


-----------------------------------------------------------------------------------
## Viral Voyager: Ocean Viral DNA analysis
-----------------------------------------------------------------------------------

<br>

## Dataset

We will be analyzing the metaviriome data collected from the Tara Oceans Project. The Tara Oceans Project collected water samples data worldwide for shotgun metagenomic sequencing, and this data was then mapped to metabolomic pathways. This is a real-world dataset, users can play, explore, and download the genome dataset from [Taracyc's R Shiny App](http://oganm.com/shiny/taracyc/)

Downloading data from the R Shiny App is a nine-step manual process. For ease and reproducibility of the analysis, a data repository [Data_Taracyc_Analysis](https://github.com/HarjyotKaur/Data_Taracyc_Analysis) has been created to store the raw master data. Since the data file is too large, we have used [Github Large File Storage](https://git-lfs.github.com/). For further information, the steps followed for downloading this data have been outlined in the same repository.

#### Data Load in R

Data Import script is present in the `src` directory: [Link to Script](https://github.com/HarjyotKaur/DSCI_522_heather_harjyot_taracyc_analysis/blob/master/src/data_load.R)

Data Import Output:
![](/img/Data_Load.PNG)

| Dataset Features | |
|---|---|
| Records | 134097 |
| Variables | 21 |
| Data Type | Categorical and Numerical |

<br>

## Research Question

Does the mean abundance of viral DNA sequences differ across biological pathways? Does the mean abundance of viral DNA sequences differ across ocean depth levels? Does the mean abundance of viral DNA sequences of the biological pathways differ across ocean depth levels?

#### Type of Question

This is an inferential question, as we are using a dataset that has ~300 ocean samples taken from all over the world, to make conclusions about the ocean's viral population.

<br>

## Plan of Action

The goal is to carry out a Two-Way ANOVA (Factorial Analysis) to compare the main effects and interaction effects between biological pathways and ocean depth levels on the abundance of viral DNA sequences.

| Variable Name | Type | Description |
|---|---|---|
| RKPM | Continuous | Reads per kilobase of transcript per million mapped reads |
| LEVEL1 | Categorical | Biological Pathways |
| Depth | Categorical |  Levels of ocean depth |


#### Analysis Overview

We intend to analyze the data using R with RStudio.

__Data Wrangling and Exploratory Data Analysis__

The variables of interest for this analysis are, abundance of viral DNA sequences (dependent variable), biological pathways and ocean depth levels (independent variables). We will explore these variables individually.
We will check for missing values, outliers and explore descriptive statistics for each variable of interest. We will also, visualize the mean abundance of viral DNA sequences across different biological pathways and  ocean depth levels using a heatmap.

__Hypothesis Testing__              

Two-Way ANOVA has certain assumptions that should not be violated. We will start with validating the following assumptions:
* Dependent variable should be measured at the continuous level
* Two independent variables should each consist of two or more categorical, independent groups.
* Independence of observations
* No significant outliers
* All samples were drawn from normally distributed populations
* Homogeneity of variances (among the groups should be approximately equal). *We will be using either Levene's test or Brown & Forsythe's test*

If none of the assumptions are being violated, we will set up our hypothesis framework.

__Testing Main Effects__:

* Factor 1: Biological Pathways

   H<sub>0</sub>: There is no difference in the mean abundance of viral DNA sequences across biological pathways    
   H<sub>A</sub>: At least two of the biological pathways differ in terms of mean abundance of viral DNA sequences

* Factor 2: Ocean Depth

  H<sub>0</sub>: There is no difference in the mean abundance of viral DNA sequences across ocean depth levels  
  H<sub>A</sub>: At least two of ocean depth levels differ in terms of mean abundance of viral DNA sequences     

__Testing Interaction Effect__:

* Factors: Biological Pathways & Ocean Depth

  H<sub>0</sub>: There is no significant interaction between biological pathways and ocean depth levels in terms of mean abundance of viral DNA sequences    
  H<sub>A</sub>: There is a significant interaction between biological pathways and ocean depth levels in terms of mean abundance of viral DNA sequences   

We will be checking the above three set of hypothesis at  5% Level of Significance. Further, we will compute the F-Statistic for testing each set of hypothesis. Based on the statistics computed we will then observe whether we reject or fail to reject the null hypothesis.

<br>


## Summarizing Results

We will summarize results of the analysis outlined above using tables, illustrating the statistics computed for the set of hypothesis. To showcase the impact of interaction effects of the two factors (biological pathways and ocean depth levels) visually, we will be using a combination of error bar (confidence intervals of mean abundance of viral DNA sequences) and jitter plots (sample spread) and faceting it on one factor to produce a series of plot for comparison.
