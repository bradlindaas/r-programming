best <- function(state, outcome) {
    
    ##read the sort function
    source("sort.R")
    ##call sort function to get the dataframe
    data <- sort(state, outcome)
    ## get the best record
    data[1,1]
}
