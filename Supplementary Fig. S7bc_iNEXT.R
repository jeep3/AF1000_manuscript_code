library(iNEXT)
library(ggplot2)

x <- read.table("BGC_stat.txt", sep="\t", header = T,row.names=1)
data <- iNEXT(x, q=0, datatype="abundance", endpoint=2000, knots=20, se=TRUE, conf=0.95)
#out <- iNEXT(x, q=0, datatype="abundance", endpoint=5000, knots=50, se=TRUE, conf=0.95) #, size=NULL, endpoint=NULL, knots=40, se=TRUE, conf=0.95, nboot=50)

pdf("alpha.pdf")
ggiNEXT(data, type=1)
# Sample‐size‐based R/E curves, separating by "site""
#ggiNEXT(out, type=1, facet.var="site")
## Not run:
# Sample‐size‐based R/E curves, separating by "order"
#ggiNEXT(out, type=1, facet.var="order")
# display black‐white theme
#ggiNEXT(out, type=1, facet.var="order", grey=TRUE)
## End(Not run)
dev.off()

