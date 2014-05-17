## create a script to random test

## reset working directory to protect from Arun's changes
#setwd("/srv/code/r-programming/")

## load my function and arun's
source("assign-1/pollutantmean.R") #brad's script
source("misc/g-pollutantmean.R") #arun's scipt

## set some general valid parameters to test
validDirectory <- c("specdata")
validPollutant <- c("sulfate","nitrate")
validFile <- list.files("assign-1/specdata")
#validFile <- c(1:10, 2:20)

## create a data frame to collect testing results
df <- data.frame(pass=factor(), arun = numeric(), brad = numeric(), 
                 P = character(), ID = numeric())

for (i in 1:1000) {

    ## pull some samples from the valid options
    runDirectory <- sample(validDirectory, 1)
    runPollutant <- sample(validPollutant, 1)
    runID <- as.numeric(strtrim(sample(validFile, 1), 3))
    
    ## protect my script from working directory changes
#    setwd("/srv/code/r-programming/")
    
    ## run the scripts
    brad <- pollutantmean(runDirectory, runPollutant, runID)
    arun <- gpollutantmean(runDirectory, runPollutant, runID)
    
    pass <- identical(brad, arun)
    
    row <- data.frame(pass = pass, arun = arun, brad = brad, P = runPollutant, ID = runID)
    df <- rbind(df, row)
}

summary(df)