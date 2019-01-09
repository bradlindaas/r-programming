pollutantmean <- function (directory, pollutant , id = 1:332) {

    ## create an empty dataframe to collect data
    df <- data.frame(Date = character(0), sulfate = numeric(0), 
                     nitrate = numeric(0), ID = integer(0))
    ## build the large dataframe
    for (i in id) {
        ## pad the index up to 3 digits
        num <- sprintf("%03d", i)
        ## build a file location
        path <- paste("assign-1/", directory, "/", num, ".csv", sep="")    
        data <- read.csv(path)
        ## append the file to the large dataframe
        df<-rbind(df, data)
    }
    
    mean(df[,pollutant], na.rm=T)
}
