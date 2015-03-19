# .- Question 2
#
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question
# 
#
#
# Step 1. Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Step 2. Filter data per fips = '24510'
emissions.filtered <- NEI[which(NEI$fips == '24510'),]

# Step 3. Summarize data per year
emissions.sum = with(emissions.filtered, aggregate(Emissions, list(year), sum))

# Step 4. Create the plot
png("plot2.png")
plot(emissions.sum, 
     main="Evolution of total emissions PM2.5 in Baltimore City, Maryland", 
     xlab="Year", 
     ylab="Total emissions (in tons)", 
     type="o",
     col="blue")

# Step4. Add trend line
abline(lm(x ~ Group.1, data=emissions.sum), col='red', lwd = 2)

# Step5. Add lengend
legend("topright", pch = '_', col = c("blue","red"), legend = c("Emissions","Trend"))
dev.off()
