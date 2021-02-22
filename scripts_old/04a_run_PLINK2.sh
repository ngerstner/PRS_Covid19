#!/bin/bash
#
#SBATCH --job-name=prs_plink
#SBATCH --output=prs_plink.out
#SBATCH --error=prs_plink.err
#SBATCH --mem=10000
#SBATCH --exclude=hp01,hp02

/binder/mgp/code/plink2/plink2 --score /binder/mgp/datasets/2020_GWAS_Covid19/AD/BeCome_all_chromosomes.txt 2 4 6 --out /binder/mgp/datasets/2020_GWAS_Covid19/AD/BeCome_plink_out.txt --bfile /binder/common/genotypes/qc_imputations/BeCome_SIA_Dec2019/bggt_info0.6/07_bestguess/probabilities_info0.6/become_dec2019_all
