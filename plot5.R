# set working directory
setwd("~/DataScienceCoursera/Exploratory Data Analysis/CourseProject2")
# Source files are loaded into sub-directory "raw_files"
# Now I load the NEI and SCC data frames from the .rds files.

NEI <- readRDS("raw_files/summarySCC_PM25.rds")
SCC <- readRDS("raw_files/Source_Classification_Code.rds")

### Question 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Gather the subset of the NEI data which corresponds to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data to Baltimore's fip
b24510VehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]

png(filename='C:/Users/Rainer/Documents/GitHub/ExploratoryDataAnalysisProject2/plot5.PNG')
library(ggplot2)
ggplot(b24510NEI,aes(factor(year),Emissions)) +
    geom_bar(stat="identity",fill="pink") +
    labs(x="Year", y="Total PM2.5 Emission") + 
    labs(title="PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008")

dev.off()