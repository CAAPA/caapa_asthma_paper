#!/bin/bash

cohort=$1
study=$2
plink_dir=/gpfs/barnes_share/CAAPA_ADPC/caapa_plink_assoc_analysis/data/output/
cohort_dir=${plink_dir}${cohort}
out_file=../data/input/${study}.txt

echo -e FRQ PVALUE > $SCRATCH/tmp_plink.txt
for chr in {1..22..1}
do
    cohort_file=${cohort_dir}/chr${chr}.assoc.dosage
    cat $cohort_file | sed -e '1d' | tr -s ' ' | sed 's/^ //g' | sed 's/ $//g' | cut -f4,8 -d' ' >> $SCRATCH/tmp_plink.txt
done

cat create_plink_input.R | R --vanilla --args $out_file

rm  $SCRATCH/tmp_plink.txt
