#!/bin/bash
sum_stats_path="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats"
#script_path="/binder/mgp/code/PRS_Covid19"

#######################################
### Prepare Summary Statistic Files ### 
#######################################
# Required format for PRS-CS
# SNP(rsID)	A1(effect allele)	A2	BETA	P
#
# Required columns for PRSice
# SNP	Chr	A1	A2	BETA	P
#######################################

##########
### AD ###
##########
condition="AD"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $6,$4,$5,$13,$8}' OFS="\t" ${sumstats} > ${output_sumstats}

############
### ADHD ###
############
condition="ADHD"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, calculate BETA from OR
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $2,$4,$5,log($7),$9}' OFS="\t" ${sumstats} > ${output_sumstats}

###########
### age ###
###########
condition="age"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, from UKBB format
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $16,$15,$14,$8,$11}' OFS="\t" ${sumstats} > ${output_sumstats}

###############
### alcohol ###
###############
condition="alcohol"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $2,$4,$5,log($7),$9}' OFS="\t" ${sumstats} > ${output_sumstats}

############
### ASD ###
############
condition="ASD"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, calculate BETA from OR
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $3,$4,$5,log($6),$10}' OFS="\t" ${sumstats} > ${output_sumstats}

##############
### asthma ###
##############
condition="asthma"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk '{print $1,$4,$5,$6,$8}' OFS="\t" ${sumstats} > ${output_sumstats}

###########
### BIP ###
###########
condition="BIP"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, calculate BETA from OR
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $2,$4,$5,log($9),$11}' OFS="\t" ${sumstats} > ${output_sumstats}

#######################
### bladderNeoplasm ###
#######################
condition="bladderNeoplasm"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, from UKBB format
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $17,$16,$15,$9,$12}' OFS="\t" ${sumstats} > ${output_sumstats}

#################
### bmiengage ###
#################
condition="bmiengage"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $1,$4,$5,$6,$8}' OFS="\t" ${sumstats} > ${output_sumstats}

################
### bmigiant ###
################
condition="bmigiant"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $3,$4,$5,$7,$9}' OFS="\t" ${sumstats} > ${output_sumstats}

##############
### cancer ###
##############
condition="cancer"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, from UKBB format
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $17,$16,$15,$9,$12}' OFS="\t" ${sumstats} > ${output_sumstats}

################
### cannabis ###
################
condition="cannabis"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $2,toupper($4),toupper($5),$7,$10}' OFS="\t" ${sumstats} > ${output_sumstats}

#####################
### celiacDisease ###
#####################
condition="celiacDisease"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $3,$5,$4,$7,$6}' OFS="\t" ${sumstats} > ${output_sumstats}

############################
### chronicKidneyDisease ###
############################
condition="chronicKidneyDisease"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $3,toupper($4),toupper($5),$7,$9}' OFS="\t" ${sumstats} > ${output_sumstats}

##################
### chronotype ###
##################
condition="chronotype"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $1,$4,$5,$8,$10}' OFS="\t" ${sumstats} > ${output_sumstats}

##########
### CP ###
##########
condition="CP"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $1,$4,$5,$7,$9}' OFS="\t" ${sumstats} > ${output_sumstats}

############
### copd ###
############
condition="copd"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, from UKBB format
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $17,$16,$15,$9,$12}' OFS="\t" ${sumstats} > ${output_sumstats}

#############################
### coronaryArteryDisease ###
#############################
condition="coronaryArteryDisease"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $1,$4,$5,$9,$11}' OFS="\t" ${sumstats} > ${output_sumstats}

###############
### covid19 ###
###############
condition="covid19"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $3,$6,$4,log($10),$13}' OFS="\t" ${sumstats} > ${output_sumstats}

#####################
### covid19severe ###
#####################
condition="covid19severe"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $22,$4,$3,$16,$18}' OFS="\t" ${sumstats} > ${output_sumstats}

#######################
### covid19hospital ###
#######################
condition="covid19hospital"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $22,$4,$3,$16,$18}' OFS="\t" ${sumstats} > ${output_sumstats}

#####################
### crohnsDisease ###
#####################
condition="crohnsDisease"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, remove lines with NA
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $2,$6,$5,$7,$17}' OFS="\t" ${sumstats} > "${sum_stats_path}/${condition}/${condition}_tmp.sumstats"
#awk -F"\t" '{ $4 = ($4 == "NA" ? 1 : $4) } 1' OFS="\t" "${sum_stats_path}/${condition}/${condition}_tmp.sumstats" > ${output_sumstats}

#####################
### crossDisorder ###
#####################
condition="crossDisorder"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $1,$4,$5,log($6),$8}' OFS="\t" ${sumstats} > ${output_sumstats}

###########
### crp ###
###########
condition="crp"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk '{print $10,$2,$3,$4,$6}' OFS="\t" ${sumstats} > ${output_sumstats}

#####################
### diabetesType1 ###
#####################
condition="diabetesType1"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, from UKBB format
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $17,$16,$15,$9,$12}' OFS="\t" ${sumstats} > ${output_sumstats}

#####################
### diabetesType2 ###
#####################
condition="diabetesType2"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $3,$4,$5,$7,$9}' OFS="\t" ${sumstats} > ${output_sumstats}

################
### drinking ###
################
condition="drinking"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, from UKBB format
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $16,$15,$14,$8,$11}' OFS="\t" ${sumstats} > ${output_sumstats}

##########
### EA ###
##########
condition="EA"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $1,$4,$5,$7,$9}' OFS="\t" ${sumstats} > ${output_sumstats}

#################
### esophagus ###
#################
condition="esophagus"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, from UKBB format
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $17,$16,$15,$9,$12}' OFS="\t" ${sumstats} > ${output_sumstats}

####################
### extraversion ###
####################
condition="extraversion"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $1,toupper($4),toupper($5),$6,$8}' OFS="\t" ${sumstats} > ${output_sumstats}

##############
### gender ###
##############
condition="gender"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, from UKBB format
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $17,$16,$15,$9,$12}' OFS="\t" ${sumstats} > ${output_sumstats}

####################
### hypertension ###
####################
condition="hypertension"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, from UKBB format
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $17,$16,$15,$9,$12}' OFS="\t" ${sumstats} > ${output_sumstats}

############
### IL10 ###
############
condition="IL10"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk '{print $1,$5,$4,$6,$9}' OFS="\t" ${sumstats} > ${output_sumstats}

############
### IL17 ###
############
condition="IL17"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk '{print $1,$5,$4,$6,$9}' OFS="\t" ${sumstats} > ${output_sumstats}

############
### IL18 ###
############
condition="IL18"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk '{print $1,$5,$4,$6,$9}' OFS="\t" ${sumstats} > ${output_sumstats}

############
### IL1b ###
############
condition="IL1b"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk '{print $1,$5,$4,$6,$9}' OFS="\t" ${sumstats} > ${output_sumstats}

###########
### IL4 ###
###########
condition="IL4"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk '{print $1,$5,$4,$6,$9}' OFS="\t" ${sumstats} > ${output_sumstats}

###########
### IL6 ###
###########
condition="IL6"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk '{print $1,$5,$4,$6,$9}' OFS="\t" ${sumstats} > ${output_sumstats}

####################
### intelligence ###
####################
condition="intelligence"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $1,toupper($5),toupper($6),$9,$11}' OFS="\t" ${sumstats} > ${output_sumstats}

################
### insomnia ###
################
condition="insomnia"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $1,$5,$6,log($8),$10}' OFS="\t" ${sumstats} > ${output_sumstats}

##################
### loneliness ###
##################
condition="loneliness"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $3,$4,$5,$6,$8}' OFS="\t" ${sumstats} > ${output_sumstats}

##################
### lungCancer ###
##################
condition="lungCancer"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, from UKBB format
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $17,$16,$15,$9,$12}' OFS="\t" ${sumstats} > ${output_sumstats}

###########
### MDD ###
###########
condition="MDD"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $2,$5,$4,log($9),$11}' OFS="\t" ${sumstats} > ${output_sumstats}
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $1,toupper($2),toupper($3),$5,$7}' OFS="\t" ${sumstats} > ${output_sumstats}

###################
### neuroticism ###
###################
condition="neuroticism"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $1,toupper($4),toupper($5),$6,$8}' OFS="\t" ${sumstats} > ${output_sumstats}

####################
### neuroticism2 ###
####################
condition="neuroticism2"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $2,$5,$4,$6,$8}' OFS="\t" ${sumstats} > ${output_sumstats}

#################
### pneumonia ###
#################
condition="pneumonia"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, from UKBB format
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $17,$16,$15,$9,$12}' OFS="\t" ${sumstats} > ${output_sumstats}

##################
### resilience ###
##################
condition="resilience"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $3,$4,$5,log($6),$8}' OFS="\t" ${sumstats} > ${output_sumstats}

###########
### SCZ ###
###########
condition="SCZ"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $2,$3,$4,log($7),$9}' OFS="\t" ${sumstats} > ${output_sumstats}

############
### SESA ###
############
condition="SESA"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $1,$5,$6,$8,$10}' OFS="\t" ${sumstats} > ${output_sumstats}

#####################
### sleepDuration ###
#####################
condition="sleepDuration"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
awk -F',' 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $1,$5,$6,$11,$16}' OFS="\t" ${sumstats} > ${output_sumstats}

#####################
### smokingStatus ###
#####################
condition="smokingStatus"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk '{print $2,$4,$5,$9,$11}' OFS="\t" ${sumstats} > ${output_sumstats}

##############
### stroke ###
##############
condition="stroke"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, from UKBB format
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $17,$16,$15,$9,$12}' OFS="\t" ${sumstats} > ${output_sumstats}

###############
### suicide ###
###############
condition="suicide"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $2,$4,$5,log($9),$11}' OFS="\t" ${sumstats} > ${output_sumstats}

############
### TNFa ###
############
condition="TNFa"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS
#awk '{print $1,$5,$4,$6,$9}' OFS="\t" ${sumstats} > ${output_sumstats}

####################
### tuberculosis ###
####################
condition="tuberculosis"
sumstats="${sum_stats_path}/${condition}/${condition}.txt"
output_sumstats="${sum_stats_path}/${condition}/${condition}.sumstats"
# Reformat for PRS-CS, from UKBB format
#awk 'NR==1 {print "SNP  A1      A2      BETA    P"}; NR>1 {print $17,$16,$15,$9,$12}' OFS="\t" ${sumstats} > ${output_sumstats}
