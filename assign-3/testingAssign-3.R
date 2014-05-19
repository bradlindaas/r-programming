source("2-rankall.R")
    originalRun <- system.time ( {
    originalResult <- rankall("heart attack", 4)
} )

source("rankall.R")
    updatedRun <- system.time ( {
    updatedResult <- rankall("heart attack", 4)
} )


#[1] 'best' part 1          best("SC", "heart attack")
#[2] 'best' part 2          best("NY", "pneumonia")
#[3] 'best' part 3          best("NN", "pneumonia")
#[4] 'rankhospital' part 1  rankhospital("NC", "heart attack", "worst")
#[5] 'rankhospital' part 2  rankhospital("WA", "heart attack", 7)
#[6] 'rankhospital' part 3  rankhospital("WA", "pneumonia", 1000)
#[7] 'rankhospital' part 4  rankhospital("NY", "heart attak", 7)
#[8] 'rankall' part 1       rankall("heart attack", 4)
#[9] 'rankall' part 2       rankall("pneumonia", "worst")
#[10] 'rankall' part 3      rankall("heart failure", 10)

identical (updatedResult, originalResult)