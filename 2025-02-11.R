# 2025-02-11
# NMC 

# While loops: repeats a set of code until a condition becomes false
# while a condition is true, run this code, when it becomes false, stop.

x=5
while(x>0){
  x=x-1
  print(x)
}

rnorm(n=1,mean=2,sd=1)

# fishing game with while loops
n_fish=0
total_catch_lb=0
while (total_catch_lb < 50){
  new_fish_weight_lb = rnorm(n=1,mean=5,sd=1)
  n_fish = n_fish +1
  total_catch_lb = total_catch_lb + new_fish_weight_lb
  print(total_catch_lb)
}

n_fish
total_catch_lb


# sea ice exploration: 

url = 'ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v3.0.csv'

arctic_ice=read.delim(file=url, skip=2,sep=",", header=FALSE, col.names=c("Year", "Month", "Day", "Extent", "Missing", "Source"))

head(arctic_ice)
tail(arctic_ice)
summary(arctic_ice)

##install.packages

library(lubridate)
arctic_ice$date=make_date(year=arctic_ice$Year, month = arctic_ice$Month, day=arctic_ice$Day )
head(arctic_ice)
class(arctic_ice$date) #the class of date is considered "Date"

plot(Extent~date, data=arctic_ice, type = "l", ylab="Arctic Sea Ice Extend (x10^6 km^2)")

# annaual average from 1979-2024 (not including the partial years on each end)

first_year=min(arctic_ice$Year) +1
last_year= max(arctic_ice$Year) -1

arctic_ice_averages = data.frame(Year = seq (from=first_year, to=last_year),extent_annual_avg = NA,extent_5yr_avg=NA)
                              
arctic_ice$Extent[arctic_ice$Year == 1979]                          

mean(arctic_ice$Extent[arctic_ice$Year == 1979])
mean(arctic_ice$Extent[arctic_ice$Year == arctic_ice_averages$Year[1]])

head(arctic_ice_averages)

arctic_ice_averages$extent_annual_avg[1] = mean(arctic_ice$Extent[arctic_ice$Year == arctic_ice_averages$Year[1]])
head(arctic_ice_averages)

dim(arctic_ice_averages)[1]

for(i in seq(dim(arctic_ice_averages)[1])){
  arctic_ice_averages$extent_annual_avg[i] = mean(arctic_ice$Extent[arctic_ice$Year == arctic_ice_averages$Year[i]])
  print(i)
  print(arctic_ice_averages$extent_annual_avg[1])
}

head(arctic_ice_averages)
tail(arctic_ice_averages)

plot(extent_annual_avg ~ Year, data=arctic_ice_averages,type="l")

head(arctic_ice_averages)

#we want to step throught rows 3-44

#Calculate 5 year averages!
i=10
seq(from=3,to=dim(arctic_ice_averages)[1]-2)

for (i in seq(from=3,to=dim(arctic_ice_averages)[1]-2)){
  years = c((arctic_ice_averages$Year[i]-2):(arctic_ice_averages$Year[i]+2))
  arctic_ice_averages$extent_5yr_avg[i] = mean(arctic_ice$Extent[arctic_ice$Year %in% years])
  print(paste(i,":", years))
}

plot(extent_annual_avg ~ Year,data=arctic_ice_averages, type = "l", col = "blue")
lines(extent_5yr_avg ~ Year,data=arctic_ice_averages, type = "l", col="red")

arctic_ice_averages$date=make_date(year=arctic_ice_averages$Year, month=7,day=1)
head(arctic_ice_averages)

# plot it all together!!

plot(Extent~date,data=arctic_ice,type="l")
lines(extent_annual_avg ~ date, data=arctic_ice_averages, type = "l", col = "blue")
lines(extent_5yr_avg ~ date, data=arctic_ice_averages,type="l", col="red")

#Exercise 6.1: 
#do the same logic we did for a 5 year average
#skip first 9 years (first year you can use is 1988.
# try it where the focal year is the middle of 10 years.)



# Rate of Change: 

first_extent = arctic_ice_averages$extent_annual_avg[1]
last_extent = arctic_ice_averages$extent_annual_avg[dim(arctic_ice_averages)[1]]

total_change_million_km2 = last_extent - first_extent
total_change_million_km2

first_year = arctic_ice_averages$Year[1]
last_year =  arctic_ice_averages$Year[dim(arctic_ice_averages)[1]]
num_years= last_year-first_year
rate = total_change_million_km2 / num_years

#Exercise 6.2 
