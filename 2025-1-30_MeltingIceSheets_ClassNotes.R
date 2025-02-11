# Thursday, Jan 30th, 2025
# Melting Ice Sheets Notes

# NMC 2025-01-30

# read in data

#antarctic data
ant_ice_loss = read.table(file="data/antarctica_mass_200204_202408.txt",skip=31, sep = "", header=FALSE,
                          col.names=c("decimal_date","mass_Gt","sigma_Gt"))

head(ant_ice_loss) #first 6 rows
tail(ant_ice_loss) #last 6 rows 

#greenland data
grn_ice_loss = read.table(file="data/greenland_mass_200204_202408.txt", skip=31, sep = "", header=FALSE,
                          col.names=c("decimal_date","mass_Gt","sigma_Gt") )


head(grn_ice_loss)
tail(grn_ice_loss)
dim(grn_ice_loss) # dimensions 213 rows and 3 
summary(grn_ice_loss) # provides a summary

range(grn_ice_loss$mass_Gt) # also ask Erin what this does


plot(x=ant_ice_loss$decimal_date,y=ant_ice_loss$mass_Gt) 
# plots Antarctic ice loss


plot(mass_Gt ~ decimal_date,data=ant_ice_loss,type="l") 
# plots Antarctic ice loss as a line rather than a scatter

plot(mass_Gt ~ decimal_date,data=grn_ice_loss,type="l") 
# plots Greenland ice loss as a line

plot(mass_Gt ~ decimal_date,data=ant_ice_loss,type="l",ylim=c(-5000,0)) 
#plots antarctic ice loss with an extended y access for the greenland line
lines(mass_Gt ~ decimal_date,data=grn_ice_loss,type="l",col="red") 
#this line adds greenland to the same plot. have to run these two lines together
# ^ these two lines need to be ran together

plot(mass_Gt ~ decimal_date,data=ant_ice_loss,type="l",
     ylim=range(grn_ice_loss$mass_Gt),
     ylab="Mass Loss (Gt)",
     xlab="Year") 
# this adds x and y labels and makes the y lim of the graph the provided range of greenlands data
lines(mass_Gt ~ decimal_date,data=grn_ice_loss,type="l",col="red")
# ^ these two lines need to be ran togehter

data_break=data.frame(decimal_date=2018.0,mass_Gt=NA,sigma_Gt=NA)
data_break 
#this creates an NA or a "break" in the data at the point of 2018, BUT this does NOT put it in the correct order

#Antarctic Ice Loss w/ NA
ant_ice_loss_with_NA=rbind(ant_ice_loss,data_break) 
# this adds that singular row to the bottom of the table. 
head(ant_ice_loss_with_NA) 
tail(ant_ice_loss_with_NA) 
#this line helps to confirm that the data was added to the bottom of the table

ordered_rows=order(ant_ice_loss_with_NA$decimal_date)
ordered_rows 
#this shows that the new row (in this case line 214, has been put back into the correct position. basd on the date column. )

ant_ice_loss_with_NA=ant_ice_loss_with_NA[ordered_rows,] 
# this shows us that the added line has been placed in the correct row along with it's NA's

plot(mass_Gt ~ decimal_date,data=ant_ice_loss_with_NA,type="l",
     ylim=range(grn_ice_loss$mass_Gt),
     ylab="Mass Loss (Gt)",
     xlab="Year") # this didn't do nnything because it just plotted the NA at the end of the table so when it shoes on the graph it doesn't visually appear at the break because "code wise" it's at the end of the graph.
lines(mass_Gt ~ decimal_date,data=grn_ice_loss_with_NA,type="l",col="red")
# this line right above can only be ran after "grn_ice_loss_with_NA" has been ran (the line is below)

#Greenland Ice Loss w/ NA
grn_ice_loss_with_NA=rbind(grn_ice_loss,data_break) # this adds that singular row to the bottom of the table. ask Erin what this does
head(grn_ice_loss_with_NA) 
tail(grn_ice_loss_with_NA)

ordered_rows_grn=order(grn_ice_loss_with_NA$decimal_date)
ordered_rows_grn
# this is just repeating what was done above for greenaland

grn_ice_loss_with_NA=grn_ice_loss_with_NA[order(grn_ice_loss_with_NA$decimal_date),] 

### adding uncertainty

head(ant_ice_loss)

#pdf("figures/ice_loss.pdf", width=7,height=5)
plot(mass_Gt ~ decimal_date,data=ant_ice_loss_with_NA,type="l",
     ylim=range(grn_ice_loss$mass_Gt),
     ylab="Mass Loss (Gt)",
     xlab="Year")
lines((mass_Gt + 2*sigma_Gt)~ decimal_date, data=ant_ice_loss_with_NA,lty="dashed")
lines((mass_Gt - 2*sigma_Gt)~ decimal_date, data=ant_ice_loss_with_NA,lty="dashed")
lines((mass_Gt) ~ decimal_date, data=grn_ice_loss_with_NA,lwd=2,col="red")
lines((mass_Gt + 2*sigma_Gt)~ decimal_date, data=grn_ice_loss_with_NA,lty="dashed",col="red")
lines((mass_Gt - 2*sigma_Gt)~ decimal_date, data=grn_ice_loss_with_NA,lty="dashed",col="red")
#dev.off()

########## 

# BAR GRAPHS: 
#Let’s make a bar plot showing the difference in ice mass loss for Antarctica and Greenland:
  
min(ant_ice_loss$mass_Gt)
# Largest observed decrease in ice mass loss in Antarctica:
## [1] -2777.78

barplot(height=c(min(ant_ice_loss$mass_Gt), min(grn_ice_loss$mass_Gt)))
# 
# Barplot of largest observed ice loss in Antarctica and Greenland

# Flip to negative to positive, add x-axis labels, add more tick marks on y-axis, add y-axis title
barplot(height=c(min(ant_ice_loss$mass_Gt)*(-1), min(grn_ice_loss$mass_Gt)*(-1)), names.arg=c("Antarctica","Greenland"), ylim=c(0,6000), ylab="Ice loss in Gt")
