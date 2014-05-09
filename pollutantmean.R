pollutantmean <- function (directory = "specdata", 
                           pollutant = "sulfate", id = 1:3) {

    ## create an empty data frame to collect data
    df <- data.frame(Date = character(0), sulfate = numeric(0), 
                     nitrate = numeric(0), ID = integer(0))
    ## build the large dataframe
    for (i in id) {
        num <- sprintf("%03d", i)
        path <- paste("assign-1/", directory, "/", num, ".csv", sep="")    
        data <- read.csv(path)
        df<-rbind(df, data)
    }
    
    m<-mean(df[,pollutant], na.rm=T)
    print(m)
}

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

corr <- function(directory = "specdata", threshold = 0) {
    
}

