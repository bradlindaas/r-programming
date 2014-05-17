gpollutantmean <- function(directory, pollutant, id = 1:332) {
    
    # Format number as fixed width, with leading zeros
    filenames <- paste("assign-1/", directory,"/",formatC(id, width=3, flag="0"),".csv",sep="")
    
    # Reading multiple csiv files, produces a list of dataframes
    dataframes <- lapply(filenames, read.csv, head=TRUE,sep=",")
    
    # Merging dataframes in a single dataframe
    dataframe <- do.call(rbind,dataframes)
    
    # Calculate the mean of the given pollultant
    pollutantmean <- colMeans(data.matrix(dataframe[pollutant]), na.rm = TRUE)
    
    return(pollutantmean[[1]])
}