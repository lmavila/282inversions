#library("VariantAnnotation")
suppressMessages(library("VariantAnnotation"))

setwd('/home/lavila/projects/282inversions/output')
files<-list.files(pattern="*.vcf")

for (input.filename in files) {
  vcf<-readVcf(input.filename,"") #reading the vcf file
  tempMat<-as.data.frame(geno(vcf)[[1]])
  genoLevels<-levels(unlist(tempMat))
#[1] "."   "0/0" "0/1" "0/2" "1/1" "1/2" "2/2"
  tempMat2<-data.frame(lapply(tempMat, as.character), stringsAsFactors=FALSE)
  rownames(tempMat2)<-rownames(tempMat)
  tempMat<-tempMat2
  i<-0
  for (genotype_label in genoLevels){
    tempMat[tempMat==genotype_label]<-i
    i<-i+1
  }

#could be replaced by 
# apply(tempMat,c(1,2), function(x) which(x==genoLevels)) 
# if faster

  tempMat<-as.matrix(tempMat)
  class(tempMat)<-"numeric"
  tempMat<-t(tempMat)
  tempMat<-tempMat[,apply(tempMat, 2, var, na.rm=TRUE) != 0] #this removes non variable loci
  tempMat.pca <-  prcomp(tempMat,center=TRUE,scale.=TRUE)

  pc1<-tempMat.pca$x[,1]
  pc2<-tempMat.pca$x[,2]
  pc3<-tempMat.pca$x[,3]
  pc4<-tempMat.pca$x[,4]
  pc5<-tempMat.pca$x[,5]
  pc6<-tempMat.pca$x[,6]
  pc7<-tempMat.pca$x[,7]
  pc8<-tempMat.pca$x[,8]
  pc9<-tempMat.pca$x[,9]
  pc10<-tempMat.pca$x[,10]

  return.frame<-data.frame(pc1,pc2,pc3,pc4,pc5,pc6,pc7,pc8,pc9,pc10)
  output.filename<-paste(strsplit(input.filename,split="[.]")[[1]][1],".pcs",sep="")
  write.table(return.frame,file=output.filename ,sep="\t")

} #end of list.file loop
