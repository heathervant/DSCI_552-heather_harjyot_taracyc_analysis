# taracyc_data_explore_clean.R

# Harjyot and Heather, Nov 2018
# Taracyc Ocean Virus Analysis

# This script reads in the data from taracyc_data.csv
# This script does an exploratory data anlysis and data wrangling to clean the data
# This script takes 3 arguments, input and output file paths.

#

# Usage: Rscript src/taracyc_data_explore_clean.R data/taracyc_data.csv results/figures data/taracyc_data_cleaned.csv





# load libraries
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(ggmap))
suppressPackageStartupMessages(library(maps))


# Read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input<- args[1]
output_figs <- args[2]
output_data <- args[3]

# define main function
main <- function() {
  
  # Read in data
  taracyc_data <- read.csv(input)


  # Selecting features and Marking Virus Samples
  
  # Definition provided on Taracyc Oceans Project website
  # https://github.com/hackseq/tara-cyc-hs18
  
  taracyc_data_marked <- taracyc_data %>% 
    select(SAMPLE,LEVEL1,DEPTH,RPKM,LAT,LONG) %>% 
    mutate(
      ocean_dna=case_when(
        str_detect(SAMPLE,pattern="^ERR")  ~ "Virus",
        str_detect(SAMPLE,pattern="^c")  ~ "Bacteria",
        str_detect(SAMPLE,pattern="^F")  ~ "Both"
    ))
  
  # Checking for missing values, none found
  
  sum(is.na(taracyc_data_marked $RPKM_log10 ))
  
  
  # Plot to showcase sample split of DNA Sequences
  
  fig_1 <- taracyc_data_marked %>% 
    select(SAMPLE,ocean_dna) %>% 
    distinct %>% 
    ggplot(aes(ocean_dna)) +
    geom_bar(width=0.9, fill = "#FF6666") +
    scale_colour_brewer(palette="Spectral")+
    coord_flip() +
    labs(x="DNA Mapped",
         y="Samples",
         caption="\n
         Figure 1: Samples collected for Ocean DNA by Tara Oceans Project")+
    theme_classic()+
    theme(aspect.ratio = .3)+
    theme(plot.title = element_text(hjust = 0.5),
          plot.caption=element_text(hjust = 0.5))
  
    # Saving Plot
    suppressMessages(
      ggsave(filename=paste(output_figs,"/fig1_eda_sample_split.png",sep="")
             ,plot=fig_1,height=2.5,width=5))
  
  
  # Filtering out samples with Viral DNA Sequences
  
  taracyc_data_filtered <- taracyc_data_marked %>% 
    filter(ocean_dna=="Virus")
  
  
  ## Geographical Spread of Viral DNA Sequences
  
  # Making Latitude and Longitude numeric
  taracyc_data_filtered <- taracyc_data_filtered  %>% 
    mutate(lat=as.numeric(LAT),long=as.numeric(LONG))
  
  # Reading data for world latitudes and longitudes
  my_map_data <- map_data("world") 
  
  # Plotting Geographical Spread of Viral DNA Sequences
  
  fig_2 <- ggplot(my_map_data, aes(long, lat)) +
    geom_polygon(aes(group=group), fill = "darkolivegreen3",color="white") +
    geom_point(data=taracyc_data_filtered , aes(size=RPKM,color=RPKM))+
    scale_color_distiller(palette="Blues")+
    guides(size = FALSE)+
    coord_equal() +
    labs(caption="\n
    Figure : Geographical Spread of viral dna collected around the world")+
    theme_void()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.caption=element_text(hjust = 0.5))
  
  # Saving Plot
  suppressMessages(
    ggsave(filename=paste(output_figs,"/fig2_eda_geographical_spread.png",sep=""),
           plot=fig_2,height=6))
  
  
  
  # Samples Size under two factors
  
  fig_3 <- taracyc_data_filtered  %>%
    group_by(LEVEL1,DEPTH) %>% 
    ggplot(aes(LEVEL1)) +
    coord_flip() +
    geom_bar(aes(fill=LEVEL1)) +
    facet_wrap(~ DEPTH, ncol=1)+
    labs(x="Biological Pathways",
         y="Samples Collected",
         caption="\n
    Figure 2:Samples of Viral DNA Sequences Collected for five biological pathways across four levels of ocean depth")+
    scale_fill_brewer(palette = "Paired")+
    theme_classic()+
    theme(aspect.ratio = .2)+
    theme(plot.title = element_text(hjust = 0.5),
          plot.caption=element_text(hjust = 0.5),
          axis.title=element_text(face="bold"),
          legend.position="none")
  
  # Saving plot
  suppressMessages(
    ggsave(filename=paste(output_figs,"/fig3_eda_biological_pathways_depth_dna_volume.png",sep="")
           ,plot=fig_3,width=8))
  
  
  
  # Exploring Viral DNA Sequences in different biological pathways
  
  fig_4 <- taracyc_data_filtered  %>% 
    mutate(RPKM_log10=log10(RPKM)) %>% 
    filter(RPKM_log10 !=-Inf) %>% 
    ggplot(aes(y=RPKM_log10,x=LEVEL1))+
    geom_violin(aes(fill=LEVEL1))+
    geom_boxplot(width=.1,outlier.colour="black")+
    scale_fill_brewer(palette = "Spectral")+
    labs(x="Biological Pathways",
         y=expression(paste(
           "Reads Per Kilobase Million (",
           log[10],
           " RPKM)", sep=" ")),
         caption="\n
         Figure 3: Spread of Abundance of Viral DNA Sequences (RKPM) and Outliers across Biological Pathways.
         Due to variation in RPKM values, log base 10 is taken for plot feasibility.")+
    theme_classic()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.caption=element_text(hjust = 0.5),
          legend.position="none")
  
  # Saving plot
  suppressMessages(
    ggsave(filename=paste(output_figs,"/fig4_eda_biological_pathways_spread_outliers.png",sep="")
           ,plot=fig_4,height=4))
  
  
  #  Exploring Viral DNA Sequences across ocean depth
  
  fig_5 <- taracyc_data_filtered %>% 
    mutate(RPKM_log10=log10(RPKM)) %>% 
    filter(RPKM_log10 !=-Inf) %>% 
    ggplot(aes(y=RPKM_log10,x=DEPTH))+
    geom_violin(aes(fill=DEPTH))+
    geom_boxplot(width=.1,outlier.colour="black")+
    scale_fill_brewer(palette = "PuBuGn")+
    labs(x="Depths",
         y=expression(paste(
           "Reads Per Kilobase Million (",
           log[10],
           " RPKM)", sep=" ")),
         caption="\n
         Figure 4: Spread of Abundance of Viral DNA Sequences (RKPM) and Outliers across levels of Ocean Depth 
         Ocean depths entail, DCM (Deep Chlorophyll Maximum), MES (Mesopelagic), MIX (Marine Epipelagic Mixed Layer) 
         and SRF(Surface Water Layer). Due to variation in RPKM values, log base 10 is taken for plot feasibility.")+
    theme_classic()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.caption=element_text(hjust = 0.5),
          legend.position="none")
  # Saving plot
  suppressMessages(
   ggsave(filename=paste(output_figs,"/fig5_eda_depths_spread_outliers.png",sep=""),
          plot=fig_5,height=4))
  
  
  
  # Removing outliers from entire data 
  # Filtering data to keep only features needed
   
  taracyc_data_cleaned <- taracyc_data_filtered %>%
    select(RPKM,LEVEL1,DEPTH) %>% 
    filter(RPKM>quantile(RPKM, probs=0.01),RPKM<quantile(RPKM, probs=0.99))
  
  
  #  Heatmap for mean viral abundance across biological pathways and ocean depth
  
  fig_6 <- taracyc_data_cleaned %>% 
    ggplot(aes(DEPTH,LEVEL1, z = RPKM)) +
    stat_summary_2d(fun = "mean")+
    scale_fill_distiller(palette="Spectral",
                         name="Mean RPKM (Reads Per Kilobase Millions)")+
    coord_equal() +
    labs(x="Depths",
         y="Biological Pathways",
         caption="\n
         Figure 5: Mean Abundance of Viral DNA Sequences in 20 categories
         Ocean depths entail, DCM (Deep Chlorophyll Maximum), MES (Mesopelagic), 
         MIX (Marine Epipelagic Mixed Layer) and SRF(Surface Water Layer). ")+
    theme_classic()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.caption=element_text(hjust = 0.5)) 
  
  # Saving plot
  suppressMessages(
    ggsave(filename=paste(output_figs,"/fig6_eda_mean_dna_across_categories.png",sep=""),
           plot=fig_6,height=4))
  
  write.csv(taracyc_data_cleaned , file = output_data)
  
}

# call main function
main()