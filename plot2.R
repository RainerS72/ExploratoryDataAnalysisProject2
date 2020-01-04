# set working directory
setwd("~/DataScienceCoursera/Exploratory Data Analysis/CourseProject2")
# Source files are loaded into sub-directory "raw_files"
# Now I load the NEI and SCC data frames from the .rds files.

NEI <- readRDS("raw_files/summarySCC_PM25.rds")
SCC <- readRDS("raw_files/Source_Classification_Code.rds")

### Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips=="24510") from 1999 to 2008?

# Subset NEI data by Baltimore's fip.
b24510NEI <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
aggTotalsB24510 <- aggregate(Emissions ~ year, b24510NEI,sum)

png(filename='C:/Users/Rainer/Documents/GitHub/ExploratoryDataAnalysisProject2/plot2.PNG')

barplot(
    aggTotalsB24510$Emissions, names.arg=aggTotalsB24510$year,
    xlab="Year", ylab="Emissions in Tons",
    main="Total PM2.5 Emissions From all Baltimore City Sources (24510)"
)


dev.off()
