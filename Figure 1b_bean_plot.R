# Load required package
library(beanplot)

# Set working directory
setwd("C:/Users/hualixie/Desktop/code/Rworkdirectory")

# Read input CSV file
data <- read.csv("Figure1b-input.csv", check.names = FALSE)

# Rename columns
colnames(data) <- c("TreeID", "Longitude", "Clade", "Chemotype")

# Clean and format data
data$Longitude <- as.numeric(data$Longitude)
data$Chemotype <- trimws(data$Chemotype)  # Remove extra spaces
data <- na.omit(data)  # Remove rows with NA

# Set Chemotype order (left: Aflatoxigenic, right: Non-Aflatoxigenic)
data$Chemotype <- factor(data$Chemotype, levels = c("Aflatoxigenic", "Non-Aflatoxigenic"))

# Combine Clade and Chemotype to create Group
data$Group <- interaction(data$Clade, data$Chemotype, sep = "_")

# Define custom order for Group
group_levels <- c("Clade4,5_Aflatoxigenic", "Clade4,5_Non-Aflatoxigenic",
                  "Clade6,7_Aflatoxigenic", "Clade6,7_Non-Aflatoxigenic",
                  "Clade2_Aflatoxigenic",   "Clade2_Non-Aflatoxigenic",
                  "Clade3_Aflatoxigenic",   "Clade3_Non-Aflatoxigenic",
                  "Clade8_Aflatoxigenic",   "Clade8_Non-Aflatoxigenic")
data$Group <- factor(data$Group, levels = group_levels)

# Define color mapping for Chemotypes
chemotype_color_map <- c("Aflatoxigenic" = "#1f77b4",       # blue
                         "Non-Aflatoxigenic" = "#ff7f0e")   # orange

# Assign colors to each group (left and right same color)
col_matrix <- lapply(levels(data$Group), function(g) {
  chemotype <- strsplit(as.character(g), "_")[[1]][2]
  rep(chemotype_color_map[[chemotype]], 2)
})

# Create beanplot
beanplot(Longitude ~ Group,
         data = data,
         ll = 0.04,
         main = "Longitude distribution by Clade and Chemotype",
         ylab = "Longitude",
         xaxt = "n",  # Disable automatic x-axis
         side = "both",
         border = NA,
         col = col_matrix,
         beanlines = "median",
         overallline = "mean",
         kernel = "gaussian",
         las = 2,
         cex.axis = 0.8)

# Add custom x-axis labels (Clade group names)
clade_labels <- c("Clade4,5", "Clade6,7", "Clade2", "Clade3", "Clade8")
midpoints <- seq(1.5, 9.5, by = 2)  # Position between each pair of beans
axis(side = 1,
     at = midpoints,
     labels = clade_labels,
     tick = TRUE,
     tck = -0.02,
     lwd.ticks = 1,
     cex.axis = 0.9)

# Add legend for Chemotype
legend("bottomright",
       fill = chemotype_color_map,
       legend = names(chemotype_color_map),
       title = "Chemotype")
