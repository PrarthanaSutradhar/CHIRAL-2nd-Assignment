# Load packages
library(tidyverse)
library(ggthemes)
library(hrbrthemes)
library(ggsci)
library(RColorBrewer)
library(GEOquery)
library(Biobase)

# import the data

data <- read.csv("E:/CHIRAL/R for Reseaech C06/Script/R-for-Research-C06/CHIRAL-2nd-Assignment/Raw Data/GSE21942_RAW Data.tar")
Data <- read.csv("E:/CHIRAL/R for Reseaech C06/Script/R-for-Research-C06/CHIRAL-2nd-Assignment/Raw Data/GPL570.annot/GPL570.annot")

# metadata
gse <- getGEO(GEO = "GSE21942", GSEMatrix = T)
class(gse)

meta_data <- pData(gse[[1]])
meta_data2 <- fData(gse[[1]])
meta_data4 <- assayData(gse[[1]])
meta_data5 <- experimentData(gse[[1]])

gse21942 <- getGEO(filename = 'GSE21942_family.soft.gz')

# select proper column and rename
  meta_data3 <- meta_data |> 
  select(1, 6, 8, 11, 13, 33) |> 
  rename(Title = title,
         Type = type,
         Sample = source_name_ch1,
         Molecule = molecule_ch1)

  
# read gene table
gene_data <- read.delim("E:/CHIRAL/R for Reseaech C06/Script/R-for-Research-C06/CHIRAL-2nd-Assignment/Raw Data/GSE21942_series_matrix.txt/GSE21942_series_matrix.txt")
gse21942 <- read.delim("E:/CHIRAL/R for Reseaech C06/Script/R-for-Research-C06/CHIRAL-2nd-Assignment/Raw Data/GSE21942_family.soft/GSE21942_family.soft")


# checking data
glimpse(gene_data)
head(gene_data)

# reshape our data - wide to long
long_data <- gene_data |>
  gather(key = "gene", value = "expression")

long_data2 <- gse21942 |>
  gather(key = "gene", value = "expression")
 
  

  