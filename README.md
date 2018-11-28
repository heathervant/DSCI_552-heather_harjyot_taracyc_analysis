-----------------------------------------------------------------------------------
## Viral Voyager: Taracyc Ocean Virus Analysis
-----------------------------------------------------------------------------------

Authors

| Name | CWL |
|---|---|
| Harjyot Kaur | [HarjyotKaur](https://github.com/HarjyotKaur) |
| Heather Van Tassel | [heathervant](https://github.com/heathervant) |

<br>

## Overview

One of the most promising places to sequester carbon is in the oceans. The ocean plays a vital dominant role in oxygen production, weather patterns, climate and the global carbon cycle. Cyanobacteria in the oceans digest carbon, and when the bacteria die, this carbon sinks to the bottom of the ocean, thereby sequestering it from our atmosphere. There are viruses that can infect bacteria and alter their chance of survival.

## Motivation for research
In 2009, a 3-year voyage around the world began, to collect more information about our precious oceans. The project was led by the [TARA oceans project]('') and resulted in the collection of 300 water samples, involving over 150 Scientists who are curious about the biodiversity and distribution of micro-organisms in the oceans. The Hallam lab at UBC has taken these genetic sequences from the viruses and bacteria and created a complex algorithm that classifies the DNA sequences into biological pathways that these genes may be involved in regulating. A team of students and researchers took this dataset and made a [shiny app](http://oganm.com/shiny/taracyc/) to help the public interact with and explore the data at the University of British Columbia's [hackseq 2018](https://github.com/hackseq/tara-cyc-hs18/wiki). Many questions are waiting to be explored with this dataset, to help characterize genetic diversity of the ocean, and make inferences about how bacteria and viruses interact and how they might be altered by changing climates.


## Research Question

Does the mean abundance of viral DNA sequences differ across biological pathways? Does the mean abundance of viral DNA sequences differ across ocean depth levels? Does the mean abundance of viral DNA sequences of the biological pathways differ across ocean depth levels?

## Analysis Overview

The goal is to carry out a Two-Way ANOVA (Factorial Analysis) to compare the main effects and interaction effects between biological pathways and ocean depth levels on the abundance of viral DNA sequences.

| Variable Name | Type | Description |
|---|---|---|
| RKPM | Continuous | Reads per kilobase of transcript per million mapped reads |
| LEVEL1 | Categorical | Biological Pathways |
| Depth | Categorical |  Levels of ocean depth |
<br>

A detailed report of the analysis is available [here](https://github.com/UBC-MDS/Taracyc_Ocean_Virus_Analysis/blob/master/doc/taracyc_report.md).

## Usage

1. Clone this repo, and using the command line, navigate to the root of this project.

2. Run the following commands:
```
Rscript src/taracyc_data_load.R https://media.githubusercontent.com/media/HarjyotKaur/Data_Taracyc_Analysis/master/data/MASTERTABLE.txt data/taracyc_data.csv
Rscript src/taracyc_data_explore_clean.R data/taracyc_data.csv results/figures data/taracyc_data_cleaned.csv
Rscript src/taracyc_data_analysis.R data/taracyc_data_cleaned.csv results/taracyc_results.csv
Rscript src/taracyc_results.R data/taracyc_data_cleaned.csv results/figures/fig7_results.png
Rscript -e "rmarkdown::render('doc/taracyc_report.Rmd')"
```

  Or call run the following in your command shell
```
bash run_all.sh
```
## Process flow

![](img/usage_process_flow.png)

## Dependencies

* R [version 3.5.1 ] and R libraries   
  `tidyverse`  [tidyverse_1.2.1](https://cran.r-project.org/web/packages/tidyverse/index.html)
   `ggplot2`   [ggplot2_3.0.0](https://cran.r-project.org/src/contrib/Archive/ggplot2/)
   `ggmap`     [ggmap_2.6.1](https://cran.r-project.org/web/packages/ggmap/index.html)
   `maps`      [maps_3.3.0](https://cran.r-project.org/web/packages/maps/index.html)
   `car`       [car_3.0-2](https://cran.r-project.org/web/packages/car/index.html)
   `ggpubr`    [ggpubr_0.2.999](https://github.com/kassambara/ggpubr)
   `rmarkdown` [rmarkdown_1.10](https://cran.r-project.org/web/packages/rmarkdown/index.html)
   `knitr`  [knitr_1.20](https://cran.r-project.org/web/packages/knitr/index.html)
