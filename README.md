## Propoal - DSCI 522 Data Science Workflows


Team Information

| Name | CWL |
|---|---|
| Harjyot Kaur | hkaur112 |
| Heather Van Tassel | hvan |


-----------------------------------------------------------------------------------
## Viral Voyager: Ocean Viral DNA analysis
-----------------------------------------------------------------------------------


## Dataset

We will be analyzing the metaviriome data collected from the Tara Oceans Project. The Tara Oceans Project collected water samples data worldwide for shotgun metagenomic sequencing, and this data was then mapped to metabolomic pathways. This is a real-world dataset, users can play, explore, and download the genome dataset from [Taracyc's R Shiny App](http://oganm.com/shiny/taracyc/)

Downloading data from the R Shiny App is a nine-step manual process. For ease and reproducibility of the analysis, a data repository has [Data_Taracyc_Analysis](https://github.com/HarjyotKaur/Data_Taracyc_Analysis) has been created to store the raw master data. Since the data is too large, we used [Github Large File Storage](https://git-lfs.github.com/). Further, the steps followed for downloading the data have also been outlined in the repository.

#### Data Load in R

Data Import script is present in the src directory: [Script](https://github.com/HarjyotKaur/DSCI_522_heather_harjyot_taracyc_analysis/blob/master/src/data_load.R)

Data Import Output:
![](/img/Data_Load.PNG)

| Dataset Features | |
|---|---|
| Records | 134097 |
| Variables | 21 |
| Data Type | Categorical and Numerical |

<br>

## Research Question

Does the average abundance of viral DNA sequence differ across biological pathways? Does the average abundance of viral DNA sequence differ across ocean depths? Does the average abundance of viral DNA sequence of biological pathways differ across ocean depths?

#### Type of Question

This is an inferential question, as we are using a dataset that has ~300 ocean samples taken from all over the world, to conclude about ocean's viral populations.

<br>

## Plan of Action

The goal is to carry out a Two-Way ANOVA (Factorial Analysis) to compare the main effects and interaction effects between biological pathways and ocean depth on the abundance of viral DNA sequence.

| Variable Name | Type | Description |
|---|---|---|
| RKPM | Continuous | Reads per kilobase of transcript per million mapped reads |
| LEVEL1 | Categorical | Biological Pathways |
| Depth | Categorical |  Levels of ocean depths |


#### Analysis Overview

We intend to analyze the data using R with RStudio.

__Data Wrangling and Exploratory Data Analysis__

The variables of interest for this analysis are the mean abundance of viral DNA sequence (dependent variable) and two independent variables namely, biological pathways and ocean depths. We will explore these variables individually.
We will check for missing values, outliers and explore descriptive statistics for each variable of interest. We will also, visualize the mean abundance of viral DNA sequence across nine biological pathways and five depths using a heatmap.

__Data Analysis__

We will start with validating if the data meets the assumptions for a Two-Way ANOVA. The assumptions are:
* Dependent variable should be measured at the continuous level
* Two independent variables should each consist of two or more categorical, independent groups.
* Independence of observations
* No significant outliers
* All samples were drawn from normally distributed populations
* Homogeneity of variances (among the groups should be approximately equal). *We will be using either Levene's test or Brown & Forsythe's test*

If none of the assumptions are being violated, we will set up our hypothesis.

__Testing Main Effects__:

* Factor 1: Biological Pathways

   Null Hypothesis: There is no difference in the mean abundance of viral DNA sequence across biological pathways    
   Alternate Hypothesis: At least two of the biological pathways differ in terms of mean abundance of viral DNA sequence
   
* Factor 2: Ocean Depth

  Null Hypothesis: There is no difference in the mean abundance of viral DNA sequence across ocean depths    
  Alternate Hypothesis: At least two ocean depth levels differ in terms of mean abundance of viral DNA sequence   
  
__Testing Interaction Effect__:

* Factors: Biological Pathways & Ocean Depth
 
  Null Hypothesis : There is no significant interaction between biological pathways and ocean depths in terms of mean abundance of viral DNA sequence  
  Alternate Hypothesis : There is a significant interaction between biological pathways and ocean depths in terms of mean abundance of viral DNA sequence
 
We will be checking the above three hypothesis at  5% Level of Significance. Further, we will compute the F-Statistic for testing each set of hypothesis. Based on the statistics we will then observe whether we reject the null hypothesis or we fail to reject it.

<br>


## Summarizing Results

We will summarize results of the analysis outlined above using tables, illustrating the statistics computed for the set of hypothesis tests. To showcase the impact of interaction effects of the two factors (biological pathways and ocean depths) visually, we will be using a combination of error bar (confidence intervals of mean abundance of viral DNA sequence) and jitter plots (sample spread) and faceting it on one factor.
