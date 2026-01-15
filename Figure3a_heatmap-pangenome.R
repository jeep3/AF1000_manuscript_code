library(ComplexHeatmap)
library(circlize)

# Set working directory
setwd("C:/Users/hualixie/Desktop/code/Rworkdirectory")

# set the color
col_fun <- colorRamp2(c(0, 1), c("#67a9cf", "#d35858"))

# core gene
data1 <- read.csv("core.gene.csv", row.names = 1, check.names = FALSE)
p1 <- Heatmap(t(as.matrix(data1)),
              name = "Core",
              col = col_fun,
              cluster_rows = TRUE,
              cluster_columns = TRUE,
              show_row_dend = FALSE,
              show_column_dend = FALSE,
              show_row_names = FALSE,
              show_column_names = FALSE,
              show_heatmap_legend = FALSE)

# accessory gene
data2 <- read.csv("accessory.gene.csv", row.names = 1, check.names = FALSE)
p2 <- Heatmap(t(as.matrix(data2)),
              name = "Accessory",
              col = col_fun,
              cluster_rows = TRUE,
              cluster_columns = TRUE,
              show_row_dend = FALSE,
              show_column_dend = FALSE,
              show_row_names = FALSE,
              show_column_names = FALSE,
              show_heatmap_legend = FALSE)

# unique gene
data3 <- read.csv("unique.gene.csv", row.names = 1, check.names = FALSE)
p3 <- Heatmap(t(as.matrix(data3)),
              name = "Unique",
              col = col_fun,
              cluster_rows = TRUE,
              cluster_columns = TRUE,
              show_row_dend = FALSE,
              show_column_dend = FALSE,
              show_row_names = FALSE,
              show_column_names = FALSE,
              show_heatmap_legend = FALSE)

# combined the plot
draw(p1 + p2 + p3, gap = unit(5, "mm"))
