# set working directory
setwd("~/DataScienceCoursera/Exploratory Data Analysis/CourseProject2")
# Source files are loaded into sub-directory "raw_files"
# Now I load the NEI and SCC data frames from the .rds files.

NEI <- readRDS("raw_files/summarySCC_PM25.rds")
SCC <- readRDS("raw_files/Source_Classification_Code.rds")

### Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008?

# Subset NEI data by Baltimore's fip.
b24510NEI <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
aggTotalsB24510 <- aggregate(Emissions ~ year, b24510NEI,sum)

png(filename='C:/Users/Rainer/Documents/GitHub/ExploratoryDataAnalysisProject2/plot3.PNG')
library(ggplot2)
ggplot(b24510NEI,aes(factor(year),Emissions,fill=type)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE) +
    facet_grid(.~type,scales = "free",space="free") + 
    labs(x="Year", y="Total PM2.5 Emission in Tons") + 
    labs(title="PM2.5 Emissions, Baltimore City 1999-2008, by source type")

dev.off()