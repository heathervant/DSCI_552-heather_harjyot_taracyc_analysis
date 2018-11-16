-----------------------------------------------------------------------------------
## DSCI 522 Proposal
-----------------------------------------------------------------------------------

Team Information

| Name | CWL |
|---|---|
| Harjyot Kaur | hkaur112 |
| Heather Van Tassel | hvan |

-----------------------------------------------------------------------------------
## Viral Voyager: Ocean Viral DNA analysis
-----------------------------------------------------------------------------------

## Dataset 

We will be analyzing the metaviriome data collected from the Tara Oceans Project. The Tara Oceans Project collected water samples data worldwide for shotgun metagenomic sequencing, and this data was then mapped to metabolomic pathways. This is a real-world data project, users can play, explore, and download the genome dataset from [Taracyc's R Shiny App](http://oganm.com/shiny/taracyc/)

The dataset for the analysis was chosen by following the steps below:

### Step 1

Check boxes for both Viral/Bacterial Samples

<img src="/Data/Proposal_Data_Download_Steps_Images/Step_1.JPG" width="400">

### Step 2

Check boxes all for Sample Types

<img src="/Data/Proposal_Data_Download_Steps_Images/Step_2.JPG" width="150">


### Step 3

Check boxes all for Depth 

<img src="/Data/Proposal_Data_Download_Steps_Images/Step_3.JPG" width="400">


### Step 4

Select all the nine pathways from the dropdown

<img src="/Data/Proposal_Data_Download_Steps_Images/Step_4.JPG" width="400">


### Step 5

Select all the fourteen regions from the dropdown

<img src="/Data/Proposal_Data_Download_Steps_Images/Step_5.JPG" width="400">


### Step 6

Select all the nine pathways from the dropdown

<img src="/Data/Proposal_Data_Download_Steps_Images/Step_6.JPG" width="400">


### Step 7

Select the RKPM range from 0-16000

<img src="/Data/Proposal_Data_Download_Steps_Images/Step_7.JPG" width="400">


### Step 8

Scroll down to see samples and select the ones required for analysis (we have selected all)

<img src="/Data/Proposal_Data_Download_Steps_Images/Step_8_i.JPG" width="400">


<img src="/Data/Proposal_Data_Download_Steps_Images/Step_8_ii.JPG" width="400">


### Step 9

Click on Download Selection to get the data in .txt format

<img src="/Data/Proposal_Data_Download_Steps_Images/Step_9.JPG" width="400">

For ease of analysis reproducibility a snapshot of the data is available in the Data Repository.


## Research Question

Does the average amount of viral and bacterial DNA of 9 biological pathways from the ocean differ across marine depths?

#### Type of Question

This is an inferential question, as we are using a dataset that has 300 ocean samples taken from all over the world, and we are making an inference about the ocean's viral and bacterial populations.


## Plan of Action

The goal to carry out a factor analysis for abundance of viral and baterial DNA. The factors considered are:
- Biological Pathways
- Ocean Depth

#### Analysis Overview


| Step | Description |
|---|---|
| Step 1 | Load data into R |
| Step 2 | Exploratory Data Analysis |
| Step 3 | Data wrangling |
| Step 4 | Factor Analysis: Two-Way ANOVA |
| Step 5 | Interpreting Results |
| Step 6 | Compiling Project Report |


## Reporting Results

We will summarize results of the analysis outlined above, we will be using tables to present the statistic computed for the hypothesis test. To showcase the impact of interation effects of the two factors visually, we will be using a combination of error bar and jitter plots.
