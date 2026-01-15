#remotes::install_github("const-ae/ggsignif")

#----------------------------------------raincloud plot-------Contig_N50-NCBI--------------------------------
library(ggplot2) 
library(RColorBrewer)
library(ggsignif)
setwd("C:/Users/huali/Desktop/projectcode")
df<-read.csv("data_normalized.csv", stringsAsFactors=FALSE, head = T) 

#--------------------------------------------(a2) Single set of data-----------------------------------

ggplot(df, aes(Class,BioM1))+ 
  geom_flat_violin(aes(fill=Class), position=position_nudge(x=.2), color="black") +
  geom_jitter(aes(color=Class), width=.1) +
  geom_boxplot(width=.1, position=position_nudge(x=.25), fill="white", size=0.5) +
  coord_flip() + 
  theme_bw()+ 
  theme( axis.text = element_text(size=13),
          axis.title =  element_text(size=15),
          legend.position=c(0.88,0.2))
#----------------------------------------Violin Plot - Boxplot------------------------------------------------------
library(ggplot2) 
library(RColorBrewer)
library(ggsignif)
setwd("C:/Users/huali/Desktop/projectcode")
df<-read.csv("data_normalized.csv", stringsAsFactors=FALSE, head = T) 

#--------------------------------------------Violin plot for a single set of data------------------------------

ggplot(df, aes(x= Class,y= BioM12))+
      geom_violin(aes(fill=Class),trim = FALSE)+ #Draw a Violin Diagram
      geom_boxplot(width=0.2)+                   #Draw a boxplot
      scale_fill_manual(values = c(brewer.pal(7,"Set2")[c(1,2,4,5)]))+
      geom_signif(comparisons = list(c("High","Low")),test = "t.test",
                  y_position = 3, map_signif_level = T)+
                  scale_y_continuous(expand = c(0,0), limits = c(-5,5))+ #Add significance markers between two groups
      theme_test()
      
      







