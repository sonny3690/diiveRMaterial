      ##### - Intro to R #####
       ### Ixio Analytics ###
        ### Taryn Morris ###
        ### 11 June 2019 ### 


# The "#" symbol turns text into annotation rather than code (headings, notes to self, instructions etc)
# It's REALLY useful and good practice to keep code organised and well annoatated (especially if sharing code with other people).


# INTRODUCTION TO R #

#Let's play - very basic!"


## ------------------------------------------------------------------------
# naming of objects
# Remember '<-' is used to name objects. Looks like an arrow.

x <- 2
x # 3 ways to look at your objects
print(x)
# highlight and run.

#Good practice to view your objects after doing a calculation or a manipulation to check it did what yo thought it would do

x + 3

y <- x + 3
y




## ------------------------------------------------------------------------
# It's useful to be able to check what type of data we are working with
# This becomes really useful later on when certain functions will only run on certain types of data
# we check what type of data using the command class()
type_1 <- "dog"
type_1
class(type_1)

type_2 <- TRUE
type_2
class(type_2)

type_3 <- 1.23
type_3
class(type_3)

type_4 <- as.factor("female")
type_4
class(type_4)




## ------------------------------------------------------------------------
# c() combines whatever is in the brackets into a vector or list

my_numbers <- c(1, 2, 3)
my_numbers

# we can perform operations on our objects 
y <- my_numbers * 2
y



# vectors can also be charachterised by the type of data
a <- c(1, 2, 5.3, 6.77 ,-2,4) # numeric vector
b <- c("one","two","three") # character vector
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) #logical vector

class(a)
class(b)
class(c)




# You can select aka "call" certain elements of a vector using "[ ]" (square brackets)
a[4] # returns 4th element of a 
b[3] # returns 3rd  element of b
c[5] # etc.

a[c(2,4)] # calls 2nd and 4th elements of vector [vector is one "row" of data]




# you can "coerce" an object into the desired type e.g.
customer_language <- c("English", "English", "isiZulu", "Afrikaans", "English", "isiZulu", "isiZulu")
customer_language
class(customer_language)

customer_language <- as.factor(customer_language)
class(customer_language)






## ------------------------------------------------------------------------
# We can use c() to combine vectors or lists into matrices or dataframes (think tables here)

# Making data frames 
my_dataframe <- data.frame(texts=c("cat", "dog"),
                 logicals=c(TRUE, FALSE),
                 numerics=c(1, 2.35))

my_dataframe

class(my_dataframe)


# -----
#create vectors of data
column_1 <- c(1,2,3,4)
column_2 <- c("red", "white", "red", NA)
column_3 <- c("used", "new", "new", "new")
column_4 <- c(TRUE,TRUE,TRUE,FALSE)

#combine vectors into a dataframe
mydata <- data.frame(column_1, column_2, column_3, column_4)
mydata 

#add column names to the dataframe
names(mydata) <- c("ID","Colour","Condition", "Passed") 
mydata
# or
print(mydata)


#___________________________________________________________________________
#To retrieve data from within the data frame we can use the [ ] operator
# [ ] requires two arguments - one for rows and one for columns  --> [rows,columns]

#Therefore to get the value in row 3 of column 2, we use:
mydata[3,2]

#To get all of row 3, we use:
mydata[3,]

#To get all of column 2, we use:
mydata[,2]

#We can also get more than one column (or row) at a time by making a list of the columns we want using c()
mydata[,c(1,4)]
mydata[,c("Colour","Passed")] # or by listing columns by name



# the end of ultra basics!
# dorky thumbs up
# this is not a hashtag









# A little more practice on a little more data --------------------------------------------------------------
    # Let's practice on a bigger dataframe with a provided example dataset from R

install.packages(gapminder)
install.packages("gapminder")
library(gapminder)

# read more on gapminder here ... 
# https://cran.r-project.org/web/packages/gapminder/gapminder.pdf
# Gapminder is a file which explores life expectancy and GDPs of countries around the world over time

gapminder 
gapminder #

#but thats a lot of text
head(gapminder)  #which displays the first 6 rows - much easier to see



## ------------------------------------------------------------------------
#use the $ sign to retrieve a variable (column) by column name
gapminder$country
countries <- gapminder$country
countries

# or use the [ ] operator
gapminder[3, ]
gapminder[2, 3]
gapminder[-(1:1650), 3] # - --> means without or not --> don't retrieve row 1 to 1650
gapminder[c(2,4), -3] # ie get row 2 and 4 of gapminder without column 3
gapminder[c(2,4), c("country", "pop")]

## ------------------------------------------------------------------------

# use the command subset() to subset data that fulfils a criteria
# using logical operators such as == (is equal), != (is not equal), >, >=, <, <=, & (and), | (or)


subset(gapminder, pop>1000000000) 
subset(gapminder, pop>1000000000 & country=='India') # uses logical operator & (and)       
subset(gapminder, pop>1000000000 | continent=='Oceania') # uses the logical operator | (or)

africa <- subset(gapminder, continent=='Africa')
africa
head(africa)


year_2007 <- gapminder[gapminder$year==2007, ]
year_2007
head(year_2007)

gapminder[gapminder$year==1952, c(4)]





# THAT'S IT.

