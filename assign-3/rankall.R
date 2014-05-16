rankall <- function(outcome, num = "best") {
    df <- data.frame(hospital = character(), state = factor())
    source("rankhospital.R")
    source("sort.R")
    validStates <- getValidStates()
    for (state in validStates){
        hospital <- rankhospital(state, outcome, num)
        row <- data.frame(hospital = hospital, state = state)
        df <- rbind(df, row)
    }
    return(df)
}