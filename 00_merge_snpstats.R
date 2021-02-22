##################################################
## Project: PRS_Covid19, Preprocessing of files, 
## merge snp-stats files of cohorts
## Date: 24.06.2020
## Author: Nathalie
##################################################

args <- commandArgs(trailingOnly=T)

# workdir <- args[0]
# snps_files <- args[1]

workdir <- "/binder/mgp/datasets/2020_PRS_Covid19/cohorts/"
snps_files <- "snps_files.txt"

setwd(workdir)


# MERGE CHROMOSOMES FROM EACH COHORT

# read pathes to snp stats files
snp_stats_pathes <- read.table(file = snps_files, header = FALSE, sep = "\t")

# iterate through cohorts and merge chromosome files
for (i in 1:nrow(snp_stats_pathes)){
  cohort_name <- snp_stats_pathes[i,1]
  cohort_path <- snp_stats_pathes[i,2]
  snp_stats <- NULL
  for (j in 1:22){
    cohort_path_chr <- gsub("*", j, cohort_path)
    snp_stats_chr <- read.table(file = cohort_path_chr, header = TRUE, sep = "\t")
    snp_stats <- rbind(snp_stats, snp_stats_chr)
  }
  saveRDS(snp_stats, file = paste0(cohort_name, ".all.snp-stats"))
}
