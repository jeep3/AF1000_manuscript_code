#-------------------------------------------Scaffold_Number频数直方图和密度图
library(ggplot2)  

df<-read.csv("histogram.csv",stringsAsFactors=FALSE, head = T) 

#--------------------------------------------(a2) 单组数据直方图-----------------------------------

ggplot(df, aes(x=ScaffoldN))+ 
    
    geom_histogram(binwidth = 10,alpha=0.65,colour="black",size=0.25, fill= "#69b3a2")+#, aes(fill = ..count..) )
    
    theme_test()
   
#--------------------------------------------(a2) 单组数据密度图-----------------------------------
ggplot(df, aes(x=ScaffoldN))+ 
 
  geom_density(bw = 10,colour = "#984ea3",size=0.5)+
  theme_test()



#-------------------------------------------NCBIScaffold_Number频数直方图和密度图
library(ggplot2)  

df<-read.csv("histogram-public.csv",stringsAsFactors=FALSE, head = T) 

#--------------------------------------------(a2) 单组数据直方图-----------------------------------

ggplot(df, aes(x=Scaffold_Number))+ 
  
  geom_histogram(binwidth = 10,alpha=0.65,colour="black",size=0.25, fill= "#69b3a2")+#, aes(fill = ..count..) )
  
  theme_test()

#--------------------------------------------(a2) 单组数据密度图-----------------------------------
ggplot(df, aes(x=Scaffold_Number))+ 
  
  geom_density(bw = 10,colour = "#984ea3",size=0.5)+
  theme_test()




#-------------------------------------------Contig_N50频数直方图和密度图
library(ggplot2)  

df<-read.csv("histogram-N50.csv",stringsAsFactors=FALSE, head = T) 

#--------------------------------------------(a2) 单组数据直方图-----------------------------------

ggplot(df, aes(x=Contig_N50))+ 
  
  geom_histogram(binwidth = 0.05,alpha=0.65,colour="black",size=0.25, fill= "#69b3a2")+#, aes(fill = ..count..) )
  
  theme_test()

#--------------------------------------------(a2) 单组数据密度图-----------------------------------
ggplot(df, aes(x=Contig_N50))+ 
  
  geom_density(bw = 0.05,colour = "#984ea3",size=0.5)+
  theme_test()



#-------------------------------------------Contig_N50-NCBI
library(ggplot2)  

df<-read.csv("histogram-N50-public.csv",stringsAsFactors=FALSE, head = T) 

#--------------------------------------------(a2) 单组数据直方图-----------------------------------

ggplot(df, aes(x=Contig_N50))+ 
  
  geom_histogram(binwidth = 0.05,alpha=0.65,colour="black",size=0.25, fill= "#69b3a2")+#, aes(fill = ..count..) )
  
  theme_test()

#--------------------------------------------(a2) 单组数据密度图-----------------------------------
ggplot(df, aes(x=Contig_N50))+ 
  
  geom_density(bw = 0.05,colour = "#984ea3",size=0.5)+
  theme_test()

#--------------------------------This_study+NCBI-ContigN50频数直方图--------------
library(ggplot2)  

df<-read.csv("histogram-N50-our+NCBI.csv",stringsAsFactors=FALSE, header = T) 

#--------------------------------------------(a2) 多数剧系列直方图-----------------------------------

ggplot(df, aes(x=Contig_N50, fill=Type))+  
  geom_histogram(binwidth = 0.05,alpha=0.55,colour="black",size=0.25)+#, aes(fill = ..count..) )
  theme_bw()
  theme(
    text=element_text(size=15,color="black"),
    plot.title=element_text(size=15,family="myfont",face="bold.italic",hjust=.5,color="black"),#,
    legend.position=c(0.8,0.8),
    legend.background = element_blank()
  )

#----------------------------------------(b2)多数剧系列核密度估计图----------------------------------
ggplot(df, aes(x=Contig_N50, fill=Type))+ 
  geom_density(alpha=0.65,bw=0.04,colour="black",size=0.45)+
  theme_bw()+
  theme(
    text=element_text(size=12,color="black"),
    plot.title=element_text(size=12,family="myfont",face="bold.italic",hjust=.5,color="black"),#,
    legend.position=c(0.92,0.92),
    legend.background = element_blank()
  )

  #--------------------------------This_study+NCBI-ScaffoldNumber频数直方图--------------
  library(ggplot2)  
  
  df<-read.csv("histogram-Scaffold-our+NCBI.csv",stringsAsFactors=FALSE, header = T) 
  
  #--------------------------------------------(a2) 多数剧系列直方图-----------------------------------
  
  ggplot(df, aes(x=ScaffoldN, fill=Type))+  
    geom_histogram(binwidth = 20,alpha=0.55,colour="black",size=0.25)+#, aes(fill = ..count..) )
    theme_bw()
  theme(
    text=element_text(size=15,color="black"),
    plot.title=element_text(size=15,family="myfont",face="bold.italic",hjust=.5,color="black"),#,
    legend.position=c(0.8,0.8),
    legend.background = element_blank()
  )
  
  #----------------------------------------(b2)多数剧系列核密度估计图----------------------------------
  ggplot(df, aes(x=ScaffoldN, fill=Type))+ 
    geom_density(alpha=0.55,bw=10,colour="black",size=0.45)+
    theme_bw()+
    theme(
      text=element_text(size=12,color="black"),
      plot.title=element_text(size=12,family="myfont",face="bold.italic",hjust=.5,color="black"),#,
      legend.position=c(0.9,0.92),
      legend.background = element_blank()
    )
  
  
