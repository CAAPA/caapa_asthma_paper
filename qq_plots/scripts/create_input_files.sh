#!/bin/bash

#GRAAD
cut -f4,6 /gpfs/barnes_share/caapa_metal/data/input/jhu_650y.txt > ../data/input/GRAAD.txt
echo 781 > ../data/input/n_GRAAD.txt

#BRIDGE
bash create_plink_input.sh jhu_abr BRIDGE
echo 85 > ../data/input/n_BRIDGE.txt

#CAG
cut -f4,6 /gpfs/barnes_share/caapa_metal/data/input/chicago.txt > ../data/input/CAG.txt
echo 270 > ../data/input/n_CAG.txt

#DETROIT - dummy for now
cp ../data/input/CAG.txt ../data/input/SAPPHIRE.txt
cp ../data/input/n_CAG.txt ../data/input/n_SAPPHIRE.txt

#ARIC
bash create_plink_input.sh jackson_aric ARIC
echo 327 > ../data/input/n_ARIC.txt

#JHS
bash create_plink_input.sh jackson_jhs JHS
echo 632 > ../data/input/n_JHS.txt

#SAGE
cut -f4,6 /gpfs/barnes_share/caapa_metal/data/input/ucsf_sf.txt > ../data/input/SAGE.txt
echo 1692 > ../data/input/n_SAGE.txt

#NIH
cut -f4,9 /gpfs/barnes_share/dcl01_data_aniket/data/CAAPA_jhuGRAAD_BDOS_032416/WASHINGTON/imputed/GENESIS/allchr_output_genesis_info_clean.txt | sed 's/Score.pval/PVALUE/' > ../data/input/NIH.txt
echo 1831 > ../data/input/n_NIH.txt

#SARP
bash create_plink_input.sh winston_salem SARP
echo 341 > ../data/input/n_SARP.txt

#BAGS
cut -f4,6 /gpfs/barnes_share/caapa_metal/data/input/jhu_bdos_mqls.txt > ../data/input/BAGS.txt
echo 684 > ../data/input/n_BAGS.txt

#GALA
cut -f4,6 /gpfs/barnes_share/caapa_metal/data/input/ucsf_pr.txt > ../data/input/GALA.txt
echo 1754 > ../data/input/n_GALA.txt
