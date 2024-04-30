# Load the dataset
data <- read.csv("C:/Users/Harshith Y/Desktop/Data Mining Proj/Crop Prediction.csv")

# Define thresholds for suitable conditions
temperature_threshold <- 20 # Celsius
humidity_threshold <- 60 # Percentage
N_threshold <- 10 # Parts per million (ppm)
P_threshold <- 5 # Parts per million (ppm)
K_threshold <- 10 # Parts per million (ppm)

# Create a new column 'suitable_for_agriculture' based on conditions
data$suitable_for_agriculture <- ifelse(data$Temperature >= temperature_threshold &
                                          data$Humidity >= humidity_threshold &
                                          data$N >= N_threshold &
                                          data$P >= P_threshold &
                                          data$K >= K_threshold, 
                                        "Yes", "No")

# Display the modified dataset
print(data)

# Load the dataset
data <- read.csv("C:/Users/Harshith Y/Desktop/Data Mining Proj/Crop Prediction.csv")

# Define function to recommend crop based on conditions
recommend_crop <- function(temperature, humidity, N, P, K) {
  if (temperature >= 20 & humidity >= 60 & N >= 10 & P >= 5 & K >= 10) {
    return("Wheat")
  } else if (temperature >= 25 & humidity >= 70 & N >= 15 & P >= 8 & K >= 12) {
    return("Rice")
  } else if (temperature >= 15 & humidity >= 50 & N >= 8 & P >= 4 & K >= 8) {
    return("Maize")
  } else {
    return("No suitable crop")
  }
}

# Create a new column 'crop_pred' based on conditions
data$crop_pred <- mapply(recommend_crop, data$Temperature, data$Humidity, data$N, data$P, data$K)

# Display the modified dataset
print(data)
