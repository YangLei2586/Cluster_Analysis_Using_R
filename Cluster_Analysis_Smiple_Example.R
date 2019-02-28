# Cluster analysis using R 

mtcars
d <- dist(as.matrix(mtcars)) 
d
# now with the distance matrix lets apply hierarchical clustering

hc <- hclust(d)  # default is complete
plot (hc, main="Complete Linkage Dendrogram")

hc <- hclust(d, method="single")  # default is complete
plot (hc, main="Complete Linkage Dendrogram")

hc2<- hclust(d, method="ward") 
plot(hc2, main="Ward Method Dendrogram") # display dendogram




# K-Means Cluster Analysis
library(cluster) # needed for clusplot
library(fpc)  # needed for plotcluster
hc <- kmeans(mtcars, 5) # 5 cluster solution
aggregate(mtcars,by=list(hc$cluster),FUN=mean)

# get cluster means Centroid Plot against 1st 2 discriminant functions
plotcluster(mtcars, hc$cluster, main="Plot Clusters")

clusplot(mtcars, hc$cluster, color=TRUE, shade=TRUE, labels=2, lines=0, main="KMeans Cluster Cars")
# append cluster assignment



# Multi dimensional scaling

# Still using the d matrix from above

#classical multidimensional scaling (Metric)
mds <- cmdscale(d,eig=TRUE, k=2) # k is the number of dim  Note EIG Means should the eigenvalues be rtuened
mds # view results

# plot solutionas a set of point (similar to a scatterplot)
x <- mds$points[,1]
y <- mds$points[,2]
plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2", main="Metric  MDS")
# alternatively
plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2", main="Metric  MDS", type="n")
text(x, y, labels = row.names(mtcars), cex=.7)


# Nonmetric MDS

library(MASS)  # You need this library

mds <- isoMDS(d, k=2) # k is the number of dim
mds # view results

# plot solution 
x <- mds$points[,1]
y <- mds$points[,2]
plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2", 
     main="Nonmetric MDS", type="n")
text(x, y, labels = row.names(mtcars), cex=.7)


