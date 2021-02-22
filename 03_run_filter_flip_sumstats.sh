#!/bin/bash
#
#SBATCH --job-name=flip
#SBATCH --output=err_out/flip_%A_%a.out
#SBATCH --error=err_out/flip_%A_%a.err
#SBATCH --array=0-53
#SBATCH --mem=6000

#List of diseases/traits taken from summary file, remove header line
traits=( $(cut -f8 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | tail -n +2) )
#traits=("covid19severe" "covid19hospital")
ntraits=${#traits[@]}

#get cohort and trait index for each job id
#icohort=$((SLURM_ARRAY_TASK_ID / ntraits))
#icohort=$icohort|cut -f1 -d"."
#itrait=$(($SLURM_ARRAY_TASK_ID%$ntraits))
itrait=$SLURM_ARRAY_TASK_ID

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "${traits[$itrait]}"
echo $itrait

# run filter and flip script
Rscript --vanilla 03a_filter_flip_sumstats.R "${traits[$itrait]}"
