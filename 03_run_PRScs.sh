#!/bin/bash
#
#SBATCH --job-name=prstest
#SBATCH --output=prstest_cancer.out

python /binder/common/PRS-CS/PRScs.py --ref_dir=/binder/common/PRS-CS/ldblk_1kg_eur/ --bim_prefix=/binder/common/genotypes/qc_imputations/BeCome_SIA_Dec2019/bggt_info0.6/07_bestguess/probabilities_info0.6/become_dec2019_all --sst_file=/binder/mgp/datasets/2020_GWAS_Covid19/cancer/cancer.sumstats --n_gwas=455258 --out_dir=/binder/mgp/datasets/2020_GWAS_Covid19/cancer/
