##################################################
## Project: PRS Covid19 Project
## Date: 02.08.2020
## Author: Nathalie
##################################################
# Filter SNPs with NAs out of sumstats 
# Flip SNPs with negative BETA

### INFO: flip step is useless, can be skipped

#read arguments
args = commandArgs(trailingOnly=TRUE)
trait <- args[1]
#trait <- "tuberculosis"
base_data <- "/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/"


### FUNCTIONS ###################################

filterRisk <- function(risks) # filter out SNPs with NA in BETA or P
  {
  risks <- na.omit(risks, cols = c("BETA", "P"))
  return(risks)
  }


flipRisk <- function(risks) # flip negative effect sizes to positive values
  {
  n <- ncol(risks)
  risks$A1 <- as.character(risks$A1)
  risks$A2 <- as.character(risks$A2)

  risks["FLIP"] <- F
  if(any(risks$BETA<0)) risks[which(risks$BETA<0),]$FLIP <- T

  risks$TEMP <- risks$A1
  if(any(risks$FLIP))
    {
    risks[which(risks$FLIP),]$A1 <- risks[which(risks$FLIP),]$A2
    risks[which(risks$FLIP),]$A2 <- risks[which(risks$FLIP),]$TEMP
    risks[which(risks$FLIP),]$BETA <- -risks[which(risks$FLIP),]$BETA
    }
  risks <- risks[,1:n]
  return(risks)
  }

filterID <- function(risks) # remove variants without rs ID and cut suffices like :G:A
  {
  snp_id <- as.character(risks$SNP)
  missing_rs <- which(!startsWith(snp_id, "rs"))
  if (length(missing_rs)>0) risks <- risks[-missing_rs,]
  risks$SNP <- gsub(":[A-Z]:[A-Z]", "", risks$SNP)
  return(risks)
  }


### FILTER AND FLIP #############################

sumstats <- read.table(paste0(base_data, trait, "/", trait, ".sumstats"), header = TRUE)

sumstats <- filterRisk(sumstats)
sumstats <- flipRisk(sumstats)
sumstats <- filterID(sumstats)

write.table(sumstats, paste0(base_data, trait, "/", trait, ".flipRisk"),r=F,qu=F,sep="\t")
