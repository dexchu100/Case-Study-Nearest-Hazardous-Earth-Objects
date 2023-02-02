install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
install.packages("ggplot2")

library(tidyverse)
library(skimr)
library(janitor)
library(ggplot2)

#Gather the Data
data1 <- read_csv("neo_v2.csv")

#Check the gathered data
head(data1)
colnames(data1)
str(data1)

#======================================================
#CLEAN UP DATA TO PREPARE FOR ANALYSIS
#======================================================
#No unnecessary renaming of the columns
#Remove unnecessary columns: orbiting_body and sentry_object
data1 <- data1 %>%
  select(-c(id, orbiting_body, sentry_object))

# Reassign the true and false values into hazard and safe for better analysis
data1 <- data1 %>%
  mutate(hazardous = case_when(hazardous == TRUE ~ 'hazard', hazardous == FALSE ~ 'safe'))



#inspect the table once more
nrow(data1)
dim(data1)
summary(data1)

#drop any NULL values
data1 <- drop_na(data1)

#inspect the new table
nrow(data1)
dim(data1)
summary(data1)


#======================================================
#CONDUCT DESCRIPTIVE ANALYSIS
#======================================================
#Descriptive analysis on est_diameter_min of all the values
mean(data1$est_diameter_min) 
median(data1$est_diameter_min) 
max(data1$est_diameter_min) 
min(data1$est_diameter_min) 

# You can condense the four lines above to one line
summary(data1$est_diameter_min)

#Descriptive analysis on est_diameter_max of all the values
mean(data1$est_diameter_max) 
median(data1$est_diameter_max) 
max(data1$est_diameter_max) 
min(data1$est_diameter_max) 

#Condense the four lines above to one line
summary(data1$est_diameter_max)

#Descriptive analysis on relative_velocity of all the values
mean(data1$relative_velocity) 
median(data1$relative_velocity) 
max(data1$relative_velocity)
min(data1$relative_velocity) 

#Condense the four lines above to one line
summary(data1$relative_velocity)

#Descriptive analysis on miss_distance of all the values
mean(data1$miss_distance) 
median(data1$miss_distance) 
max(data1$miss_distance)
min(data1$miss_distance)

#Condense the four lines above to one line
summary(data1$miss_distance)

#Descriptive analysis on miss_distance of all the values
mean(data1$absolute_magnitude) 
median(data1$absolute_magnitude) 
max(data1$absolute_magnitude)
min(data1$absolute_magnitude)

#Condense the four lines above to one line
summary(data1$absolute_magnitude)

# Compare between the hazard and safe in ALL values
aggregate(data1$est_diameter_min ~ data1$hazardous, FUN = mean)
aggregate(data1$est_diameter_min ~ data1$hazardous, FUN = median)
aggregate(data1$est_diameter_min ~ data1$hazardous, FUN = max)
aggregate(data1$est_diameter_min ~ data1$hazardous, FUN = min)

aggregate(data1$est_diameter_max ~ data1$hazardous, FUN = mean)
aggregate(data1$est_diameter_max ~ data1$hazardous, FUN = median)
aggregate(data1$est_diameter_max ~ data1$hazardous, FUN = max)
aggregate(data1$est_diameter_max ~ data1$hazardous, FUN = min)

aggregate(data1$relative_velocity ~ data1$hazardous, FUN = mean)
aggregate(data1$relative_velocity ~ data1$hazardous, FUN = median)
aggregate(data1$relative_velocity ~ data1$hazardous, FUN = max)
aggregate(data1$relative_velocity ~ data1$hazardous, FUN = min)

aggregate(data1$miss_distance ~ data1$hazardous, FUN = mean)
aggregate(data1$miss_distance ~ data1$hazardous, FUN = median)
aggregate(data1$miss_distance ~ data1$hazardous, FUN = max)
aggregate(data1$miss_distance ~ data1$hazardous, FUN = min)

aggregate(data1$absolute_magnitude ~ data1$hazardous, FUN = mean)
aggregate(data1$absolute_magnitude ~ data1$hazardous, FUN = median)
aggregate(data1$absolute_magnitude ~ data1$hazardous, FUN = max)
aggregate(data1$absolute_magnitude ~ data1$hazardous, FUN = min)

#Create as a csv file for further analysis with Tableau
counts <- aggregate(data1$est_diameter_min ~ data1$hazardous + data1$est_diameter_max + data1$relative_velocity + data1$miss_distance + data1$absolute_magnitude, FUN = mean)
write.csv(counts, file = 'C:/Users/dexch/Documents/NASA/avg_hazard.csv')


