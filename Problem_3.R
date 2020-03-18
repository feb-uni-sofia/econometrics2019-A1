## Problem 3, problem set 1

## References:
## Neuman et al. (2015). Introduction to Statistics and Data Analysis (see course page for a download link)
## Chapter 1, pages 1 - 6 (introduction and measurement scales)
## Chapter 2
##  Section 1: pages 17 - 19 (frequency distributions)
##  Section 2: pages 24 - 25 (bar plot)
## Chapter 3
##  Section 1: pages 37 - 40 (mean and quantiles)
##  Section 2: pages 48 - 56 (measures of dispersion, boxplot) 
## Chapter 4:
##  Section 3.1: pages 79 - 82 (scatter plots)

## Sample solution

## a, b)
## Download, read the data and convert it to a data frame (an object for storing tables)
## After running following line a new object should be created in the global environment (panel to the right)

mall <- read.csv('https://s3.eu-central-1.amazonaws.com/sf-timeseries/data/mall_customers.csv', stringsAsFactors = FALSE)


## c)
str(mall)

## The str() function prints a summary of an object.
## In the case of data frames it prints the number of observations (rows), the number of variables (columns)
## and the first few values of each column

## d)
## Answer: 200 customers
## Hint: look at the result of str(mall).

## e) 19 years

## Hint click on the mall object in the global environment pane and look up the value of the Age column 
## for the first customer.

## Alternatively, you can select it using the
## subset operator:

mall[1, "Age"]

## The data frame has two dimension: rows (1st dimension) and columns (2nd dimension)
## The 1 in the square brackets selects the first row of the data frame (i.e. the first customer)
## "Age" after the comma selects the column named "Age"


## f)
## Answer: Male

## Scroll to the bottom of the table (you need to click on the mall object in the environment pane to open it in table view)
## and look up the gender of the last customer

## Alternatively you can select it using the subset operator.
## To select the last row we need to now its position, i.e. how many rows are there
## We can compute that using nrow.

n <- nrow(mall)
mall[n, "Gender"]


## g)
## Answer: 38.85 years

## Use the $ operator to select a column by name (note that column names are case-sensitive)
mean(mall$Age)

## h)

min(mall$Age)
max(mall$Age)
median(mall$Age)

## Alternatively, you can get these descriptive statistics using the summary function:
summary(mall$Age)

## The youngest customer in the sample was 18 years old and the oldest was 70 years old.
## About 50% (half) of the customers were younger than 36 years (media). About a quarter were
## younger than 28.75 years (first quartile: 1st Qu. in the output). About a quarter of the 
## customers were older than 49.0 years (third quartile: 3rd Qu. in the output)


## i)

## Empirical quantiles
quantile(mall$Age, c(0.1, 0.25, 0.5, 0.75, 0.95))

## About 10% of the customers were younger than 21 years (0.1 empirical quantile) and about 5% of the customers were older 
## than 66.05 years (0.95 empirical quantile).
## The other quantiles are already discussed under h)


## j)
## Answer: 113
## First we compute the average age (see g)

avgAge <- mean(mall$Age)

## Then we create a vector of logical values that are TRUE for these observations (rows)
## with age less than 38.85 (avgAge) and FALSE otherwise.
## Note that "<" is a logical operator (examine the contents of ) ageLessThanAvg

ageLessThanAvg <- (mall$Age < mean(mall$Age))

## Sum the TRUE/FALSE values in ageLessThanAvg
sum(ageLessThanAvg)

## When used in arithmetic operations TRUE is coerced (converted)  to 1 and FALSE is coerced to 0.
## Therefore the sum of a logical vector is simply the number of TRUE values.
## If you have difficulties with the above example, try it with a simple vector,
## change the TRUE/FALSE values and compare the result.

sum(c(TRUE, TRUE, FALSE))

## k)
## Answer
## Female   Male 
## 112     88 

## Until now we have summarised 
## numeric variables (Age) using mean/median/quartiles, minimum and maximum.
## For nominally scaled variables like Gender the above approach does not work, though.
## 
## Nominal scales assign labels to objects and the labels have no apparent numeric meaning, e.g. gender (Male/Female)
## employment status (unemployed/employed/retired), etc.

## An appropriate summary for these types of variables is the frequency table.

freqGender <- table(mall$Gender)
freqGender

## A common way to graphically present the frequencies is the bar chart

barplot(freqGender)
title('Gender distribution')

## The frequency table simply contains the number of male customers and the number of female customers

## Alternatively you can count the number of times "Female" occurs in the
## column "Gender" (see question j)

isFemale <- (mall$Gender == "Female")
sum(isFemale)


## l)
## In this task we need to compare 
## the average age of male and female customers

## First we create a logical vector that is TRUE
## if the customer is male and FALSE otherwise 

## First we compute the average age for male customers. Then 
## we use that vector to select only the age values of the male
## customers and finally we compute the mean of these values.

isMale <- mall$Gender == "Male"

## 
ageMaleCustomers <- mall$Age[isMale]

avgAgeMaleCustomers <- mean(ageMaleCustomers)

## Repeat the same for the female customers
## Note that "!" negates a logical vector. This works
## because we have only two categories Male/Female

ageFemaleCustomers <- mall$Age[!isMale]
avgAgeFemaleCustomers <- mean(ageFemaleCustomers)


## The average age of female customers is: 38.09
## The average age of male customers is: 39.8
## The female customers were therefore
avgAgeFemaleCustomers - avgAgeMaleCustomers


## years younger (on average) than the male customers.

## m)

## Often it is quite useful to compare the distribution 
## of a variable between groups.
## The boxplot is one of the most important
## data displays for this task

## Here we create a boxplot for the distribution of age
## between male and female customers

boxplot(Age ~ Gender, data = mall, horizontal = TRUE)
title('Boxplot for Age by Gender')

## The boxplot displays the median (thick line in the middle)
## and hinges (roughly corresponding to the first and third quartiles)
## For more on boxplots and how to interpret these, refer to Heumann et al (2015), p. 56

## n)

## In the following assume that the score column contains a measurement of purchasing propensity
## of the customers (i.e. customers with higher score tend to spend more on purchases in the mall and
## customers with a low score tend to spend less in the mall)

## In this task we would like to create a scatterplot of Age and Score to examine the
## association pattern between the two variables

plot(mall$Age, mall$Score, xlab = "Age (years)", ylab = "Score")
title('Score and age plot')

## Interpretation: the scatter plot indicates
## that customers over 40 years of age tend to 
## spend less (lower average score) than
## younger customers (18 - 40)
