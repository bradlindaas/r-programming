
complete <- function(directory, id=1:332) {
    
    df <- data.frame(id = numeric(0), nobs = numeric(0))
    for (i in id) {
        num <- sprintf("%03d", i)
        path <- paste("assign-1/", directory, "/", num, ".csv", sep="")    
        data <- read.csv(path)
        cc <- sum(complete.cases(data))
        row <- data.frame(id = i, nobs = cc)
        df <- rbind(df, row)
    }
    return(df)
}

