##################################################
## Project: PRS Covid19 Project
## Date: 02.08.2020
## Author: Nathalie
##################################################
# Flip SNPs with negative effect size in PRS-CS output

#read arguments
args = commandArgs(trailingOnly=TRUE)
trait <- args[1]
cohort <- args[2]
#trait <- "tuberculosis"
base_data <- "/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/"


### FUNCTIONS ###################################

flipRisk <- function(risks) # flip negative effect sizes to positive values
  {
  n <- ncol(risks)
  risks$V4 <- as.character(risks$V4)
  risks$V5 <- as.character(risks$V5)

  risks["FLIP"] <- F
  if(any(risks$V6<0)) risks[which(risks$V6<0),]$FLIP <- T

  risks$TEMP <- risks$V4
  if(any(risks$FLIP))
    {
    risks[which(risks$FLIP),]$V4 <- risks[which(risks$FLIP),]$V5
    risks[which(risks$FLIP),]$V5 <- risks[which(risks$FLIP),]$TEMP
    risks[which(risks$FLIP),]$V6 <- -risks[which(risks$FLIP),]$V6
    }
  risks <- risks[,1:n]
  return(risks)
  }


### FILTER AND FLIP #############################

effects <- read.table(paste0(base_data, trait, "/", cohort, "_all_chromosomes.txt"))

effects <- flipRisk(effects)

write.table(effects, paste0(base_data, trait, "/", cohort, "_all_chromosomes.flipRisk"),r=F,col.names=F,qu=F,sep="\t")
