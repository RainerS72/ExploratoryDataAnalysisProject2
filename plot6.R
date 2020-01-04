# set working directory
setwd("~/DataScienceCoursera/Exploratory Data Analysis/CourseProject2")
# Source files are loaded into sub-directory "raw_files"
# Now I load the NEI and SCC data frames from the .rds files.

NEI <- readRDS("raw_files/summarySCC_PM25.rds")
SCC <- readRDS("raw_files/Source_Classification_Code.rds")

### Question 6
# Which city has seen greater changes over time in motor vehicle emissions?

# Gather the subset of the NEI data which corresponds to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data by each city's fip and add city name.
vehiclesB24510NEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]
vehiclesB24510NEI$city <- "Baltimore City"

vehiclesL06037NEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesL06037NEI$city <- "Los Angeles County"

# Combine the two subsets with city name into one data frame
bothNEI <- rbind(vehiclesB24510NEI,vehiclesL06037NEI)

png(filename='C:/Users/Rainer/Documents/GitHub/ExploratoryDataAnalysisProject2/plot6.PNG')
library(ggplot2)
# The palette with grey:
ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
    geom_bar(aes(fill=year),stat="identity") +
    facet_grid(scales="free", space="free", .~city) +
    guides(fill=FALSE) 
    labs(x="Year", y="Total PM2.5 Emission") + 
    labs(title="PM2.5 Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008")

dev.off()