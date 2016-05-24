complete <- function(directory, id = 1:332) {
  dataframe = NULL    
  setwd(file.path(getwd(), directory)) 
  for (i in id)
  {
    if (i <10) { 
      data <- read.csv(paste("0","0", as.character(i), ".csv", sep=""), 
                       header = T, 
                       na.strings=c("NA","NaN", " "))
    }
    else if (i>=10 & i<100) { 
      data <- read.csv(paste("0", as.character(i), ".csv", sep=""), 
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
    
    data = na.omit(data) 
    data = as.matrix(data) ##make matrix for each successive row of our dataframe
    dataframe = rbind(dataframe, c(i,nrow(data))) # fill each successive row of our dataframe
  }
  
  setwd("..") 
  dataframe = data.frame(dataframe)  # from matix to data frame 
  names(dataframe) = c('id', 'nobs') # output
  return (dataframe) 
}
