library(readxl)
library(igraph)
library(threejs)
VD2 <- read_excel("C:/Users/Mihan/Dropbox/DataCamp/R/Network_Analysis/VD2.xlsx", col_names = FALSE)
VD2<-as.matrix(VD2)
g <- graph_from_adjacency_matrix(VD2, weighted=TRUE)
df<-data.frame(country=c("USA","AUS","IND","JAP","MYS","NZL","SGP","PHL","SKR","SLK","THA","NIG","VEN","KWT","IRQ","SAU","CHN","ISR","CAD","GRC","PRT","IRL","BEL","HRV","AUT","RUS","NOR","BRD","CHL","UK","FRA"))

g<-set_vertex_attr(g, "color", value=c("red","blue","green","red","green","red","green","green","green","green","green","yellow","yellow","yellow","yellow","yellow","blue","yellow","red","black","black","black","black","black","black","red","red","blue","blue","blue","blue") )
graphjs(g,vertex.size = 0.3, showLabels=TRUE, vertex.shape= df$country)
graphjs(g, main = "", curvature = 0, bg = "white",
        fg = "black", showLabels = TRUE, attraction = 1, repulsion = 1,
        max_iterations = 1500, opacity = 1, stroke = TRUE, width = NULL,
        height = NULL,vertex.shape= df$country)
graphjs(g,vertex.size = 0.5, showLabels=TRUE)
graphjs(g, main = "", curvature = 0, bg = "white",
        fg = "black", showLabels = TRUE, attraction = 1, repulsion = 1,
        max_iterations = 1500, opacity = 1, stroke = TRUE, width = NULL,
        height = NULL)