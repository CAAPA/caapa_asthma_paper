#!/bin/bash

module load R/3.2.5

sbatch --mem=99000 draw_qq.sh common 0  ../data/output/common_qq.png

sbatch --mem=99000 draw_qq.sh rare 0  ../data/output/rare_qq.png

sbatch --mem=99000 draw_qq.sh rare 10  ../data/output/rare_mac_10_qq.png

sbatch --mem=99000 draw_qq.sh rare 6  ../data/output/rare_mac_6_qq.png

sbatch --mem=99000 draw_qq.sh rare 20  ../data/output/rare_mac_20_qq.png

sbatch --mem=99000 draw_qq.sh rare 16  ../data/output/rare_mac_16_qq.png
