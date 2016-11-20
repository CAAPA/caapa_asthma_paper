args <- commandArgs(trailingOnly = TRUE)
common.str <- args[1]
mac.threshold <- args[2]
out.file.name <- args[3]
input.dir <- "../data/input"

plotQQ <- function(p.vals, study.name, plot.type) {
  observed <- sort(p.vals)
  lobs <- -(log10(observed))
  expected <- c(1:length(observed))
  lexp <- -(log10(expected / (length(expected)+1)))
  plot(c(0,10), c(0,10), col="red", lwd=1, type="l",
       xlab="Expected (-logP)", ylab="Observed (-logP)",
       xlim=c(0,10), ylim=c(0,10),
       las=1, xaxs="i", yaxs="i", bty="l", main=paste0(study.name, " (" , plot.type, ")"))
  points(lexp, lobs, pch=23, cex=.1, bg="black")
  inflation.factor <- ( round(median(qchisq(1-p.vals,1), na.rm=T) / qchisq(0.5,1),4) )
  text(7, 2, bquote(lambda == .(inflation.factor)))
}

png(out.file.name, width=10, height=16, units = 'in', res = 200)
par(mfrow=c(4,3), cex=1.2)
for (i in 4:14) {
  study <- args[i]
  print(study)
  #results <- read.delim(paste0(input.dir, "/", study, ".txt"), stringsAsFactors = F)
  #n <- as.numeric(read.delim(paste0(input.dir, "/n_", study, ".txt"), stringsAsFactors = F, head=F))
  results <- read.delim("short_CAG.txt", stringsAsFactors = F)
  n <- 327
  results$MAC <- results$MAF * 2 * n
  if (common.str == "common") {
    p.vals <- results$PVALUE[results$MAF >= 0.05]
    plot.type <- "MAF >= 0.05"
  } else if (common.str == "rare") {
    p.vals <- results$PVALUE[results$MAF < 0.05]
    p.vals <- results$PVALUE[results$MAC > mac.threshold]
    plot.type <- "MAF < 0.05"
  } 
  plotQQ(p.vals, study, plot.type)
}
dev.off()
