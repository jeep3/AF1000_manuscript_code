# Set working directory
setwd("C:/Users/hualixie/Desktop/code/Rworkdirectory")

# Load required packages using pacman (installs automatically if not already installed)
if (!require("pacman")) install.packages("pacman")
pacman::p_load(ggplot2, ggrepel, dplyr, RColorBrewer)

###############################BGC gene expresion#############################
# Read the input CSV file
data <- read.csv("BGC_clade4_1_significant_expression_gene.csv", header = TRUE)

# Rename columns to standard names
# Assumes columns: gene_name, FoldChange, p.value
colnames(data) <- c("gene", "log2FC", "pvalue")

# If FoldChange is not in log2 scale, apply log2 transformation:
# data$log2FC <- log2(data$log2FC)

# Sort by log2FC (descending) and p-value (ascending)
data <- data %>%
  arrange(desc(log2FC), pvalue)

# Add a rank column
data$rank <- 1:nrow(data)

# Select top up- and down-regulated genes for labeling
top_n <- 10  # Number of top genes to label
top_up <- head(data, top_n)
top_down <- tail(data, top_n)
genes_to_label <- rbind(top_up, top_down)

# Set diverging color palette (e.g., RdBu)
colors <- rev(RColorBrewer::brewer.pal(11, "RdBu"))

# Create the gene ranking dotplot with custom color scale
p <- ggplot(data, aes(x = rank, y = log2FC, color = pvalue, size = abs(log2FC))) +
  geom_point() +
  # P-value color scale: deep red (low p-value) to sky blue (high p-value)
  scale_color_gradientn(colors = c("#de2d26", "#3182bd")) +
  geom_hline(yintercept = c(-1, 1), linetype = "dashed", color = "gray") +
  geom_hline(yintercept = 0, linetype = "solid") +
  geom_vline(xintercept = median(data$rank), linetype = "dashed", color = "gray") +
  geom_text_repel(data = genes_to_label, aes(label = gene), size = 3, color = "red") +
  labs(
    x = "Gene Rank",
    y = "Fold Change",
    color = "P-value",
    size = "Fold Change"
  ) +
  theme_bw(base_size = 14)

# Show the plot
print(p)

# Optionally save the plot to a file
ggsave("BGCs_gene_ranking_dotplot.pdf", plot = p, width = 8, height = 6)

###############################Regulation gene expresion#############################
# Read the input CSV file
data <- read.csv("Regulators_clade4_1_significant_expression_gene.csv", header = TRUE)

# Rename columns to standard names
# Assumes columns: gene_name, FoldChange, p.value
colnames(data) <- c("gene", "log2FC", "pvalue")

# If FoldChange is not in log2 scale, apply log2 transformation:
# data$log2FC <- log2(data$log2FC)

# Sort by log2FC (descending) and p-value (ascending)
data <- data %>%
  arrange(desc(log2FC), pvalue)

# Add a rank column
data$rank <- 1:nrow(data)

# Select top up- and down-regulated genes for labeling
top_n <- 10  # Number of top genes to label
top_up <- head(data, top_n)
top_down <- tail(data, top_n)
genes_to_label <- rbind(top_up, top_down)

# Set diverging color palette (e.g., RdBu)
colors <- rev(RColorBrewer::brewer.pal(11, "RdBu"))

# Create the gene ranking dotplot with custom color scale
p <- ggplot(data, aes(x = rank, y = log2FC, color = pvalue, size = abs(log2FC))) +
  geom_point() +
  scale_color_gradientn(colors = c("#54278f", "#31a354")) +
  scale_size(range = c(2, 6)) +  # Enlarged points
  geom_hline(yintercept = c(-1, 1), linetype = "dashed", color = "gray") +
  geom_hline(yintercept = 0, linetype = "solid") +
  geom_vline(xintercept = median(data$rank), linetype = "dashed", color = "gray") +
  geom_text_repel(data = genes_to_label, aes(label = gene), size = 3, color = "red") +
  labs(
    x = "Gene Rank",
    y = "Fold Change",
    color = "P-value",
    size = "Fold Change"
  ) +
  theme_bw(base_size = 14)

# Show the plot
print(p)

# Optionally save the plot to a file
ggsave("Regulaotors_gene_ranking_dotplot.pdf", plot = p, width = 8, height = 6)
