library(GEOquery)
library(Biobase)
library(tidyverse)
library(pheatmap)
library(ggplot2)


gds858 <- getGEO('GDS858', destdir = "E:/CHIRAL/R for Reseaech C06/Script/R-for-Research-C06/CHIRAL-2nd-Assignment/Raw Data")

# meta data exploration
Meta(gds858)$channel_count
Meta(gds858)$description
Meta(gds858)$feature_count
Meta(gds858)$platform
Meta(gds858)$sample_count
Meta(gds858)$sample_organism
Meta(gds858)$title
Meta(gds858)$type

# expression data table
colnames(Table(gds858))
expr_dt <- Table(gds858) [1:20, 1:5]

# gene data
eset <- GDS2eSet(gds858, do.log2 = TRUE)
eset

geneNames(eset) [1:10]
sampleNames(eset)

# phenotype data
pData(eset)

infection <- pData(eset)$infection

pData(eset)$"genotype/variation"

# subset of data
exprs(eset[1320_at])

# identify up-regulated genes
upregulated_genes <- expr_dt |> 
  filter(GSM14498 > 50, GSM14499 > 50, GSM14500 > 50) |> 
  arrange(GSM14498, GSM14499, GSM14500) 

# identify down-regulated genes
downregulated_genes <- expr_dt |> 
  filter(GSM14499 < 50) |> 
  arrange(GSM14498, GSM14499, GSM14500) 
  
# heatmap

test2 <- expr_dt |> 
  select(3:10)

pheatmap(test2)

# boxplot
ggplot(downregulated_genes, aes(x = IDENTIFIER)) + 
  geom_boxplot()










