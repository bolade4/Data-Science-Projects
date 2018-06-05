# This mini-project is based on the K-Means exercise from 'R in Action'
# Go here for the original blog post and solutions
# http://www.r-bloggers.com/k-means-clustering-from-r-in-action/

#--------------------------------------------------------------------
#
## Exercise 0: Install these packages if you don't have them already
#
#--------------------------------------------------------------------

# check to see if the packages have been installed
is.installed("cluster")
is.installed("rattle.data")
is.installed("Nbclust")

# install.packages(c("cluster", "rattle.data","NbClust"))
install.packages(c("rattle.data","NbClust"))
library(rattle.data)
library(NbClust)

# Now load the data and look at the first few rows
data(wine, package="rattle.data")
head(wine)

#--------------------------------------------------------------------
#
## Exercise 1: Remove the first column from the data and scale
## it using the scale() function
#
#--------------------------------------------------------------------

# standardize dataset

wine$Type <- NULL
wine.Notype <- wine
head(wine.Notype)
df <- scale(wine.Notype)
head(df)
rm(wine.notype)

# Now we'd like to cluster the data using K-Means. 
# How do we decide how many clusters to use if you don't know that already?
# We'll try two methods.

# Method 1: A plot of the total within-groups sums of squares against the 
# number of clusters in a K-means solution can be helpful. A bend in the 
# graph can suggest the appropriate number of clusters. 

# get number of clusters with any of these two methods
wssplot <- function(data, nc=15, seed=1234){
	              wss <- (nrow(data)-1)*sum(apply(data,2,var))
               	      for (i in 2:nc){
		        set.seed(seed)
	                wss[i] <- sum(kmeans(data, centers=i)$withinss)}
	                
		      plot(1:nc, wss, type="b", xlab="Number of Clusters",
	                        ylab="Within groups sum of squares")
	   }

wssplot(df)

#--------------------------------------------------------------------
#
## Exercise 2:
##   * How many clusters does this method suggest?
##   * Why does this method work? What's the intuition behind it?
##   * Look at the code for wssplot() and figure out how it works
#
#--------------------------------------------------------------------

# This method suggested 3 clusters

# It worked because after the first 3 clusters, the decrease in 
# clusters dropps off which suggest a 3 cluster solution should be a
# a good fit to the data. Also, the function indicates that there's a
# distinct drop in within groups sum of squares when moving from 
# cluster 1 to 3

# wsssplot() is a function with 3 arguments
# the first argument will be the dataset
# second argument is the maximum number of cluster to be considered
# while the third argument is a random number seed that is set
# the first line in the function calculates the multiplication of the
# number of rows in the dataset minus one by sum of the apply() 
# function with the data, margin and the var function in it
# then a for loop is created and
# finally, a plot function is called to plot the graph with labels of
# graph and a type "b"


# Method 2: Use the NbClust library, which runs many experiments
# and gives a distribution of potential number of clusters.

library(NbClust)
set.seed(1234)
nc <- NbClust(df, min.nc=2, max.nc=15, method="kmeans")
barplot(table(nc$Best.n[1,]),
	          xlab="Numer of Clusters", ylab="Number of Criteria",
		            main="Number of Clusters Chosen by 26 Criteria")

#--------------------------------------------------------------------
#
## Exercise 3: How many clusters does this method suggest?
#
#--------------------------------------------------------------------

# This method suggested a 3 cluster solution

#--------------------------------------------------------------------
#
## Exercise 4: Once you've picked the number of clusters, run k-means 
## using this number of clusters. Output the result of calling kmeans()
## into a variable fit.km
#
#--------------------------------------------------------------------

# analyse K-means clustering

set.seed(1234)
fit.km <- kmeans(df, 3, nstart = 25)
str(fit.km)
fit.km$size
fit.km$centers
aggregate(wine.Notype, by = list(cluster = fit.km$cluster), mean)

# Now we want to evaluate how well this clustering does.

#-----------------------------------------------------------------------------------
#
## Exercise 5: using the table() function, show how the clusters in fit.km$clusters
## compares to the actual wine types in wine$Type. Would you consider this a good
## clustering?
#
#-----------------------------------------------------------------------------------

# comparing the wine type and the kmean cluster
data(wine)
head(wine)
cluster.Comp <- table(wine$Type, fit.km$cluster)
cluster.Comp

# determine if this is a good clustering
library(flexclust)
randIndex(cluster.Comp)

# This is good clustering because it has a very good agreement 
# between the wine varietal type and the cluster solution which is
# 0.9

#---------------------------------------------------------------------------------
#
## Exercise 6:
## * Visualize these clusters using  function clusplot() from the cluster library
## * Would you consider this a good clustering?
#
#---------------------------------------------------------------------------------

library(cluster)
wine.cluster <- fit.km$cluster
head(wine.Notype)
str(wine.Notype)
clusplot(wine.Notype, wine.cluster, color = T, shade = T, labels = 2, lines = 0)

# Yes, it is a good clustering