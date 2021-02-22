#!/bin/bash
#
#SBATCH --job-name=prs
#SBATCH --output=err_out/prs_%A_%a.out
#SBATCH --error=err_out/prs_%A_%a.err
#SBATCH --array=0-79
#SBATCH --mem=12000
#SBATCH --partition=pe
#SBATCH --exclude=pe2,pe10

# --exclude=hp01,hp02

#List of different cohorts (complete path to data and short name)
cohort=("BeCome_SIA_Dec2019/bggt_info0.6/07_bestguess/probabilities_info0.6/become_dec2019_all" "MARS_GSK_610K_550K_PhaseIII/bggt_info06/550k610k_samples_info06_maf_hwe_bggt" "Omni_Sep2017_PhaseIII/bggt_info06/omni_samples_info06_hwe_maf_bggt" "GSA_Dec2018_PhaseIII/bggt_final/info_0.6/gsa_all_nosia")
cohort_short=("BeCome" "MARS_GSK" "MARS_Omni" "MARS_GSA")
ncohort=${#cohort[@]}

#List of diseases/traits and the respective GWAS sample size taken from summary file, remove header line
#traits=("AD" "ADHD" "age" "asthma" "BIP" "bladderNeoplasm" "bmi" "cancer" "celiacDisease" "chronicKidneyDisease" "copd" "coronaryArteryDisease" "covid19" "crohnsDisease" "crp" "diabetesType1" "diabetesType2" "drinking" "esophagus" "gender" "hypertension" "IL10" "IL17" "IL18" "IL1b" "IL4" "IL6" "loneliness" "lungCancer" "MDD" "pneumonia" "SCZ" "sleepDuration" "smokingStatus" "stroke" "TNFa" "tuberculosis")
#traits=( $(cut -f8 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | head -n 5 | tail -n +2) )
#nsamples=( $(cut -f3 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | head -n 5 | tail -n +2) )
#ntraits=${#traits[@]}
#phicode=( $(cut -f10 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | head -n 5 | tail -n +2) )
traits=( $(cut -f8 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | tail -n +41) )
nsamples=( $(cut -f3 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | tail -n +41) )
ntraits=${#traits[@]}
phicode=( $(cut -f10 /binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/GWAS_summaries.tsv | tail -n +41) )

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
if [ ${phicode[$itrait]} == 2 ]
then
	python3 /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix="/binder/common/genotypes/qc_imputations/${cohort[$icohort]}" --sst_file="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${traits[$itrait]}.flipRisk" --n_gwas=${nsamples[$itrait]} --out_dir="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${cohort_short[$icohort]}/${traits[$itrait]}"
elif [ ${phicode[$itrait]} == 1 ]
then
	python3 /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix="/binder/common/genotypes/qc_imputations/${cohort[$icohort]}" --sst_file="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${traits[$itrait]}.flipRisk" --n_gwas=${nsamples[$itrait]} --phi=1e-2 --out_dir="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${cohort_short[$icohort]}/${traits[$itrait]}"
else
	python3 /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix="/binder/common/genotypes/qc_imputations/${cohort[$icohort]}" --sst_file="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${traits[$itrait]}.flipRisk" --n_gwas=${nsamples[$itrait]} --phi=1e-4 --out_dir="/binder/mgp/datasets/2020_PRS_Covid19/GWAS_sumstats/${traits[$itrait]}/${cohort_short[$icohort]}/${traits[$itrait]}"
fi
