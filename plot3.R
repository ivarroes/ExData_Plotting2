# .- Question 3
#
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
# 
# Step 1. Load data
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Step 2. Filter data per fips = '24510'
emissions.filtered <- NEI[which(NEI$fips == '24510'),]

# Step 3. Summarize data per year and type
emissions.sum = with(emissions.filtered, aggregate(Emissions, list(year, type), sum))
colnames(emissions.sum) <- c("Year", "Type", "Emissions")

# Step 4. Create a factor with type data
emissions.sum$Type <- factor(emissions.sum$Type)

# Step 5. 
png("plot3.png")
qplot(Year, Emissions, data=emissions.sum, facets=Type ~ ., 
      geom=c("point","line"), 
      color=Type,
      main="Evolution of total emissions PM2.5\nin Baltimore City, Maryland",
      ylab="Total emissions (in tons)")
dev.off()
