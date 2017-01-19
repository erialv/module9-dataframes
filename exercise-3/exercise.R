# Load R's "USPersonalExpenditure" dataset using the "data()" function
# This will produce a data frame called `USPersonalExpenditure`
data("USPersonalExpenditure")

# The variable USPersonalExpenditure is now accessible to you. Unfortunately,
# it's not a data frame (it's actually what is called a matrix)
# Test this using the `is.data.frame()` function
is.data.frame("USPersonalExpenditure")

# View(USPersonalExpenditure)

# Luckily, you can simply pass the USPersonalExpenditure variable as an argument
# to the `data.frame()` function to convert it a data farm. Do this, storing the
# result in a new variable
US.pe <- data.frame(USPersonalExpenditure)

# What are the column names of your dataframe?
colnames(US.pe) # "X.USPersonalExpenditure."

# Why are they so strange? Think about whether you could use a number like 1940
# with dollar notation!


# What are the row names of your dataframe?
rownames(US.pe) # "1"

# Create a column "category" that is equal to your rownames
US.pe$category <- rownames(US.pe)

# How much money was spent on personal care in 1940?
print(USPersonalExpenditure)
care.1940 <- US.pe["Personal Care", "X1940"]

# How much money was spent on Food and Tobacco in 1960?
food.tobacco.1960 <- US.pe["Food and Tobacco", "X1960"]

# What was the highest expenditure category in 1960?
# Hint: use the `max()` function to find the largest, then compare that to the column
max(food.tobacco.1960)

# Define a function `DetectHighest` that takes in a year as a parameter, and
# returns the highest spending category of that year
DetectHighest <- function(year) {
  collumn <- paste0('X',year)
  return(US.pe$category[US.pe[,collumn] == max(US.pe[,collumn])] )
}

# Using your function, determine the highest spending category of each year

check.1940 <- DetectHighest(1940)
check.1945 <- DetectHighest(1945)
check.1950 <- DetectHighest(1950)
check.1955 <- DetectHighest(1955)
check.1960 <- DetectHighest(1960)

