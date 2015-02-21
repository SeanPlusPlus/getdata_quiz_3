# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?

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

  high <- ed[ed$Income.Group == "High income: OECD", ]
  countries <- high$CountryCode
  print(mean(gdp$X.1[gdp$X %in% countries]))

  low <- ed[ed$Income.Group == "High income: nonOECD", ]
  countries <- low$CountryCode
  print(mean(gdp$X.1[gdp$X %in% countries]))
}

# main()
# 32.96667, 91.91304
