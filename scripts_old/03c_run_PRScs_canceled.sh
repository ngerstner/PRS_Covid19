#!/bin/bash
#
#SBATCH --job-name=prs
#SBATCH --output=err_out_prscs/prs_%A_%a.out
#SBATCH --error=err_out_prscs/prs_%A_%a.err
#SBATCH --array=0-1
#SBATCH --mem=12000
#SBATCH --exclude=hp01,hp02

#cohort=("BeCome_SIA_Dec2019/bggt_info0.6/07_bestguess/probabilities_info0.6/become_dec2019_all" "MARS_GSK_610K_550K_PhaseIII/bggt_info06/550k610k_samples_info06_maf_hwe_bggt")
cohort=("Omni_Sep2017_PhaseIII/bggt_info06/omni_samples_info06_hwe_maf_bggt" "GSA_Dec2018_PhaseIII/bggt_final/info_0.6/gsa_all_nosia")
#cohort=("BeCome_SIA_Dec2019/bggt_info0.6/07_bestguess/probabilities_info0.6/become_dec2019_all" "MARS_GSK_610K_550K_PhaseIII/bggt_info06/550k610k_samples_info06_maf_hwe_bggt" "Omni_Sep2017_PhaseIII/bggt_info06/omni_samples_info06_hwe_maf_bggt" "GSA_Dec2018_PhaseIII/bggt_final/info_0.6/gsa_all_nosia")
#cohort_short=("MARS_Omni" "MARS_GSA")
#cohort_short=("BeCome" "MARS_GSK" "MARS_Omni" "MARS_GSA")
ncohort=${#cohort[@]}

#traits=("AD" "ADHD" "age" "asthma" "BIP" "bladderNeoplasm" "bmi" "cancer" "celiacDisease" "chronicKidneyDisease" "copd" "coronaryArteryDisease" "covid19" "crohnsDisease" "crp" "diabetesType1" "diabetesType2" "drinking" "esophagus" "gender" "hypertension" "IL10" "IL17" "IL18" "IL1b" "IL4" "IL6" "loneliness" "lungCancer" "MDD" "pneumonia" "SCZ" "sleepDuration" "smokingStatus" "stroke" "TNFa" "tuberculosis")
#traits=( $(cut -f8 /binder/mgp/datasets/2020_GWAS_Covid19/GWAS_summaries.tsv | tail -n +5) )
#traits=("MDD" "SCZ")
traits=("MDD")
#nsamples=( $(cut -f3 /binder/mgp/datasets/2020_GWAS_Covid19/GWAS_summaries.tsv | tail -n +5) )
#nsamples=(500199 150064)
nsamples=(500199)
ntraits=${#traits[@]}
#echo ${traits[*]}
#echo ${nsamples[*]}

#get cohort and trait for each job id
icohort=$((SLURM_ARRAY_TASK_ID / ntraits))
icohort=$icohort|cut -f1 -d"."
itrait=$(($SLURM_ARRAY_TASK_ID%$ntraits))

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "${cohort[$icohort]}"
echo "${traits[$itrait]}"
echo $icohort
echo $itrait

mkdir "/binder/mgp/datasets/2020_GWAS_Covid19/${traits[$itrait]}/${cohort_short[$icohort]}"

#python /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix="/binder/common/genotypes/qc_imputations/${cohort[$icohort]}" --sst_file="/binder/mgp/datasets/2020_GWAS_Covid19/${traits[$itrait]}/${traits[$itrait]}.sumstats" --n_gwas=${nsamples[$itrait]} --out_dir="/binder/mgp/datasets/2020_GWAS_Covid19/${traits[$itrait]}/${cohort_short[$icohort]}/${traits[$itrait]}" --chrom=20,21,22
python /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix="/binder/common/genotypes/qc_imputations/${cohort[$icohort]}" --sst_file="/binder/mgp/datasets/2020_GWAS_Covid19/${traits[$itrait]}/${traits[$itrait]}.sumstats" --n_gwas=${nsamples[$itrait]} --out_dir="/binder/mgp/datasets/2020_GWAS_Covid19/${traits[$itrait]}/${cohort_short[$icohort]}/${traits[$itrait]}"
