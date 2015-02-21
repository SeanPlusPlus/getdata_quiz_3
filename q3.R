# Load the Gross Domestic Product data for the 190 ranked countries in this data set:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
#
# Load the educational data from this data set:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
#
# Match the data based on the country shortcode. How many of the IDs match?
# Sort the data frame in descending order by GDP rank (so United States is last).
# What is the 13th country in the resulting data frame?

################################################################################
getGDP <- function() {
################################################################################

  # add data dir
  if (!file.exists("data")) {
    dir.create("data")
  }

  # fetch and return
  # countryUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  # download.file(countryUrl, destfile = "./data/data3_gdp.csv", method = "curl")

  gdp <- read.csv("./data/data3_gdp.csv", skip = 4, nrows = 190)
  return(gdp)
}

################################################################################
getED <- function() {
################################################################################

  # add data dir
  if (!file.exists("data")) {
    dir.create("data")
  }

  # fetch and return
  # educationUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  # download.file(educationUrl, destfile = "./data/data3_ed.csv", method = "curl")

  ed <- read.csv("./data/data3_ed.csv")
  return(ed)
}


################################################################################
main <- function() {
################################################################################
  gdp <- getGDP()
  ed  <- getED()

  countries <- ed$CountryCode
  d <- gdp$X[gdp$X %in% countries] # 189

  print(length(d))

  print(tail(head(gdp[order(gdp$X.1, decreasing = TRUE), ], 13),1)$X.3)
}

main()

# 189
# St. Kitts
