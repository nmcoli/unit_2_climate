#NC 2025-02-06

url = 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt'
co2=read.table(file=url,col.names=c("year",
                                    "month",
                                    "decimal_date",
                                    "monthly_average",
                                    "deseasonalized",
                                    "n_days",
                                    "st_dev_days",
                                    "monthly_mean_uncertainity"))
head(co2)
summary(co2)
range(co2$decimal_date)
min(co2$monthly_average)
max(co2$monthly_average)


pdf(file="figures/KeelingCurve.pdf", width=7, height=5)
plot(monthly_average ~ decimal_date, data=co2, type="l",xlab="Year", ylab="Monthly CO2 (ppm)",
     main="Keeling Curve")
lines(y=co2$deseasonalized,x=co2$decimal_date,col="red")
dev.off()


#ask about this

co2$seasonal_cycle = co2$monthly_average - co2$deseasonalized
head(co2)

plot(seasonal_cycle ~ decimal_date,data=co2,type="l")

#now we subset form 2020-2025

co2$decimal_date > 2020 #what rows in the column decimal_date is greater than 2020
which(co2$decimal_date > 2020)# does the same BUT it's returning the indexed position (showing the 743rd row and so on)

#new data set 

co2_2020to2025 = co2[co2$decimal_date > 2020, ] #we use brackets because we want the rows that meet the criteria and then all the columns
summary(co2_2020to2025)

co2_2020to2025 = co2[which(co2$decimal_date > 2020),]

plot(seasonal_cycle ~ decimal_date, data=co2_2020to2025, type="l")

#examine monthly trend across time series

head(co2)
jan_anomalies=co2$seasonal_cycle[which(co2$month==1)]
mean(jan_anomalies)

co2_monthly_cycle=data.frame(month=seq(12),
                             detrended_monthly_cycle=NA)
co2_monthly_cycle

co2_monthly_cycle$detrended_monthly_cycle[1] = mean(co2[co2$month == 1,"seasonal_cycle"])
co2_monthly_cycle$detrended_monthly_cycle[2] = mean(co2[co2$month == 2,"seasonal_cycle"])
co2_monthly_cycle$detrended_monthly_cycle[3] = mean(co2[co2$month == 3,"seasonal_cycle"])
co2_monthly_cycle$detrended_monthly_cycle[4] = mean(co2[co2$month == 4,"seasonal_cycle"])
co2_monthly_cycle$detrended_monthly_cycle[5] = mean(co2[co2$month == 5,"seasonal_cycle"])
co2_monthly_cycle$detrended_monthly_cycle[6] = mean(co2[co2$month == 6,"seasonal_cycle"])
co2_monthly_cycle$detrended_monthly_cycle[7] = mean(co2[co2$month == 7,"seasonal_cycle"])
co2_monthly_cycle$detrended_monthly_cycle[8] = mean(co2[co2$month == 8,"seasonal_cycle"])
co2_monthly_cycle$detrended_monthly_cycle[9] = mean(co2[co2$month == 9,"seasonal_cycle"])
co2_monthly_cycle$detrended_monthly_cycle[10] = mean(co2[co2$month == 10,"seasonal_cycle"])
co2_monthly_cycle$detrended_monthly_cycle[11] = mean(co2[co2$month == 11,"seasonal_cycle"])
co2_monthly_cycle$detrended_monthly_cycle[12] = mean(co2[co2$month == 12,"seasonal_cycle"])

plot(detrended_monthly_cycle~month,data=co2_monthly,type="l")

## ask about second column in detrended monthlycycle

#DO EXERCISE 4.1


# Practicing for loops :)

# i is the itnerand or the repitation (the value you're interating over)

i=77
print(paste("this is run",i)
      
      for (i in c (1,2,3,4)){
        print(paste("this is run",i))
      }
      
      for (i in c (35:41)){
        print(paste("this is run",i))
      }
      
      for (peanut in c ("hi","hello", "bye", "see yah")){
        print(paste("this is run",peanut))
      }
      peanut
      
      # Indexing:
      
      my_vector = c(1,3,5,2,4)
      n = length(my_vector)
      my_vector_sq = rep(NA,n)
      my_vector_sq
      total=0
      
      for(i in seq(n)){
        my_vector_sq[i] = my_vector[i]^2
        print(paste("i=", i, "and my_vector[i] = ", my_vector[i], "and my_vector_sq[i] =", my_vector_sq[i]))
        total = total+my_vector_sq[i]
      }
      
      my_vector_sq
      
      
      #nested for loops
      
      mat=matrix(c(2,0,8,5,5,-4),nrow=2,ncol=3)
      mat_sq=matrix(rep(NA,6),nrow=2,ncol=3)
      dim(mat)
      for(i in seq(dim(mat)[1])){
        for(j in seq(dim(mat)[2])){
          mat_seq[i,j] = mat[i,j]2
        }
      }
      
      #go back and look through all this
      
      ## EXERCISE 5.1
      
      