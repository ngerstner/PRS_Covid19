#################################################
## Project: Plot PRS results
## Date: 15.06.2020
## Author: Nathalie
##################################################

library(ggplot2)

setwd("/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats")
#sum_file <- "~/Documents/Covid19/GWAS_summaries.tsv"
sum_file <- "GWAS_summaries.tsv"
base_path_PRS <- "/binder/mgp/datasets/2020_PRS_Covid19/calculated_PRS_july2020/"

# Read PRS results
cohorts <- c("BeCome", "MARS_GSK", "MARS_Omni", "MARS_GSA")
summary <- read.csv(sum_file, header = TRUE, sep = "\t", row.names = 1)
traits <- as.character(summary$Name.Server)

# Go through all cohorts and traits
result_table <- data.frame(FID = character(),
                           IID = character(),
                           score_avg = numeric(),
                           cohort = character(),
                           trait = character())
for (c in cohorts){
  for (t in traits){
    print(paste(c,t))
    sum_tmp <- read.csv(paste0(base_path_PRS,t,"/",c,"_plink_out_woFlip.sscore"), 
                        header = TRUE, sep = "\t")
    app_tmp <- cbind(sum_tmp$X.FID, sum_tmp$IID, sum_tmp$SCORE1_AVG, rep(c, nrow(sum_tmp)), rep(t, nrow(sum_tmp)))
    colnames(app_tmp) <- colnames(result_table)
    result_table <- rbind(result_table, app_tmp)
  }
}

# Plot results
p <- ggplot(result_table, aes(x=trait, y=score_avg, fill=cohort)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave(p, paste0(base_path_PRS,"PRS_Covid19_woFlip.png"), width = 20, height = 15)
