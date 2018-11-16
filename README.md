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

<img src="/Data/Proposal_Data_Download_Steps_Images/Step_2.JPG" width="400">


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



Question: Does the average amount of viral and bacterial DNA from the ocean differ across 9 different biological pathways they are involved in and across five different depths?
This is an inferential question, as we are using a dataset that has 300 ocean samples taken from all over the world, and we are making an inference about the ocean's viral and bacterial populations.


We got the dataset from the taracyc ocean project, and the data is publically acessible on this website http://oganm.com/shiny/taracyc/

We will be doing a hypothesis test using a 2-way ANOVA, with the following hypotheses.

$Ho=$ The mean DNA abundance levels are the same for each depth and pathway.
$Ha=$  The mean DNA abundance levels are not the same for each depth and pathway.

We will be showcasing the results of our hypothesis test in a table with the mean values for each group, and the MSerror, SSerror, alpha, and the F-statistic. We may also show some visual plots of the analysis with box plots and jitter for each category.


