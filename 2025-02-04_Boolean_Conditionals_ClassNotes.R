# 2025-02-04: boolean+conditional

vec=c(1,0,2,1)
vec
vec[c(FALSE,FALSE, TRUE, FALSE)]
vec[c(FALSE,FALSE, TRUE, T)]

####

# we can ask question of our data and have the data get fed back to us, only if they meet a certain condition. 

# in computer science an ! is NOT as in != means not equal to

!TRUE #not true = false
1>2
1>vec # is one greater than one, no; is one greater than 
vec>=1
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

## DO EXERCISE 2.1

########

1+2 ==3
0.1+0.2 ==0.3

(0.1+0.2)-0.3
error_threshold = 0.00001
abs((0.1+0.2)-0.3)> error_threshold

#######

#boolean operators can be helpful for dealing with multiple conditions. 

# | --> this is or; are one of the conditions true
# xor --> is exaclty one of these conditions true
# ! not
# any --> only spits out when only one thing is true. 
# all --> only spits out a true if all of them are ture

x=5
x > 3 & x < 15
x > 3 | x < 15
x > 3 & x %in% c(1,3,7,9)

a=c(1,2,3)
b=c(1,2,3)
c=c(1,2,4)
a==b
a==c

any(a==c) # the first was true so true
all(a==c) # at least one element was not true so false overall

dat = c(1,2,3,NA)
dat==NA
NA==NA #this doesn't spit out true, R panics... haha

is.na(dat)

## DO EXERCISE 2.2


## CONDITIONAL STATEMENTS (IF STATEMENTS)

#if (this) {tha}

num = -2
if (num<0){num=num*-1}
num 

num = 35
if (num<0){num=num*-1}
num 

#num = -35
#if (print("num is negative) num<0){num=num*-1}
#num 


##EXERCISE 3.1 --> person's temperature

fever=c(98.4, 99.5, 102.1)
avg_temp = 98.6
norm_temp=98.4
low_fever=99.5
high_fever=102.1

if (norm_temp < avg_temp){avg_temp-norm_temp}

temp = 98.4

if(temp>98.6)
  {difference=temp-98.6
  print(difference)
  } if (temp>101)
  {print("go to the doctor!")}

if(low_fever>98.6){}

## IF ELSE STATEMENTS

grade = 83
if(grade>60){print("you passed!!")} else {print("you failed :( ")
  }

# ty out else if statements (using players in a game)

a = 1
b = 2
if (a>b){print("a wins")
  } else if (b>a)
{print ("b wins")
  }else{
    print("they tied")
  }


#try out ifelse() function
a = 9
ifelse(test=(a!=0), yes =1/a, no = NA)

vector = c(0,1,2,-4,-5)
reciprocals=ifelse(test=(vector !=0), yes =1/vector, no = NA)
reciprocals
cbind(vector,reciprocals)

# EXERCISE 3.3

data = c(1,2,5,-999,2,-999,8)

ifelse(test= (data == -999), yes = NA, no = data )


