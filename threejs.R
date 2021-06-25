rm (list = ls(all=TRUE))
graphics.off()
library(readxl)
library(igraph)
library(threejs)
NTWVD <- read_excel("C:/Users/Mihan/Dropbox/DataCamp/R/Network_Analysis/NTWVD.xlsx")
NT.mat<-as.matrix(NTWVD)
NT1.mat<-NT.mat[,1:2]
g<-graph.edgelist(NT1.mat, directed=FALSE)
#g<-set_vertex_attr(g, "color", value="dodgerblue")

#g<-set_vertex_attr(g, "Label", value=c("USA","AUS","IND","JAP","MYS","NZL","SGP","PHL","SKR","SLK","THA","NIG","VEN","KWT","IRQ","SAU","CHN","ISR","CAD","GRC","PRT","IRL","BEL","HRV","AUT","RUS","NOR","BRD","CHL","UK","FRA"))
df<-data.frame(country=c("USA","AUS","IND","JAP","MYS","NZL","SGP","PHL","SKR","SLK","THA","NIG","VEN","KWT","IRQ","SAU","CHN","ISR","CAD","GRC","PRT","IRL","BEL","HRV","AUT","RUS","NOR","BRD","CHL","UK","FRA"))

g<-set_vertex_attr(g, "color", value=c("red","blue","green","red","green","red","green","green","green","green","green","yellow","yellow","yellow","yellow","yellow","blue","yellow","red","black","black","black","black","black","black","red","red","blue","blue","blue","blue") )
graphjs(g,vertex.size = 0.5, showLabels=TRUE, vertex.shape= df$country)
graphjs(g, main = "", curvature = 0, bg = "white",
        fg = "black", showLabels = TRUE, attraction = 1, repulsion = 1,
        max_iterations = 1500, opacity = 1, stroke = TRUE, width = NULL,
        height = NULL,vertex.shape= df$country)
#graphjs(g,vertex.size = 0.5, showLabels=TRUE)
#graphjs(g, main = "", curvature = 0, bg = "white",
#        fg = "black", showLabels = TRUE, attraction = 1, repulsion = 1,
#        max_iterations = 1500, opacity = 1, stroke = TRUE, width = NULL,
#        height = NULL)
gc=edge.betweenness.community(g)
sizes(gc)
i<-membership(gc)
g<-set_vertex_attr(g, "color", value= c("yellow","blue","red")[i])
graphjs(g)