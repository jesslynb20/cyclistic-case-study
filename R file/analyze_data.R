library(dplyr)
library(lubridate)

mode = function(x) {
  data.frame(sort(-table(x)))[1,1]
}

mode_day_of_week <- no_null_trip_data %>% 
  group_by(member_casual) %>% 
  summarise(mode = mode(day_of_week))
print(mode_day_of_week)

number_of_riders <- no_null_trip_data %>% 
  group_by(day_of_week) %>% 
  count(member_casual)
unique_date <- unique(as.Date(no_null_trip_data$started_at))
number_of_days <- data.frame(table(wday(unique_date)))
casual <- filter(number_of_riders, member_casual=="casual")
member<- filter(number_of_riders, member_casual=="member")
casual$mean_riders <- casual$n / number_of_days$Freq
member$mean_riders <- member$n / number_of_days$Freq
mean_riders_per_day <- rbind(casual, member)
print(mean_riders_per_day)

mode_rideable_type <- no_null_trip_data %>% 
  group_by(member_casual) %>% 
  summarise(mode = mode(rideable_type))
print(mode_rideable_type)

mode_rideable_type_day_of_week <- no_null_trip_data %>% 
  group_by(member_casual, day_of_week) %>% 
  summarise(mode = mode(rideable_type))
print(mode_rideable_type_day_of_week)

number_of_riders_rideable_type <- no_null_trip_data %>% 
  group_by(rideable_type) %>% 
  count(member_casual)
mean_riders_rideable_type <- number_of_riders_rideable_type
mean_riders_rideable_type$mean_riders <- number_of_riders_rideable_type$n / 364
print(mean_riders_rideable_type)

mean_min_max<- no_null_trip_data %>% 
  group_by(member_casual) %>% 
  summarise(mean = mean(ride_length),min = min(ride_length), max =max(ride_length))

mean_min_max$mean <- seconds_to_period(mean_min_max$mean)
mean_min_max$min <- seconds_to_period(mean_min_max$min)
mean_min_max$max <- seconds_to_period(mean_min_max$max)
print(mean_min_max)

mean_min_max_day_of_week<- no_null_trip_data %>% 
  group_by(member_casual, day_of_week) %>% 
  summarise(mean = mean(ride_length),min = min(ride_length), max =max(ride_length))

mean_min_max_day_of_week$mean <- seconds_to_period(mean_min_max_day_of_week$mean)
mean_min_max_day_of_week$min <- seconds_to_period(mean_min_max_day_of_week$min)
mean_min_max_day_of_week$max <- seconds_to_period(mean_min_max_day_of_week$max)
print(mean_min_max_day_of_week)

number_of_riders_per_month <- no_null_trip_data %>% 
  group_by(month) %>% 
  count(member_casual)
print(number_of_riders_per_month)
