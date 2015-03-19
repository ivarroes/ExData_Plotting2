# .- Question 5
#
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
#
# 
#
#
# Step 1. Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Step 2. Filter data per origin and city
emissions.filtered <- NEI[NEI$SCC %in% as.character(SCC[SCC$SCC.Level.One == "Mobile Sources",1]),]
emissions.filtered <- emissions.filtered[which(emissions.filtered$fips == "24510"), ]

# Step 3. Summarize data per year
emissions.sum = with(emissions.filtered, aggregate(Emissions, list(year), sum))
colnames(emissions.sum) <- c("Year", "Emissions")

# Step 3. Create the plot
png("plot5.png")
ggplot(emissions.sum, aes(Year, Emissions)) +
  geom_point() +
  geom_line() +
  xlab("Year") + ylab("Total emissions (in tons)") +
  labs(title = "Evolution of total motor vehicle\nsources emissions in Baltimore City")

dev.off()
