corr <- function(directory, threshold = 0) {
    ##create the vector to return
    v <- numeric()
    ## build the path
    path <- paste("assign-1/", directory, "/", sep="")
    ## grad all the files in the directory
    files<-list.files(path)
    for (fileName in files) {
        data <- read.csv(paste(path, fileName, sep=""))
        if (sum(complete.cases(data))>threshold) {
            corr <- cor(data$sulfate, data$nitrate, use = "complete")
            ##append the corr to the return vector
            v<-c(v,corr)
        }
    }
    return(v)
}