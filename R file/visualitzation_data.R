library(ggplot2)

ggplot(data = number_of_riders, aes(x = factor(day_of_week), y = n, fill = member_casual)) + geom_bar(position ="dodge", stat="identity") +
  scale_x_discrete(name = "Day of Week" ,labels = c("1"="Sunday", "2"="Monday", "3"="Tuesday", "4"="Wednesday", "5"="Thursday", "6"="Friday", "7"="Saturday")) +
  ylab("Number of Riders") + 
  labs(title = "Number of Riders by Day of Week (2020-01 to 2020-12)")

ggplot(data = mean_riders_per_day, aes(x = factor(day_of_week), y = mean_riders, fill = member_casual)) + geom_bar(position ="dodge", stat="identity") +
  scale_x_discrete(name = "Day of Week" ,labels = c("1"="Sunday", "2"="Monday", "3"="Tuesday", "4"="Wednesday", "5"="Thursday", "6"="Friday", "7"="Saturday")) +
  ylab("Number of RIders") + 
  labs(title = "Average Number of Riders per Day by Day of Week")

ggplot(data = number_of_riders_rideable_type, aes(x = rideable_type, y = n, fill = member_casual)) + 
  geom_bar(position ="dodge", stat="identity") +
  labs(title = "Number of Riders by Rideable Type (2020-01 to 2020-12)") + 
  xlab("Rideable Type") + 
  ylab("Number of Riders")

ggplot(data = mean_riders_rideable_type, aes(x = rideable_type, y = mean_riders, fill = member_casual)) + 
  geom_bar(position ="dodge", stat="identity") +
  labs(title = " Average Number of Riders per Day by Rideable Type") + 
  xlab("Rideable Type") + 
  ylab("Number of Riders")

ggplot(data = number_of_riders_per_month, aes(x = as.numeric(month), y = n, color = member_casual)) + geom_line() + labs(title = "Number of Riders by Months") +
  scale_x_discrete(name = "Month", limits = c(1,2,3,4,5,6,7,8,9,10,11,12)) + 
  ylab("Number of Riders")
