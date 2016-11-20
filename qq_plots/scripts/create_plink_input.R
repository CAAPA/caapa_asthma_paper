args <- commandArgs(trailingOnly = TRUE)
out.file <- args[1]
in.file <- "/gpfs/scratch/dayam/tmp_plink.txt"

plink.frame <- read.delim(in.file, sep=" ")
plink.frame$MAF <- plink.frame$FRQ
plink.frame$MAF[plink.frame$MAF > 0.5] <- 1 - plink.frame$MAF[plink.frame$MAF > 0.5]

write.table(plink.frame[,c(3,2)], out.file, sep="\t", quote=F, row.names=F, col.names=T)
