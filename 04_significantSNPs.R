##################################################
## Project: PRS Covid19 Project
## Date: 14.08.2020
## Author: Nathalie
##################################################
# Identify GWAS with less than 250000 samples
# and evaluate if highly polygenic
# Count number of SNPs with p <= 5e-08

data_base <- "/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/"
sumfile <- "GWAS_summaries.tsv"

# read summary 
sumdata <- read.table(paste0(data_base, sumfile), header = TRUE, sep = "\t", comment.char="$")
traits <- as.character(sumdata$Name.Server)

n_snps <- NULL
for (t in traits){
  sumstats <- read.table(paste0(data_base, t, "/", t, ".flipRisk"), sep = "\t", header = TRUE)
  n_sig <- length(which(sumstats$P <= 5e-08))
  n_snps <- c(n_snps, n_sig)
}

sumdata$X.SNPs.at.5e.08 <- n_snps
write.table(sumdata, paste0(data_base, sumfile), col.names = TRUE, row.names = TRUE, quote = FALSE, sep = "\t") 
