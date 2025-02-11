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

co2$seasonal_cycle = co2$monthly_average - co2$deseasonalzied
head(co2)