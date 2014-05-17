##Speed Test

## load my function and g's
source("assign-1/pollutantmean.R") #brad's script
source("misc/g-pollutantmean.R") #arun's scipt

## set some general valid parameters to test
validDirectory <- c("specdata")
validPollutant <- c("sulfate","nitrate")
validFile <- list.files("assign-1/specdata")
#validFile <- c(1:10, 2:20)

runDirectory <- sample(validDirectory, 1)
samplePollutants <- sample(validPollutant, 1000, replace=T)
sampleIDS <- as.numeric(strtrim(sample(validFile, 1000, replace=T), 3))
testRun<-cbind(samplePollutants, sampleIDS)
testRun <- as.data.frame(testRun)
transform(testRun, sampleIDS = as.numeric(sampleIDS))

bRun <- system.time( {
for (i in 1:1000) {
    
    ## run the scripts
    pollutantmean(runDirectory, testRun[[i,1]], testRun[[i,2]])
    #gpollutantmean(runDirectory, runPollutant, runID)
    
    }
}
)