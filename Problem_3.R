mall <- read.csv('https://s3.eu-central-1.amazonaws.com/sf-timeseries/data/mall_customers.csv', stringsAsFactors = FALSE)

## c)
str(mall)

## d)
## Answer: 200

## e) 19

## f) Male

## g)
mean(mall$Age)

## h)
min(mall$Age)
max(mall$Age)
median(mall$Age)

summary(mall$Age)
## Empirical quantiles
quantile(mall$Age, c(0.1, 0.25, 0.5, 0.75, 0.95))

mean(mall$Age)
c(1, 2, 3, 4, 5) < 3

ageLessThanAvg <- (mall$Age < mean(mall$Age))
sum(ageLessThanAvg)
## sum(c(TRUE, FALSE))
## 

## ==
isFemale <- (mall$Gender == "Female")
sum(isFemale)

table(mall$Gender)

mean(mall$Income)

mall[c(1, 4), ]
mall[ c(1, 5), c(2, 4)]

mall[5, c(2, 4)]

isFemale
femaleCustomers <- mall[isFemale, ]
maleCustomers <- mall[!isFemale, ]

mean(femaleCustomers$Income)
mean(maleCustomers$Income)

