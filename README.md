# Case-Study-Nearest-Hazardous-Earth-Objects
# Junior Data Analyst at a business intelligence consultant
*Last modified: February 2, 2023*

### I. Case Study Scenario
You are a junior data analyst working for a business intelligence consultant. You have been at your job for six months, and your boss feels you are ready for more responsibility. He has asked you to lead a project for a brand new client — this will involve everything from defining the business task all the way through presenting your data-driven recommendations. You will choose the topic, ask the right questions, identify a fresh dataset and ensure its integrity, conduct analysis, create compelling data visualizations, and prepare a presentation 

### II. Business Task
A government own agency wants to figure out what to set their instruments or what devices they need to watch out for potentially hazardous astro objects closest to Earth. Explore data collected from NASA to find out what measurements and values that would deem an astro object dangerous

### III. Data Source
This is data collected in the year of 2021 of all the recorded celestial objects that are closest to the planet Earth in this [here](https://www.kaggle.com/datasets/sameepvani/nasa-nearest-earth-objects). This is a public data set under the license of [CC0: Public Domain](https://creativecommons.org/publicdomain/zero/1.0/).

### IV. Data Cleaning and Manipulation

We mainly used R in R Studio to clean and manipulate the data. All the data cleaning and manipulating process is saved as [`Data Cleaning and Analysis.R`](https://github.com/dexchu100/Case-Study-Nearest-Hazardous-Earth-Objects/blob/main/Data%20Cleaning%20and%20Analysis.R) with comments. The libraries we used are the following:

```{r}
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
install.packages("ggplot2")
```

After unzipping the data, we aggregated them into one single dataframe and stored it into `data1`. At this stage, some columns in this set should be removed for the analysis. The id, orbiting_body, and sentry_body are unneded for this analysis. The orbiting_body are all label as Earth since all the objects in this data set is based with the Earth at the center. The id is unnecessary because the names are more understandable and can be used as labels for the visuals. We also don't need the body columns because we already have the distances and velocities measeured. 

There will be no renaming of columns since they are all mostly appropriate and easy to use already. What needed to be changed for the cleaning is turning the boolean values in the hazard column where TRUE becomes Hazard and FALSE becomes safe. This is for ease of use in the visualization of data instead of it being labeld as false/true or 0/1. 

### V. Data Analsyis/Visualizations

Recall that our business task is to identify what are the factors and values that can deem an object nearest to Earth is hazardous or not. Based on our objective, we can aggregate the average, median, minimum, and maximum with the hazard and safe values.

Going over what each labels means in this data set:

 * est_diameter_min is the minimum diameter estimated in kilometers
 
 * est_diameter_min is the Maximum Estimated Diameter in Kilometers
 
 * relative_velocity is the velocity that is relative to Earth
 
 * miss_distance is the distance in Kilometers missed
 
 * absolute_magnitude is the  intrinsic luminosity which is the measure of brightness based on the distance of a star and the object.
 

Table 1: Aggregate Data

<p align="center">
  <img src="https://github.com/dexchu100/Case-Study-Nearest-Hazardous-Earth-Objects/blob/main/Visualize%20Data/Aggregate%20Data.PNG">
</p>

The information we got from the aggregated descriptive data analysis: 

 * Mean: From this, it is shown that the Hazard values are typically higher than the safe values except for the absolute magnitude. 
 
 * Median: It is the same for the mean where the Hazard values are higher than the safe values except for the absolute magnitude.
 
 * Max: This time it is shown that all the max values for the safe values are all higher than the hazard values.
 
 * Min: From this, it is shown that the minimum values for the Hazard values are all higher than the safe values.


Taking the aggregated data and the cleaned up data, tableau was used to visualize the data as a bar graph: 

![Hazard Data Comparison](https://github.com/dexchu100/Case-Study-Nearest-Hazardous-Earth-Objects/blob/main/Visualize%20Data/Bar%20Graph.png)

This may seem overwhelming but that is the point of this visual. What is being shown here is how all over the place the data is when comparing them to each other. This is showing that there is no concrete combo of values that determines how an object is haphazardness or not. It also shows that there is no concrete correlation with each other. 

### VI. Summary of Analysis

* Putting the data through the visual mediums of a bar graph have shown that it is difficult to find combination of data that indicates whether they are hazardous or not. It can be seen that some hazard and safe objects have value that are close in numbers, making it not clear on the difference between the hazard and safe objects.
* The aggregations of each value from the descriptive data analysis portion does give a better idea of what makes an object hazardous. From the average and median, it can be seen that the hazard objects are typically larger, showing that distance, diameter, and velocity are important to what makes a object hazardous. The average and median also shares similarity where the absolute magnitude of the hazard objects are typically smaller than the safe objects. 
* In the Maximum and Minimum portion of the data, it can be seen that the hazard values are mostly lower than the safe values. It is the reverse with he minimum values where the hazard value is higher than the safe value. Showing that the Hazard object values tend to have a smaller range of numbers than the safe objects.

### VII. Recommendations

With the data collected, we can conclude that the observers of celestial objects should keep watch of the diameter, velocity, distance, and the absolute magnitude. The higher the values are in the diameter, velocity, and distance, the more hazardous the objects can be. This combined with checking the absolute magnitude where the lower values is more common with a hazardous object.

Since the commonality of hazardous objects is the diameter, distance, and velocity, it is recommended to get devices that can not only take a clear image of the object but also be able to measure the distance of the object. Along with that, it should also take several pictures and record the time the pictures were taken since the velocity of the object can be more accurately calculated with these values.  


### VIII. Additional Data/Expansion

It would have been helpful fi there was a way to figure out the mass of the object. This would have given us another value that to look out for and see if that can have an effect in determining if an object can be hazardous. This could also give us more accurate values in figuring out the objects velocity and whether it is being affected by the other solar masses in our solar system. Though I can see how difficult that can be if there is no way to get a sample of the object.
