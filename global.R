d <- iris
numeric_columns <- colnames(d)[1:4]
d$Species.Nbr <- as.integer(d$Species)

#h <- paste(readLines('iris_scatter.html'), collapse='\n')
