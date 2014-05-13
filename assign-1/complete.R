complete <- function(directory, id=1:332) {
    
    ## create a blank dataframe
    df <- data.frame(id = numeric(0), nobs = numeric(0))
    for (i in id) {
        ## pad the index with leading zeros
        num <- sprintf("%03d", i)
        ## create the file location
        path <- paste("assign-1/", directory, "/", num, ".csv", sep="")    
        data <- read.csv(path)
        ## count complete cases
        cc <- sum(complete.cases(data))
        ## build a new dataframe of a row for the new dataframe
        row <- data.frame(id = i, nobs = cc)
        ## append the row to the dataframe
        df <- rbind(df, row)
    }
    return(df)
}

