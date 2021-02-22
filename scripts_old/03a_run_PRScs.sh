#!/bin/bash
#
#SBATCH --job-name=prstest3
#SBATCH --output=prstest3.out

cohort=(BeCome_SIA_Dec2019/bggt_info0.6/07_bestguess/probabilities_info0.6/become_dec2019_all MARS_GSK_610K_550K_PhaseIII/bggt_info06/550k610k_samples_info06_maf_hwe_bggt Omni_Sep2017_PhaseIII/bggt_info06/omni_samples_info06_hwe_maf_bggt GSA_Dec2018_PhaseIII/bggt_final/info_0.6/gsa_all_nosia)

python /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix=/binder/common/genotypes/qc_imputations/BeCome_SIA_Dec2019/bggt_info0.6/07_bestguess/probabilities_info0.6/become_dec2019_all --sst_file=/binder/mgp/datasets/2020_GWAS_Covid19/cancer/cancer.sumstats --n_gwas=455258 --out_dir=/binder/mgp/datasets/2020_GWAS_Covid19/cancer/
