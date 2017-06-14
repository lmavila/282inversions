# Run with Rscript --vanilla top95.R /path/to/root
library(methods)
args = commandArgs(trailingOnly=TRUE)
#local.path="/Users/lavila/Documents/Work/UCDavis/Winter_2016/Code/282inversions/REAL_ANALYSIS/VCF_HapMap_v321/top95/"
local.path=args[1]

topK<-function(x,cutoff){
  row<-x[-1]
  row.table<-sort(as.numeric(table(as.numeric(row))),decreasing=TRUE)
  accum.val<-0
  return.val<-0
  for(i in 1:length(row.table)) {
    accum.val<-accum.val+as.numeric(row.table[i])
    if(accum.val>(length(x)*cutoff)){
      return.val<-i
      break
    }
  }
  return(return.val)
}

getNumCategoryProbabilities = function(x,burnin_cutoff=0.25) {
      "returns the probabilities vector for inferred number of categories"
      catTrace<-x[floor(0.25*length(x)):length(x)]
      category_probabilities <- table(catTrace)/length(catTrace)
      probs<-c()
      for(catIndex in 1:max(catTrace)){
        probs<-c(probs,category_probabilities[as.character(catIndex)])
      }
      probs[is.na(probs)]<-0
      names(probs)<-c(1:max(catTrace))
      return (probs)
    }
mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}



cat("window_id","topNumCat",as.character(c(1:8)),"\n",append=FALSE,sep="\t")
for(i in 1:232){
  dir.path<-paste0(local.path,"/","window_",i)
  if(dir.exists(dir.path)){
    setwd(dir.path)
    x<-read.table("run_1_allocation.log",header=TRUE)
    new_x<-apply(x,1,topK,cutoff=0.95)
    cat(i,mode(new_x[1:floor(0.95*length(new_x))]),getNumCategoryProbabilities(new_x)[1:8],"\n",sep="\t")
  }     
}
  
