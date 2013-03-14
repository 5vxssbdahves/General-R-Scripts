# Make data
seq(from = 1, to = 2)
y <- data.frame(year = seq(1971, 1980), rgdpl = rnorm(10))
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
vlookup <- function(val, df, row){df[df[1] == val, row][1]}
vlookup(1974,y,2)
# Find value of gdp in earliest year that is not missing
y[y$yearNA == min(y$yearNA, na.rm=TRUE),2] # Why does it return two values? 
min(y$yearNA, na.rm=TRUE)
# Make function vlookup for finding value in earliest year that is not missing
vlookup1 <- function(df, row){
  df[df[3] == min(df[3], na.rm=TRUE), row][2]
}
vlookup1(y,2)
y
warnings()

# Create data with country
x <- data.frame(country = rep(c("A","B"), 1, each = 5), year = rep(seq(1971, 1975), 2), rgdpl = rnorm(10))
x
vlookup2 <- function(df, row){
  df[df[3] == min(df[3], na.rm=TRUE), row][2]
}


# Making observation missing
x$rgdpl[x$year == 1971] <- NA
x

# Source: https://stat.ethz.ch/pipermail/r-help/2008-March/157899.html