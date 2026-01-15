#install.packages("GGally")
library("GGally")
setwd("C:/Users/huali/Desktop/projectcode/GGally_association_plot")
df<-read.csv("MLtree-annotated metabolites heatmap-pattern1.csv", stringsAsFactors=FALSE, head = T) 
df
cols <- c("#b2182b","#ef8a62","#fddbc7","#d1e5f0","#67a9cf","#2166ac")
p <- ggpairs(df,columns=1:12,
            aes(color=target))+
  scale_color_manual(values = cols)+
  scale_fill_manual(values = c("#b2182b","#ef8a62","#fddbc7","#d1e5f0","#67a9cf","#2166ac"))+
  
  theme_bw()+
  theme(axis.text = element_text(colour = "black", size = 9),
        strip.background = element_rect(fill = "#d63d2d"),
        strip.text = element_text(colour = "white", size = 10,
                                  face = "bold"))

p  
  

ggplot2::ggsave(filename = "MLtree-annotated metabolites heatmap-pattern1.pdf",p, width = 30, height = 30)


