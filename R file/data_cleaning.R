trip_data <- rbind(Divvy_Trips_2020_Q1, `202004.divvy.tripdata`,`202005.divvy.tripdata`, `202006.divvy.tripdata`,`202007.divvy.tripdata`,`202008.divvy.tripdata`,`202009.divvy.tripdata`,`202010.divvy.tripdata`,`202011.divvy.tripdata`,`202012.divvy.tripdata`)
no_null_trip_data <- na.omit(trip_data)
no_null_trip_data <- subset(no_null_trip_data, ended_at > started_at)

library(lubridate)
no_null_trip_data$ride_length <- difftime(ymd_hms(no_null_trip_data$ended_at),ymd_hms(no_null_trip_data$started_at), units = "secs")
no_null_trip_data$day_of_week <- wday(as.Date(no_null_trip_data$started_at))
no_null_trip_data$month <- month(as.Date(no_null_trip_data$started_at))
