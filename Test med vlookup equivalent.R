# Make data
seq(from = 1, to = 2)
y <- data.frame(year = seq(1971, 1975), rgdpl = rnorm(5))
y
# Making observation missing
y$rgdpl[y$year == 1971] <- NA
# Make new year variable where year is missing if rgdpl is missing
y$yearNA <- ifelse(is.na(y$rgdpl), y$yearNA <- NA, y$year)
# See data
y
# Find value of gdp in 1972
y[y$year==1972,2]
# Make function vlookup for finding value in specified year
vlookup <- function(val, df, col){df[df[1] == val, col][1]} # NB: changed 'row' to 'col'
vlookup(1974,y,2)
# Find value of gdp in earliest year that is not missing
y[y$yearNA == min(y$yearNA, na.rm=TRUE),2][2] # Why does it return two values? Not anymore, had not specified the last [2]...
min(y$yearNA, na.rm=TRUE)
# Make function vlookup for finding value in earliest year that is not missing
vlookup1 <- function(df, row){
  df[df[3] == min(df[3], na.rm=TRUE), row][2]
}
# Apply function
vlookup1(y,2)
# Check result
y
# Create new variable with result of function
y$inigdp <- vlookup1(y,2)
# Check result
y

# Create data with country factor
x <- data.frame(country = rep(c("A","B"), 1, each = 5), year = rep(seq(1971, 1975), 2), rgdpl = rnorm(10))
x
# Making observation missing
x$rgdpl[x$year == 1971] <- NA
x
# Make new year variable where year is missing if rgdpl is missing
x$yearNA <- ifelse(is.na(x$rgdpl), x$yearNA <- NA, x$year)
x
# Split data frame
lx <- split(x[,2:4], x$country)
# Show data
lx
# Show data for country A
lx$A
# Shat data info
str(lx)
# Create function that finds gdp in earliest year that is not missing
vlookup6 <- function(df){
  df[df[3] == min(df[3], na.rm=TRUE), 2][2]
}
# Use lapply
lapply <- lapply(lx, vlookup6)
# I have now found the correct number... Now I need to find out how to apply it...
x$inigdp <- unsplit(lapply, x$country)
x

# Use aggregate()
aggregate(year ~ country, x, min)



# Source: https://stat.ethz.ch/pipermail/r-help/2008-March/157899.html