##################################################
## Project: PRS Covid19 Project
## Date: 14.08.2020
## Author: Nathalie
##################################################
# Identify GWAS with less than 250000 samples
# and evaluate if highly polygenic

### INFO: Don't do this --> evaluate polygenicity from literature
### skip this script

data_base <- "/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/"
sumfile <- "GWAS_summaries.tsv"

# read summary 
sumdata <- read.table(paste0(data_base, sumfile), header = TRUE, sep = "\t", comment.char="$")

# add column for polygenicity code
sumdata$Highly.polygenic <- 2
sumdata$Highly.polygenic[sumdata$X.samples.in.GWAS < 250000] <- 1
sumdata$Highly.polygenic[sumdata$X.samples.in.GWAS < 250000 & sumdata$X.SNPs.at.5e.08 <= 100] <- 0

write.table(sumdata, paste0(data_base, sumfile), col.names = TRUE, row.names = FALSE, quote = FALSE, sep = "\t") 
