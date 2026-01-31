#------------------------------------------- Scaffold_Number Frequency Histogram and Density Plot
library(ggplot2)  

# Read the data from the CSV file
df <- read.csv("histogram.csv", stringsAsFactors = FALSE, header = TRUE) 

#-------------------------------------------- (a2) Single Group Histogram -----------------------------------
ggplot(df, aes(x = ScaffoldN)) + 
  geom_histogram(binwidth = 10, alpha = 0.65, colour = "black", size = 0.25, fill = "#69b3a2") + 
  theme_test()  # Apply the 'test' theme to the plot

#-------------------------------------------- (a2) Single Group Density Plot -----------------------------------
ggplot(df, aes(x = ScaffoldN)) + 
  geom_density(bw = 10, colour = "#984ea3", size = 0.5) +  # Set bandwidth and color for the density plot
  theme_test()  # Apply the 'test' theme

#------------------------------------------- NCBI Scaffold_Number Frequency Histogram and Density Plot
library(ggplot2)  

# Read the data from the CSV file for NCBI data
df <- read.csv("histogram-public.csv", stringsAsFactors = FALSE, header = TRUE) 

#-------------------------------------------- (a2) Single Group Histogram -----------------------------------
ggplot(df, aes(x = Scaffold_Number)) + 
  geom_histogram(binwidth = 10, alpha = 0.65, colour = "black", size = 0.25, fill = "#69b3a2") + 
  theme_test()  # Apply the 'test' theme

#-------------------------------------------- (a2) Single Group Density Plot -----------------------------------
ggplot(df, aes(x = Scaffold_Number)) + 
  geom_density(bw = 10, colour = "#984ea3", size = 0.5) +  # Set bandwidth and color for the density plot
  theme_test()  # Apply the 'test' theme

#------------------------------------------- Contig_N50 Frequency Histogram and Density Plot
library(ggplot2)  

# Read the data for Contig_N50
df <- read.csv("histogram-N50.csv", stringsAsFactors = FALSE, header = TRUE) 

#-------------------------------------------- (a2) Single Group Histogram -----------------------------------
ggplot(df, aes(x = Contig_N50)) + 
  geom_histogram(binwidth = 0.05, alpha = 0.65, colour = "black", size = 0.25, fill = "#69b3a2") + 
  theme_test()  # Apply the 'test' theme

#-------------------------------------------- (a2) Single Group Density Plot -----------------------------------
ggplot(df, aes(x = Contig_N50)) + 
  geom_density(bw = 0.05, colour = "#984ea3", size = 0.5) +  # Set bandwidth and color for the density plot
  theme_test()  # Apply the 'test' theme

#------------------------------------------- Contig_N50-NCBI Frequency Histogram and Density Plot
library(ggplot2)  

# Read the data for Contig_N50-NCBI
df <- read.csv("histogram-N50-public.csv", stringsAsFactors = FALSE, header = TRUE) 

#-------------------------------------------- (a2) Single Group Histogram -----------------------------------
ggplot(df, aes(x = Contig_N50)) + 
  geom_histogram(binwidth = 0.05, alpha = 0.65, colour = "black", size = 0.25, fill = "#69b3a2") + 
  theme_test()  # Apply the 'test' theme

#-------------------------------------------- (a2) Single Group Density Plot -----------------------------------
ggplot(df, aes(x = Contig_N50)) + 
  geom_density(bw = 0.05, colour = "#984ea3", size = 0.5) +  # Set bandwidth and color for the density plot
  theme_test()  # Apply the 'test' theme

#-------------------------------- This Study + NCBI-Contig N50 Frequency Histogram -----------------------------------
library(ggplot2)  

# Read data for Contig N50 comparison between this study and NCBI
df <- read.csv("histogram-N50-our+NCBI.csv", stringsAsFactors = FALSE, header = TRUE) 

#-------------------------------------------- (a2) Multiple Series Histogram -----------------------------------
ggplot(df, aes(x = Contig_N50, fill = Type)) +  
  geom_histogram(binwidth = 0.05, alpha = 0.55, colour = "black", size = 0.25) +  # Create histogram for different types
  theme_bw() +  # Apply the 'bw' theme
  theme(
    text = element_text(size = 15, color = "black"),  # Set font size and color
    plot.title = element_text(size = 15, family = "myfont", face = "bold.italic", hjust = 0.5, color = "black"),  # Set title style
    legend.position = c(0.8, 0.8),  # Position the legend
    legend.background = element_blank()  # Remove background for the legend
  )

#---------------------------------------- (b2) Multiple Series Kernel Density Estimate Plot ----------------------------------
ggplot(df, aes(x = Contig_N50, fill = Type)) + 
  geom_density(alpha = 0.65, bw = 0.04, colour = "black", size = 0.45) +  # Create density plot for different types
  theme_bw() +  # Apply the 'bw' theme
  theme(
    text = element_text(size = 12, color = "black"),  # Set font size and color
    plot.title = element_text(size = 12, family = "myfont", face = "bold.italic", hjust = 0.5, color = "black"),  # Set title style
    legend.position = c(0.92, 0.92),  # Position the legend
    legend.background = element_blank()  # Remove background for the legend
  )

#-------------------------------- This Study + NCBI-Scaffold Number Frequency Histogram -----------------------------------
library(ggplot2)  

# Read data for Scaffold Number comparison between this study and NCBI
df <- read.csv("histogram-Scaffold-our+NCBI.csv", stringsAsFactors = FALSE, header = TRUE) 

#-------------------------------------------- (a2) Multiple Series Histogram -----------------------------------
ggplot(df, aes(x = ScaffoldN, fill = Type)) +  
  geom_histogram(binwidth = 20, alpha = 0.55, colour = "black", size = 0.25) +  # Create histogram for different types
  theme_bw() +  # Apply the 'bw' theme
  theme(
    text = element_text(size = 15, color = "black"),  # Set font size and color
    plot.title = element_text(size = 15, family = "myfont", face = "bold.italic", hjust = 0.5, color = "black"),  # Set title style
    legend.position = c(0.8, 0.8),  # Position the legend
    legend.background = element_blank()  # Remove background for the legend
  )

#---------------------------------------- (b2) Multiple Series Kernel Density Estimate Plot ----------------------------------
ggplot(df, aes(x = ScaffoldN, fill = Type)) + 
  geom_density(alpha = 0.55, bw = 10, colour = "black", size = 0.45) +  # Create density plot for different types
  theme_bw() +  # Apply the 'bw' theme
  theme(
    text = element_text(size = 12, color = "black"),  # Set font size and color
    plot.title = element_text(size = 12, family = "myfont", face = "bold.italic", hjust = 0.5, color = "black"),  # Set title style
    legend.position = c(0.9, 0.92),  # Position the legend
    legend.background = element_blank()  # Remove background for the legend
  )
