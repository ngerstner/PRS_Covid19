#!/bin/bash
sum_stats_path="/binder/mgp/datasets/2020_GWAS_Covid19"
#outpath="/storage/groups/ccm01/workspace/MPIP-Dean_postmortem_brain/02.PRS"
# Generate the output directories (if not existing already)
#outpath_sumstats="${outpath}/03_preprocessed_sumstats"  # preprocessed sumstats output path
#mkdir -p $outpath_sumstats
script_path="/binder/mgp/code/PRS_Covid19"
#tools_path="/storage/groups/ccm01/tools"

#######################################
### Prepare Summary Statistic Files ### 
#######################################
# Summary statistic formats  for LDpred v1.0.11: (own definition: CUSTOM)
# LDPRED
# CHR POS SNP_ID REF ALT REF_FRQ PVAL BETA SE N
# chr1 1020428 rs6687776 C T 0.85083 0.0587 -0.0100048507289348 0.0100 8000
# 
# STANDARD
# chr pos ref alt reffrq info rs pval effalt
# chr1 1020428 C T 0.85083 0.98732 rs6687776 0.0587 -0.0100048507289348
# 
# BASIC
# hg19chrc snpid a1 a2 bp or p
# chr1 rs4951859 C G 729679 0.97853 0.2083
# 
# PGC
# CHR SNP BP A1 A2 FRQ_A_30232 FRQ_U_40578 INFO OR SE P ngt Direction HetISqt HetChiSq HetDf HetPVa
# ...
# 
# GIANT
# MarkerName Allele1 Allele2 Freq.Allele1.HapMapCEU p N
# rs10 a c 0.0333 0.8826 78380 
#######################################

##########
### AD ###
##########
condition="AD"
sumstats="${sum_stats_path}/${condition}/${condition}head.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}head.sumstats"
# atistic file to following example format: chr:pos, e.g. chr10:10001753 & leave first line untouched
#awk '{print $6,$4,$5,$13,$8}' OFS="\t" ${sumstats} > ${output_sumstats}

############
### ADHD ###
############
condition="ADHD"
sumstats="${sum_stats_path}/${condition}/${condition}head.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}head.sumstats"
#awk 'NR==1 {print "SNP	A1	A2	BETA	P"}; NR>1 {print $2,$4,$5,log($7),$9}' OFS="\t" ${sumstats} > ${output_sumstats}

###########
### age ###
###########
condition="age"
sumstats="${sum_stats_path}/{condition}/{condition}.txt"
output_sumstats="${sum_stats_path}/{condition}.sumstats"

###########
### BIP ###
###########
condition="BIP"
sumstats="${sum_stats_path}/${condition}/${condition}head.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}head.sumstats"
# Reformat for PRS-CS, calculate BETA from OR
awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $2,$4,$5,log($9),$11}' OFS="\t" ${sumstats} > ${output_sumstats}
