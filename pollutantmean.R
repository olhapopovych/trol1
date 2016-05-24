pollutantmean <- function(directory, pollutant, id = 1:332) {
  setwd(file.path(getwd(), directory))
  total = 0                           
  stupidValues = 0                   
  for (i in id)
  {
    if (i <10) { 
      data <- read.csv(paste("0","0", as.character(i), ".csv", sep=""),  ## 'id' =7  -> 007.csv
                       header = T, 
                       na.strings=c("NA","NaN", " "))
    }
    else if (i>=10 & i<100) { 
      data <- read.csv(paste("0", as.character(i), ".csv", sep=""),  ## 'id' = 17 -> 017.csv
                       header = T, 
                       na.strings=c("NA","NaN", " ") 
      )
    }
else       { 
      data <- read.csv(paste(as.character(i), ".csv", sep=""),  
                       header = T, 
                       na.strings=c("NA","NaN", " ") 
      )
    }
    data = na.omit(data)    ## Handle Na
    stupidValues = stupidValues + nrow(data)
    if (pollutant == "sulfate") {
      total = total + sum(data$sulfate) ## Commands starting with a '$' sign need to be executed from a Unix or Linux shell
    }
    else {
      total = total + sum(data$nitrate)
    }
  }
  setwd("..") ## reset
  return (total/stupidValues) #return mean()
}
