rm (list = ls(all=TRUE))
graphics.off()
#install.packages("readxl")
#install.packages("igraph")
#install.packages("threejs")
library(readxl)
library(igraph)
CTO <- read_excel("C:/Users/Mihan/Dropbox/DataCamp/R/Network_Analysis/CTO.xlsx")
rawdata <- read_excel("C:/Users/Mihan/Dropbox/Mardi Meetings/Meeting 22/Testing/Important_codes/rawdata.xlsx")
CPNEW <- read_excel("C:/Users/Mihan/Dropbox/DataCamp/R/Network_Analysis/CPNEW.xlsx")
Z <- read_excel("C:/Users/Mihan/Dropbox/Mardi Meetings/Meeting 22/Testing/Important_codes/Z.xlsx")
VD <- read_excel("C:/Users/Mihan/Dropbox/DataCamp/R/Network_Analysis/VD.xlsx")
NTWVD <- read_excel("C:/Users/Mihan/Dropbox/DataCamp/R/Network_Analysis/NTWVD.xlsx")
CTO.mat<-as.matrix(CTO)
VD.mat<-as.matrix(VD)
NT.mat<-as.matrix(NTWVD)
NT1.mat<-NT.mat[,1:2]
g<-graph.edgelist(NT1.mat, directed=FALSE)
plot(g)
V(g)
E(g)
gsize(g)
gorder(g)
vertex_attr(g)
V(g)[[1:5]]
plot(g, vertex.label.color="black", layout=layout_in_circle(g))
#Layout with Fruchterman-Reingold
plot(g, vertex.label.color="black", layout=layout_with_fr(g))
#tree layout
plot(g, vertex.label.color="black", layout=layout_as_tree(g))
#default layout
plot(g, vertex.label.color="black", layout=layout_nicely(g))
g1<-graph_from_data_frame(NT1.mat, directed=TRUE)
is.directed(g1)
is.weighted(g1)
table(head_of(g1,E(g1)))
plot(g1, vertex.label.color="black", edge.color='gray77', vertex.size=0, 
     edge.arrow.size=0.1, layout=layout_nicely(g1))
g1['USA','UK']
g1['UK','France']
incident(g1,'USA', mode=c("all"))
incident(g1,'USA', mode=c("out"))
neighbors(g1,'USA', mode=c("all"))
#All the markets effecting USA back
neighbors(g1,'USA', mode=c("in"))
neighbors(g1,'IND', mode=c("in"))
n1<-neighbors(g1,'USA', mode=c("out"))
n2<-neighbors(g1,'AUS', mode=c("in"))
intersection(n1,n2)
farthest_vertices(g1)
get_diameter(g1)
ego(g1,2,'USA', mode=c('out'))
g.outd<-degree(g1,mode=c("out"))
table(g.outd)
hist(g.outd, breaks=30)
which.max(g.outd)
g.b<-betweenness(g1,directed = TRUE)
hist(g.b, breaks=80)
plot(g1,
     vertex.label=NA,
     edge.color='black',
     vertex.size=sqrt(g.b)+1,
     edge.arrow.size=0.05,
     layout=layout_nicely(g1))
g2<-graph_from_data_frame(NT1.mat, directed=FALSE)
gd<-edge_density(g2)
diameter(g2, directed=FALSE)
g.apl<- mean_distance(g2, directed=FALSE)
#make a random graph, nodes and edges are same as g2
#g.random<- erdos.renyi.game(n = gorder(g), p.or.m = gd, type="gnp")
largest_cliques(g2)
clq<-max_cliques(g2)
table(unlist(lapply(clq, length)))
lc<-largest.cliques(g2)
gc=edge.betweenness.community(g)
sizes(gc)
plot(gc,g)
#library(igraph)
#library(threejs)
#g<-set_vertex_attr(g, "color", value="dodgerblue")
#graphjs(g,vertex.size = 1)
