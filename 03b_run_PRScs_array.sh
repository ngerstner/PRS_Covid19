#!/bin/bash
#
#SBATCH --job-name=prstest2
#SBATCH --output=prstest2_%A_%a.out
#SBATCH --error=prstest2_%A_%a.err
#SBATCH --array=0-3
#SBATCH --mem=12000

cohort=("BeCome_SIA_Dec2019/bggt_info0.6/07_bestguess/probabilities_info0.6/become_dec2019_all" "MARS_GSK_610K_550K_PhaseIII/bggt_info06/550k610k_samples_info06_maf_hwe_bggt" "Omni_Sep2017_PhaseIII/bggt_info06/omni_samples_info06_hwe_maf_bggt" "GSA_Dec2018_PhaseIII/bggt_final/info_0.6/gsa_all_nosia")
cohort_short=("BeCome" "MARS_GSK" "MARS_Omni" "MARS_GSA")

trait="crohnsDisease"

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "${cohort[$SLURM_ARRAY_TASK_ID]}"

mkdir "/binder/mgp/datasets/2020_GWAS_Covid19/${trait}/${cohort_short[$SLURM_ARRAY_TASK_ID]}"

python /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix="/binder/common/genotypes/qc_imputations/${cohort[$SLURM_ARRAY_TASK_ID]}" --sst_file="/binder/mgp/datasets/2020_GWAS_Covid19/${trait}/${trait}.sumstats" --n_gwas=24269 --out_dir="/binder/mgp/datasets/2020_GWAS_Covid19/${trait}/${cohort_short[$SLURM_ARRAY_TASK_ID]}/${trait}"
