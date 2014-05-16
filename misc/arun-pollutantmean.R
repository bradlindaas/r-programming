arunpollutantmean <- function(directory, pollutant, id)
{
    
    #declare and intialize variables
    # count and string variables
    count = 0;
    one_zero = "0"
    two_zero = "00"
    extension = ".csv"
    filename = ""
    
    # Variables used in calculations
    Running_agg = 0
    Running_rows = 0
    pollutant_agg = 0
    pollutant_rows = 0
    
    #Initialize data frames
    X = data.frame()
    XClean = data.frame()
    
    #Handle NULL id
    if (!id) {id <- 1}
    
    #set working directory to specdata
    setwd("/srv/code/r-programming/assign-1/specdata")
    
    
    
    # Start the for() loop
    #
    for (count in id) {
        
        #form the filename 
        if (nchar(count) ==1){
            filename  <- paste(two_zero, toString(count), extension, sep='')
        } else if (nchar(count) == 2) { 
            filename  <- paste(one_zero, toString(count), extension, sep='')
        } else {
            filename  <- paste(toString(count), extension, sep='')
        }
        
        # Read the file, omit NAs
        X = read.csv(filename, header = TRUE) 
        XClean = na.omit(X)
        
        # Aggregate the column matching pollutant
        if (pollutant == "nitrate") {
            pollutant_agg = sum(XClean$nitrate)
            pollutant_rows = nrow(XClean)
        }
        if (pollutant == "sulfate") {
            pollutant_agg = sum(XClean$sulfate)
            pollutant_rows = nrow(XClean)
        }
        
        # keep a running total of tables and rows
        Running_agg = Running_agg + pollutant_agg
        Running_rows = Running_rows + pollutant_rows
    }
    # End of for loop
    
    pollutant_mean = Running_agg/Running_rows
    return (pollutant_mean)
}