#!/bin/sh

#SBATCH --job-name=plink
#SBATCH --output=err_out_plink/plink_%A_%a.out
#SBATCH --error=err_out_plink/plink_%A_%a.err
#SBATCH --array=0-216
#SBATCH --mem=5000
#SBATCH --exclude=hp01,hp02


#list of cohorts (full path to data and short names)
cohort_short=("BeCome" "MARS_GSK" "MARS_Omni" "MARS_GSA")
ncohort=${#cohort_short[@]}

#list of diseases/traits from summary file
traits=( $(cut -f8 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | tail -n +2) )
ntraits=${#traits[@]}

#get cohort and trait index for each job id
icohort=$((SLURM_ARRAY_TASK_ID / ntraits))
icohort=$icohort|cut -f1 -d"."
itrait=$(($SLURM_ARRAY_TASK_ID%$ntraits))

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "${cohort_short[$icohort]}"
echo "${traits[$itrait]}"
echo $icohort
echo $itrait

#flip effect sizes in PRS-CS output if negative
Rscript --vanilla 08a_flip_output.R "${traits[$itrait]}" "${cohort_short[$icohort]}" 
