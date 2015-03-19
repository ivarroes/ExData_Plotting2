# .- Question 4
#
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
#
# 
#
#
# Step 1. Load data
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Step 2. Filter data
emissions.filtered <- NEI[NEI$SCC %in% as.character(SCC[grep("coal", SCC$Short.Name, ignore.case=TRUE),1]),]

# Step 3. Summarize data per year
emissions.sum = with(emissions.filtered, aggregate(Emissions, list(year), sum))
colnames(emissions.sum) <- c("Year", "Emissions")

# Step 3. Create the plot
png("plot4.png")
plot(emissions.sum, 
     main="Evolution of total coal-related emissions in US", 
     xlab="Year", 
     ylab="Total emissions (in tons)", 
     type="o",
     col="blue")

# Step4. Add trend line
abline(lm(Emissions ~ Year, data=emissions.sum), col='red', lwd = 2)

# Step5. Add lengend
legend("topright", pch = '_', col = c("blue","red"), legend = c("Emissions","Trend"))
dev.off()
