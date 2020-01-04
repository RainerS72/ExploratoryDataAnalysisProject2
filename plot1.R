# set working directory
setwd("~/DataScienceCoursera/Exploratory Data Analysis/CourseProject2")
# Source files are loaded into sub-directory "raw_files"
# Now I load the NEI and SCC data frames from the .rds files.

NEI <- readRDS("raw_files/summarySCC_PM25.rds")
SCC <- readRDS("raw_files/Source_Classification_Code.rds")

### Question 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.


# Aggregate the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
aggTotals <- aggregate(Emissions ~ year,NEI, sum)

# location of PNG file
png(filename='C:/Users/Rainer/Documents/GitHub/ExploratoryDataAnalysisProject2/plot1.PNG')

# Using the base plotting system, I plot the total PM2.5 Emission from all sources,
barplot(
  (aggTotals$Emissions)/10^6,
  names.arg=aggTotals$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From All US Sources"
)
# close PNG file
dev.off()