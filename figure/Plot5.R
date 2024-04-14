# Load necessary libraries
library(utils)  # For loading data

# Load the data file
NEI <- readRDS("summarySCC_PM25.rds")

# Filter data for Baltimore City (fips == "24510")
baltimore_data <- subset(NEI, fips == "24510")

# Aggregate total emissions by year in Baltimore City
baltimore_emissions_by_year <- aggregate(Emissions ~ year, data = baltimore_data, sum)

# Create the plot and save it as a PNG file
png(filename = "plot2.png", width = 480, height = 480, res = 100)  # Open PNG device

# Plot total PM2.5 emissions by year in Baltimore City
plot(
    baltimore_emissions_by_year$year,
    baltimore_emissions_by_year$Emissions,
    type = "b",  # Both points and lines
    pch = 19,  # Point shape (solid circle)
    col = "blue",  # Color of the plot (points and lines)
    xlab = "Year",  # X-axis label
    ylab = "Total PM2.5 Emissions (tons)",  # Y-axis label
    main = "Total PM2.5 Emissions by Year in Baltimore City, MD",  # Plot title
    lty = 1,  # Line type (solid)
    lwd = 1.5  # Line width
)

# Close the PNG device
dev.off()
