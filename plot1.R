# .- Question 1
#
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
# 
#
#
# Step 1. Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Step 2. Summarize data per year
emissions.sum = with(NEI, aggregate(Emissions, list(year), sum))

# Step 3. Create the plot
png("plot1.png")
plot(emissions.sum, 
     main="Evolution of total emissions PM2.5", 
     xlab="Year", 
     ylab="Total emissions (in tons)", 
     type="o",
     col="blue")

# Step4. Add trend line
abline(lm(x ~ Group.1, data=emissions.sum), col='red', lwd = 2)

# Step5. Add lengend
legend("topright", pch = '_', col = c("blue","red"), legend = c("Emissions","Trend"))
dev.off()

