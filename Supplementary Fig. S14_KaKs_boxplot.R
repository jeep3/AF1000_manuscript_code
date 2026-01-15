library(ggplot2)
setwd("C:/Users/huali/Desktop/projectcode/KaKs/54-AFclusterKaKs")
set.seed(141079)

data <- read.csv("54_cluster.AFLA_139100.csv", header = T)
head(data)
#---------------------------------------------------------------------
# Boxplot for multiple data series1

  ggplot(data, aes(x = Clade, y = AFLA_139100, fill = Clade, alpha=0.8))+
  
  
  stat_boxplot(geom = "errorbar",
               size=0.5,
               width=0.15,
               position = position_dodge(0.83))+
  geom_jitter(mapping = aes(x = Clade, y = AFLA_139100), alpha=0.8, size=2)+
  
  geom_boxplot(outlier.size = 2,alpha=0.8,
               position = position_dodge(0.83),size=0.5) +
  
  #scale_fill_manual(values = c("#4500ACFF","#1800C0FF","#2F0DD4FF","#593FE5FF","#7063F3FF","#7D7CFCFF"))+
      
  #scale_fill_manual(values = c("#0073C2FF","#EFC000FF","#868686FF","#CD534CFF","#7AA6DCFF","#003C67FF"))+
  scale_fill_manual(values = c("#374E55FF","#DF8F44FF","#00A1D5FF","#B24745FF","#79AF97FF","#6A6599FF"))+
  
 
  theme_bw()

#theme(axis.title=element_text(size=10,face="plain",color="black"),
       #axis.text = element_text(size=9,face="plain",color="black"),
       #panel.background=element_rect(colour="black",fill=NA),
       #panel.grid.minor=element_blank(),
       #legend.position= c(3,3),
       #legend.background=element_rect(colour=NA,fill=NA),
       #axis.ticks=element_line(colour="black"))
#---------------------------------------------------------------------
#(a)Box plot for multiple data series2
ggplot(data, aes(x = Clade, y = AFLA_139100, fill = Clade))+
  
  geom_jitter(mapping = aes(x = Clade, y = AFLA_139100), alpha=0.4, size=3)+
  
  geom_violin(aes(fill=Clade),trim=FALSE,width=1.3,alpha=0.8,size=0.8)+
  
  scale_fill_manual(values = c("#374E55FF","#DF8F44FF","#00A1D5FF","#B24745FF","#79AF97FF","#6A6599FF"))+
  
  geom_boxplot(outlier.size = 2,alpha=0.1, width=0.4,
               position = position_dodge(0.3),size=0.6) +
  stat_boxplot(geom = "errorbar",
               size=0.6,
               width=0.12,
               position = position_dodge(0.83))+
  
  #scale_fill_manual(values = c("#4500ACFF","#1800C0FF","#2F0DD4FF","#593FE5FF","#7063F3FF","#7D7CFCFF"))+
  
  #scale_fill_manual(values = c("#0073C2FF","#EFC000FF","#868686FF","#CD534CFF","#7AA6DCFF","#003C67FF"))+
  
  
  theme_classic()

#theme(axis.title=element_text(size=10,face="plain",color="black"),
#axis.text = element_text(size=9,face="plain",color="black"),
#panel.background=element_rect(colour="black",fill=NA),
#panel.grid.minor=element_blank(),
#legend.position= c(3,3),
#legend.background=element_rect(colour=NA,fill=NA),
#axis.ticks=element_line(colour="black"))
