# Using the jpeg package read in the following picture of your instructor into R
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg
#
# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the
# resulting data?
#
# (some Linux systems may produce an answer 638 different for the 30th quantile)

################################################################################
getImage <- function() {
################################################################################

  # install packages
  install.packages("jpeg")
  library(jpeg)

  # add data dir
  if (!file.exists("data")) {
    dir.create("data")
  }

  # fetch and return
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
  download.file(fileUrl, destfile = "./data/data2.jpg", method = "curl")
  img <- readJPEG("./data/data2.jpg", native = TRUE)
  return(img)
}

################################################################################
main <- function() {
################################################################################
  img <- getImage()
}

main()
# img <- source('q2.R')
# data <- data.matrix(img)
# answer <- quantile(data[[1]], c(.3, .8))
# print(answer)
