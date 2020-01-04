# set working directory
setwd("~/DataScienceCoursera/Exploratory Data Analysis/CourseProject2")
# Source files are loaded into sub-directory "raw_files"
# Now I load the NEI and SCC data frames from the .rds files.

NEI <- readRDS("raw_files/summarySCC_PM25.rds")
SCC <- readRDS("raw_files/Source_Classification_Code.rds")

### Question 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# Subset coal combustion related NEI data
combustionSubset <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalSubset <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionSubset & coalSubset)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png(filename='C:/Users/Rainer/Documents/GitHub/ExploratoryDataAnalysisProject2/plot4.PNG')
library(ggplot2)
ggplot(combustionNEI,aes(factor(year),Emissions/10^6)) +
    geom_bar(stat="identity",fill="orange") +
    labs(x="Year", y="Total PM2.5 Emission in million Tons") + 
    labs(title="PM2.5 Coal Combustion Source Emissions Across US from 1999-2008")

dev.off()