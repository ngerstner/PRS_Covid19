#!/bin/bash
#
#SBATCH --job-name=prs
#SBATCH --output=err_out/prs_%A_%a.out
#SBATCH --error=err_out/prs_%A_%a.err
#SBATCH --array=0-3
#SBATCH --mem=12000
#SBATCH --exclude=hp01,hp02

# --partition=pe
# --exclude=pe2,pe10

#List of different cohorts (complete path to data and short name)
cohort=("BeCome_SIA_Dec2019/bggt_info0.6/07_bestguess/probabilities_info0.6/become_dec2019_all" "MARS_GSK_610K_550K_PhaseIII/bggt_info06/550k610k_samples_info06_maf_hwe_bggt" "Omni_Sep2017_PhaseIII/bggt_info06/omni_samples_info06_hwe_maf_bggt" "GSA_Dec2018_PhaseIII/bggt_final/info_0.6/gsa_all_nosia")
cohort_short=("BeCome" "MARS_GSK" "MARS_Omni" "MARS_GSA")
#cohort=("GSA_Dec2018_PhaseIII/bggt_final/info_0.6/gsa_all_nosia")
#cohort_short=("MARS_GSA")
#cohort=("MARS_GSK_610K_550K_PhaseIII/bggt_info06/550k610k_samples_info06_maf_hwe_bggt" "Omni_Sep2017_PhaseIII/bggt_info06/omni_samples_info06_hwe_maf_bggt")
#cohort_short=("MARS_GSK" "MARS_Omni")
ncohort=${#cohort[@]}

#List of diseases/traits and the respective GWAS sample size taken from summary file, remove header line
#traits=( $(cut -f8 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | head -n 5 | tail -n +2) )
#nsamples=( $(cut -f3 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | head -n 5 | tail -n +2) )
#ntraits=${#traits[@]}
#phicode=( $(cut -f10 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | head -n 5 | tail -n +2) )
#traits=( $(cut -f8 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | tail -n +2) )
#traits=( ${traits[@]:39:14} )
#nsamples=( $(cut -f3 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | tail -n +2) )
#nsamples=${nsamples[@]:39:14}
#ntraits=( ${#traits[@]} )
#phicode=( $(cut -f10 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | tail -n +2) )
#phicode=( ${phicode[@]:39:14} )
traits=("copd")
nsamples=(50553)
ntraits=( ${#traits[@]} )
phicode=(0)

#get cohort and trait index for each job id
icohort=$((SLURM_ARRAY_TASK_ID / ntraits))
icohort=$icohort|cut -f1 -d"."
itrait=$(($SLURM_ARRAY_TASK_ID%$ntraits))

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "${cohort[$icohort]}"
echo "${traits[$itrait]}"
echo $icohort
echo $itrait

#create directory for storing results of each cohort
mkdir "/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${cohort_short[$icohort]}"

#run PRS-CS
#if [ ${phicode[$itrait]} == 2 ]
#then
#	python3 /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix="/binder/common/genotypes/qc_imputations/${cohort[$icohort]}" --sst_file="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${traits[$itrait]}.flipRisk" --n_gwas=${nsamples[$itrait]} --chr=6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22 --out_dir="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${cohort_short[$icohort]}/${traits[$itrait]}"
#elif [ ${phicode[$itrait]} == 1 ]
#then
#	python3 /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix="/binder/common/genotypes/qc_imputations/${cohort[$icohort]}" --sst_file="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${traits[$itrait]}.flipRisk" --n_gwas=${nsamples[$itrait]} --chr=6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22 --phi=1e-2 --out_dir="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${cohort_short[$icohort]}/${traits[$itrait]}"
#else
#	python3 /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix="/binder/common/genotypes/qc_imputations/${cohort[$icohort]}" --sst_file="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${traits[$itrait]}.flipRisk" --n_gwas=${nsamples[$itrait]} --chr=6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22 --phi=1e-4 --out_dir="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${cohort_short[$icohort]}/${traits[$itrait]}"
#fi

#run PRS-CS
if [ ${phicode[$itrait]} == 2 ]
then
        python3 /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix="/binder/common/genotypes/qc_imputations/${cohort[$icohort]}" --sst_file="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${traits[$itrait]}.flipRisk" --n_gwas=${nsamples[$itrait]} --out_dir="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${cohort_short[$icohort]}/${traits[$itrait]}"
elif [ ${phicode[$itrait]} == 1 ]
then
        python3 /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix="/binder/common/genotypes/qc_imputations/${cohort[$icohort]}" --sst_file="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${traits[$itrait]}.flipRisk" --n_gwas=${nsamples[$itrait]} --phi=1e-2 --out_dir="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${cohort_short[$icohort]}/${traits[$itrait]}"
else
        python3 /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix="/binder/common/genotypes/qc_imputations/${cohort[$icohort]}" --sst_file="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${traits[$itrait]}.flipRisk" --n_gwas=${nsamples[$itrait]} --phi=1e-4 --out_dir="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${cohort_short[$icohort]}/${traits[$itrait]}"
fi
