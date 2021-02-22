#!/bin/bash
#
#SBATCH --job-name=plink
#SBATCH --output=err_out_plink/plink_%A_%a.out
#SBATCH --error=err_out_plink/plink_%A_%a.err
#SBATCH --array=0-216
#SBATCH --mem=5000
#SBATCH --exclude=hp01,hp02


#list of cohorts (full path to data and short names)
cohort=("BeCome_SIA_Dec2019/bggt_info0.6/07_bestguess/probabilities_info0.6/become_dec2019_all" "MARS_GSK_610K_550K_PhaseIII/bggt_info06/550k610k_samples_info06_maf_hwe_bggt" "Omni_Sep2017_PhaseIII/bggt_info06/omni_samples_info06_hwe_maf_bggt" "GSA_Dec2018_PhaseIII/bggt_final/info_0.6/gsa_all_nosia")
cohort_short=("BeCome" "MARS_GSK" "MARS_Omni" "MARS_GSA")
ncohort=${#cohort[@]}

#list of diseases/traits from summary file
traits=( $(cut -f8 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | tail -n +2) )
#traits=("SCZ")
ntraits=${#traits[@]}

#get cohort and trait index for each job id
icohort=$((SLURM_ARRAY_TASK_ID / ntraits))
icohort=$icohort|cut -f1 -d"."
itrait=$(($SLURM_ARRAY_TASK_ID%$ntraits))

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "${cohort[$icohort]}"
echo "${traits[$itrait]}"
echo $icohort
echo $itrait

#run PLINK2 to calculate overall risk of each individual in cohorts for the different diseases/traits
/binder/mgp/code/plink2/plink2 --score "/binder/mgp/datasets/2020_PRS_Covid19/calculated_PRS_july2020/${traits[$itrait]}/${cohort_short[$icohort]}_all_chromosomes.flipRisk" 2 4 6 --out "/binder/mgp/datasets/2020_PRS_Covid19/calculated_PRS_july2020/${traits[$itrait]}/${cohort_short[$icohort]}_plink_out" --bfile "/binder/common/genotypes/qc_imputations/${cohort[$icohort]}"

#remove concatenated file
#rm /binder/mgp/datasets/2020_PRS_Covid19/calculated_PRS_july2020/${traits[$itrait]}/${cohort_short[$icohort]}_all_chromosomes.txt
