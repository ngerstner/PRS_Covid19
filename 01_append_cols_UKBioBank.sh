#!/bin/bash

#add relevant columns from general UKBB info file to each summary statistic file
traits_ukbb=("age" "bladderNeoplasm" "cancer" "copd" "diabetesType1" "drinking" "esophagus" "gender" "hypertension" "lungCancer" "pneumonia" "stroke" "tuberculosis")
#traits_ukbb=("age")
#traits_ukbb=("bladderNeoplasm" "cancer" "copd" "diabetesType1" "drinking" "esophagus" "gender" "hypertension" "lungCancer" "pneumonia" "stroke" "tuberculosis")
base_path="/binder/mgp/datasets/2020_PRS_Covid19"

for trait in "${traits_ukbb[@]}"; do
	echo $trait
	paste "${base_path}/${trait}/${trait}.txt" "${base_path}/UKBB_variants_snpinfo.tsv" > "${base_path}/${trait}/${trait}_new.txt"
	#awk 'NF{NF-=2}1' OFS="\t" "${base_path}/${trait}/${trait}.txt" > "${base_path}/${trait}/${trait}_new.txt"
	rm "${base_path}/${trait}/${trait}.txt"
	mv "${base_path}/${trait}/${trait}_new.txt" "${base_path}/${trait}/${trait}.txt"
done
