# 2025-02-04: 
# 2.2 Booleans + 2.3 Conditionals

vec=c(1,0,2,1)
vec
vec[c(FALSE,FALSE, TRUE, FALSE)]
vec[c(FALSE,FALSE, TRUE, T)]

####

# we can ask question of our data and have the data get fed back to us, only if they meet a certain condition. 
# in computer science an ! is NOT as in != means not equal to

!TRUE #not true = false
1>2
1>vec # is one greater than one, no; is one greater than 0, yes; is one greater than 2, no; etc.
vec>=1 # is the vector greater than or = to 1; 1 yes, 0 no, 2 yes, 1 yes.
c(1,2,3) == c(3,2,1) #does the first element equal the first, and same with second and third.

1%in% c(1,2,3)

oceans=c("Atlantic", "Pacific", "Indian" ,"Arctic", "Southern")
oceans

oceans
world_oceans=data.frame(oceans)
world_oceans

world_oceans=data.frame(oceans,
                        area_km2=c(77e6,156e6, 69e6,14e6,20e6),
                        avg_depth_m =c(3926,4028,3963,3953,4500))
world_oceans
sum(world_oceans$avg_depth_m > 4000)

world_oceans$ocean[world_oceans$avg_depth_m>4000] ## go back and see what this does)

## EXERCISE 2.1 ##

#Create a vector with the names of the oceans you have personally visited. Use the %in% operator to subset the oceans you have visited from the world_oceans data frame. Now use sub-setting to find out whether you have ever personally visited any oceans that have a smaller area than the Atlantic ocean.

# this creates a vector

#creates a vector of oceans I have visited
visited_oceans = c("Atlantic", "Pacific")

#filter's world_oceans df to include only those I have visited. (refer to _____ as well); 
#the oceans column from world_oceans data frame gets taken out, then %in% connects to visited_oceans to check which rows in the column oceans, match the oceans that have been visited. 
# This is all put into wold_oceans [..] because it is a logical index that will return only the rows where the condition is TRUE, the filtered data set that only returns oceans you have visited
visited_oceans_df = world_oceans[world_oceans$oceans %in% visited_oceans,]
visited_oceans_df

#determine if visited oceans have a smaller area than the atlantic (77 million km^2)
# visited_oceans_df$area_km2 < 77.6 is a logical vector that checks which visted oceans have an area less than 77 mil km^2
# visited_oceans_df[..] is a local index that filters the rows where the condition (what I explained above) is true. The subset returned are visited oceans less than 77 million km^2
smaller_than_atlantic = visited_oceans_df[visited_oceans_df$area_km2 < 77e6,]
smaller_than_atlantic

# for me this spits out nothing because the Atlantic isn't smaller than 77 million km^2 it exactly equals, and neither is the Pacific.

########

1+2 ==3 # yes this equals 3
0.1+0.2 ==0.3 # no this does not equal 0.3 (decimals)

(0.1+0.2)-0.3 #???
error_threshold = 0.00001
abs((0.1+0.2)-0.3)> error_threshold


###BOOLEAN OPERATORS and LOGICAL TESTS ##

# can be helpful for dealing with multiple conditions.

# | --> this is or; are one of the conditions true
# xor --> is exactly one of these conditions true
# ! not
# any --> only spits out when only one thing is true. 
# all --> only spits out a true if all of them are ture

x=5
x > 3 & x < 15 # yes, 5 is > 3 and < 15
x > 3 | x < 15 # yes, one or more of the conditions is true
x > 3 & x %in% c(1,3,7,9) # although 5 is > 3 it is NOT in the vector provided

a=c(1,2,3)
b=c(1,2,3)
c=c(1,2,4)
a==b  # yes, 1=1, 2=2, 3=3
a==c  # yes, 1=1, 2=2, 3 != 4

any(a==c) # the first was true so true
all(a==c) # at least one element was not true so false overall

dat = c(1,2,3,NA)
dat==NA
NA==NA #this doesn't spit out true, R panics... haha

is.na(dat) # 1,2,3 are not NA's so true, NA is NA, so false.

## DO EXERCISE 2.2

w = 15
x = c(-1,0,1)
y ="February"
z = c("Monday", "Tuesday", "January")

w > 10 & w < 20 #True
any(x>=1) #True, 1 is positive
all(x>=1) #False, there is at least 1 negative

y =="February" #is Febrary exaclty = to February, True

days_of_week = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday","Sunday")
z %in% days_of_week 
# ^establishes what days of the weeks are, then determines if if any of z is found in days of week

###############################33

## LESSON 2.3: Conditional Statements ##
## CONDITIONAL (IF) STATEMENTS ##

#if (this) {
#that
#}

# The this object should be a logical test or R expression that evaluates to a single TRUE or FALSE.
# If this evaluates to TRUE, R will run all of the code that appears between the braces that follow the if statement (i.e., between the { and } symbols). If this evaluates to FALSE, R will skip the code between the braces without running it.

#Example- if num is negative, make it positive
num = -2
if (num<0){num=num*-1}
num 
#returns positive 2

num = 35
if (num<0){num=num*-1}
num 
#returns 35

num = -35
if (num < 0) {
print("uh oh, num is negative") 
  num=num*-1
  print("now num is positive, yay")
  }
num 

##EXERCISE 3.1 --> person's temperature

fever=c(98.4, 99.5, 102.1)
avg_temp = 98.6
norm_temp=98.4
low_fever=99.5
high_fever=102.1

if (norm_temp < avg_temp){avg_temp-norm_temp}

#EXERCISE: 
#rewrite notes

temps = c(98.4, 99.5, 102.1)
## why can't i use a vector
## could fix this by using an if else or a for loop
temp = 102.1
if(temps>98.6){
  difference=temps-98.6
  print(difference)
  if (temps>101){
    print("go to the doctor!")}}

## IF ELSE STATEMENTS ##
# if (this) {plan A} else {PlanB}
# if statements tell R what to do when your condition is true, but you can also tell R what to do when the condition is false. else is a counterpart to if that extends an if statement to include a second case. In English, you would say, “If this is true, do plan A; else do plan B.” In R, you would say:

# Grade Example #
grade = 83
if(grade > 60){
  print("you passed!!")
  } else {
    print("you failed :( ")
  }

# Players in a Game Example #

a = 1
b = 2
if (a>b){
  print("a wins")
  } else if (b>a)
{print ("b wins")
  }else{
    print("they tied")
  }

## EXERCISE 3.2 ##
#Dad and Donut Example
n_donuts = 15
if (n_donuts < 12){
  print("Dad bought too little donuts")
} else if (n_donuts == 12){
  print("Dad bought a dozen, yum!")
} else if (n_donuts > 12){
  print("A baker's dozen, too many donuts")
}

## Working with the ifelse() function ##

# works just like an if/else combination that we saw earlier, but condenses it into a single line of code. This function takes three arguments: a logical and two possible answers. If the logical is TRUE, the value in the second argument is returned and if FALSE, the value in the third argument is returned. 

a = 0
ifelse(test=(a!=0), yes =1/a, no = NA)
# since a does not equal 0, it equals 9, take the reciprocal. 

# this function is nice because it works on vectors. 
# examines each entry of the logical vector and returns elements from the vector provided in the second argument, if the entry is TRUE, or elements from the vector provided in the third argument, if the entry is FALSE.

vector = c(0,1,2,-4,-5)
reciprocals=ifelse(test=(vector !=0), yes =1/vector, no = NA) 
#this creates an if else, the first item in the vector reports back an NA since it is zero and satisfies the third argument. the others report back the item's reciprocal
reciprocals
cbind(vector,reciprocals) # this just creates a reciprocal column and binds it. 


## EXERCISE 3.3 ##
# Perhaps in a dataset that you are using, the number -999 is used to indicate a missing value (this is super common). To take advantage of R’s intuitive handling of missing values (in math equations, plotting, etc.) you should replace those elements with NA. 
#Use the ifelse() statement to replace all of the -999 values in the data vector with NA. Then use an if/else chain to print out a statement about whether there are any NAs in the data variable. It may help to use functions we covered earlier like any() and is.na().


#write out notes for this too!
data = c(1,2,5,-999,2,-999,8)
data_fix = ifelse(test= (data != -999), yes = data, no = NA )
data_fix

ifelse(test= (data == -999), yes = NA, no = data )

if(any(is.na(data_fix))){
  print("the dataset contains NA")
} else {
  print("the dataset does NOT contain NA")
}

