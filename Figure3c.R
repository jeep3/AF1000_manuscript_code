#pdf('/dellfsqd2/ST_OCEAN/USER/zhaofang/02.Project/55.huangqumei_pan-genome/case1/05.GenomeComponent/09.pan_3357_gene_diff/unblast_function_enrichment/unblast.final.pep.KEGG.pdf', width=10, height=10)
#d=read.table('/dellfsqd2/ST_OCEAN/USER/zhaofang/02.Project/55.huangqumei_pan-genome/case1/05.GenomeComponent/09.pan_3357_gene_diff/unblast_function_enrichment/unblast.final.pep.matrix', sep='	')
#df=data.frame(table(d$V2, d$V1)) # a new matrix
#df$Freq[df$Freq==0]=NA # value = 0 -> value = NA
#df=na.omit(df) # filter NA, for more beautiful pdf, but not necessary
#df$Var1=factor(df$Var1, levels=rev(df$Var1)) # make labels of GO func. as wish
#colours=colorRampPalette(c('royalblue','palegreen3','indianred2','deepskyblue','darkorange'))(length(levels(df$Var2)))
#library(ggplot2)
#library(grid) # use subroutine: unit
#qplot(Var1, Freq, data=df, geom='bar', position='stack', stat='identity', fill=Var2)+
#        labs(x='', y='Number of Genes')+
#        theme(legend.title=element_blank(), legend.text=element_text(angle=270),
#                legend.key.width=unit(1, 'mm'), legend.key.height=unit(4, 'cm'),
#                legend.text.align=0.5, plot.title=element_text(face='bold'),axis.text=element_text(color='black'),
#                panel.background = element_rect(fill='transparent'),panel.grid=element_line(color='grey'),
#                panel.border=element_rect(fill='transparent',color='black'),axis.title=element_text(size=15))+
#        geom_text(aes(label=Freq), hjust=-0.5, vjust=0.5, size = 4)+
#        scale_y_continuous(limits=c(0,250.8), trans='sqrt')+coord_flip()+
#        scale_fill_manual(values=colours)
#dev.off()
library(ggplot2)
library(grid)
options(stringsAsFactors=F)
color=c("#ce0351", "#6600ff","red", "#00cfff", "#00ff00", "#ffcf00","red","yellow")
library(ggplot2)
library(grid)
library(RColorBrewer)
options(stringsAsFactors=F)
pdf('/dellfsqd2/ST_OCEAN/USER/zhaofang/02.Project/55.huangqumei_pan-genome/case1/05.GenomeComponent/09.pan_3357_gene_diff/unblast_function_enrichment/unblast.final.pep.KEGG.pdf', width=15, height=10)
d=read.table('/dellfsqd2/ST_OCEAN/USER/zhaofang/02.Project/55.huangqumei_pan-genome/case1/05.GenomeComponent/09.pan_3357_gene_diff/unblast_function_enrichment/unblast.final.pep.matrix', sep='	')
df=data.frame(table(d$V2, d$V1)) # a new matrix
df$Freq[df$Freq==0]=NA # value = 0 -> value = NA
df=na.omit(df) # filter NA, for more beautiful pdf, but not necessary
df$Var1=factor(df$Var1, levels=rev(df$Var1)) # 
order1<-df[order(-df$Freq),]
order2<-order1[order(order1$Var2),]
order2$Var1<-factor(order2$Var1,levels =order2$Var1)
#colours=colorRampPalette(brewer.pal(9,"Set1"))(length(levels(order2$Var2)))
colours=colorRampPalette(c("#E41A1C","#377EB8","#4DAF4A","#984EA3","#FF7F00","#FFE528","#A65628","#F781BF","#999999"))(9)[1:length(levels(order2$Var2))]
ggplot(df,aes(x=Var1,y=Freq,fill=Var2)) + scale_fill_manual(values=colours)+
  geom_bar(position="stack",stat="identity") +theme(panel.background=element_rect(fill=NA,colour="grey"), panel.grid=element_line(color='grey'), panel.border=element_rect(fill='transparent',color='black'),legend.title=element_blank(), legend.text = element_text(size = 15), plot.title=element_text(face='bold', size=20),axis.title=element_text(size=20), axis.text.x=element_text(color='black', size=8,),axis.text.y=element_text(color='black', size=15))+coord_flip()+labs(x='', y='Number of Genes')+scale_y_continuous(limits=c(0,250.8), trans='sqrt')+geom_text(aes(label=Freq), hjust=-0.5, vjust=0.5, size = 4)+scale_x_discrete(limits = rev(levels(order2$Var1)))
dev.off()

