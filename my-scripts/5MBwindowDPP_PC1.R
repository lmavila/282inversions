library(DPP)

path.prefix="/home/lavila/projects/282inversions/5MB_windows/chr"

task.id<-Sys.getenv("MYTASK")
chr<-Sys.getenv("CHR") 
#cat("task is:",task.id,"\tchr is: ",chr,"\n",file="taskLogger.log",append=TRUE)

setwd(paste0(path.prefix,chr))
system(paste0("mkdir ","outs/window_",task.id))
window.dir<-paste("./outs/window_",task.id,sep="")
file.name.prefix<-paste("window_",task.id,sep="")
input.file.name<-paste("./PCS/",file.name.prefix,".pcs",sep="")
pcs<-read.table(input.file.name,sep="\t",skip=2,header=TRUE)
pcs[1:4,]
y<-pcs[,2]
y[1:10]
y <- c(y,rnorm(1,0,0.1))
y<-y[1:(length(y)-1)]
y<-(y-min(y))/(max(y)-min(y))

y[1:10]
# parameters


#priors
# each normal gets a mean and sd. means are drawn from a normal with:
mean_prior_sd <- 0.15 
mean_prior_mean <- 0.5
# sd's are drawn from a gamma with:
#sd_prior_shape<-3
#sd_prior_rate<-20
sd_prior_shape<-1.2
sd_prior_rate<-2


estimate_concentration_parameter<-FALSE
concentration_parameter_alpha= 1.080173 #from whole genom butwon't be used this time cause estimate_concentration_parameter=FALSE
concentration_parameter_beta=10;

# mcmc settings
generations <- 1000
expectedClusters <- 1.5 #set fix this time
num_runs <-1
max_generations<-30000

#running the DPP
normal.model<-new(NormalModel,
                  mean_prior_mean,
                  mean_prior_sd,
                  sd_prior_shape,
                  sd_prior_rate,
                  estimate_concentration_parameter,
                  concentration_parameter_alpha)

for(i in 1:num_runs) {

 my_analysis_withc <- dppMCMC_C(
               data=y,
               output = paste0(window.dir,"/run_",i,"_"),
               normal_model=normal.model,
               num_auxiliary_tables=4,
               expected_k=expectedClusters,
               power=1,verbose=TRUE)
  
  my_analysis_withc$run(generations,auto_stop=TRUE,max_gen = max_generations,min_ess = 300,sample_freq=10)
   #my_analysis_withc$run(generations,auto_stop=TRUE,max_gen=333)

}

catTrace<-my_analysis_withc$getNumCategoryTrace(0.25)
pdf(paste(window.dir,"/",file.name.prefix,"_catTrace.pdf",sep=""))
hist(catTrace)
dev.off()
category_probabilities<-my_analysis_withc$getNumCategoryProbabilities(0.25)
category_probabilities
topNumCat<-as.numeric(names(which.max(category_probabilities)))
topNumCat
max(catTrace)


probs<-category_probabilities
cat("window_id","converged","topNumCat",as.character(c(1:8)),"\n",file=paste(window.dir,"/",file.name.prefix,"_DPP.log",sep=""),append=FALSE,sep="\t")
cat(file.name.prefix,length(catTrace)<(max_generations*0.73),topNumCat,probs,"\n",file=paste(window.dir,"/",file.name.prefix,"_DPP.log",sep=""),append=TRUE,sep="\t")


#More Results
#Plotting the inferred normal distributions from the last run of the mcmc. 

pdf(paste(window.dir,"/",file.name.prefix,"_dist.pdf",sep=""))
hist(y,breaks=50,prob = TRUE,xlab="standardized PC1 values",main="Hitogram of PC1 values")
params<-my_analysis_withc$dpp_mcmc_object$getParamVector()
topNumCat<-as.numeric(names(which.max(category_probabilities)))
for(j in 1:topNumCat){
    curve(dnorm(x,
                mean=params[[1]][j],
                sd=params[[2]][j]),
                from=-10,
                to=10,
                col=1+j,
                add=TRUE,
                n=2000)
}
dev.off()
