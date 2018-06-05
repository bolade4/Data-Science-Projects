# load data
bank.train <- read.csv("bank-additional-full.csv", header = T, sep = ";")
head(bank.train)
str(bank.train)
bank.test <- read.csv("bank-additional.csv", header = T, sep = ";")
head(bank.test)
str(bank.test)

# set train set as true and test set as false
bank.train$IsTrainSet <- T
bank.test$IsTrainSet <- F

# combine the dataset
bank.comb <- rbind(bank.train, bank.test)

# Statistical Summary of the Data
bank.summary <- data.frame("File" = c("Train Set", "Test Set", "Combined Set"),
                           "File Size" = sapply(list(bank.train, bank.test, bank.comb), function(x){format(object.size(x), "KB")}),
                           "TotalCharaters" = sapply(list(bank.train, bank.test, bank.comb), function(x){sum(nchar(x))}),
                           "TotalRow" = sapply(list(bank.train, bank.test, bank.comb), function(x){sum(nrow(x))}),
                           "TotalColumn" = sapply(list(bank.train, bank.test, bank.comb), function(x){sum(ncol(x))}))
bank.summary

# structure of the combined dataset
rbind(head(bank.comb), tail(bank.comb))
str(bank.comb)
lapply(bank.comb, class)
summary(bank.comb)

# rename the variable y
# names(bank.comb)[names(bank.comb) == "y"] <- "subscribe"
# names(bank.comb)
# head(bank.comb)

# view the subscription rate
table(bank.comb$y)

# visualize the data
library(ggplot2)

ggplot(bank.comb[1:41188, ], aes(duration, fill = y)) +
  geom_histogram()  +
  xlab("Duration") +
  ylab("Total Count") +
  labs(fill = "Subcription")

# distribution of education in the dataset
table(bank.comb$education)

# visualize the relationship between subscribe, duration and education
ggplot(bank.comb[1:41188, ], aes(duration, fill = y)) +
  geom_histogram(binwidth = 10) +
  facet_wrap(~ education) +
  ggtitle("Education") +
  xlab("Education") +
  ylab("Total Count") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))
  
# visualize the relationship between subscribe, duration and age
ggplot(bank.comb[1:41188, ], aes(age, duration, col = y)) +
  geom_point() +
  ggtitle("Age vs Duration") +
  xlab("Age") +
  ylab("Duration") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

ggplot(bank.comb[1:41188, ], aes(age, duration, fill = y)) +
  geom_bar(stat = "identity") +
  ggtitle("Age vs Duration") +
  xlab("Age") +
  ylab("Duration") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

# visualize the relationship between subscribe, duration and job
ggplot(bank.comb[1:41188, ], aes(duration, fill = y)) +
  geom_histogram(binwidth = 10) +
  facet_wrap(~ job) +
  ggtitle("Job") +
  xlab("Job") +
  ylab("Total Count") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

# visualize the relationship between subscribe, duration and education
ggplot(bank.comb[1:41188, ], aes(duration, fill = y)) +
  geom_histogram(binwidth = 10) +
  facet_wrap(~ marital) +
  ggtitle("Marital") +
  xlab("Marital") +
  ylab("Total Count") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

# visualize the relationship between subscribe, age and education
ggplot(bank.comb[1:41188, ], aes(age, fill = y)) +
  geom_histogram(binwidth = 10) +
  facet_wrap(~ education) +
  ggtitle("Age") +
  xlab("Age") +
  ylab("Total Count") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

# visualize the relationship between subscribe, age, emp.var.rate,
# duration, cons.price.idx and cons.conf.idx
ggplot(bank.comb[1:41188, ], aes(age, duration, col = y)) +
  geom_point() +
  facet_wrap(~ emp.var.rate + cons.price.idx + cons.conf.idx, 
             scales = "free", labeller = "label_both") +
  ggtitle("Age") +
  xlab("Age") +
  ylab("Duration") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

## cleaning the data
# Detecting the outliers
head(bank.comb)
str(bank.comb)

# doing some feature engineering
# creating a dependant variable subscribe 
bank.comb$subscribe <- ifelse(bank.comb$y == "no", 0 | bank.comb$y == "yes", 1) 
table(bank.comb$y)
table(bank.comb$subscribe)

# Multivariate Model Approach
library(dplyr)

# select both variables for the model
bank.out <- select(bank.comb, -duration, -y, -IsTrainSet)
str(bank.out)
summary(bank.out)

# using Cooks distance
bank.outmod <- lm(subscribe ~ ., data = bank.out)
bank.outcooksd <- cooks.distance(bank.outmod)

# influential measures
# plot the cook's distance with cutoff line and also add labels
plot(bank.outcooksd, pch = "*", cex = 2, main = "Influential observation by Cooks distance")
abline(h = 4 * mean(bank.outcooksd, na.rm = T), col = "blue")
text(x = 1:length(bank.outcooksd) + 1, y = bank.outcooksd, labels = ifelse(bank.outcooksd > 4 * mean(bank.outcooksd, na.rm = T),
                                                                           names(bank.outcooksd), ""), col = "red")
# viewing the influential row numbers
bank.outinf <- as.numeric(names(bank.outcooksd)[(bank.outcooksd > 4 * mean(bank.outcooksd, na.rm = T))])
head(bank.out[bank.outinf, ])

# testing the model for the extreme outliers
library(car)
outlierTest(bank.outmod)

# visualizing some of the outliers
par(resetPar())
par(bg = "white")
boxplot(bank.comb$age)
boxplot(bank.comb$campaign)
boxplot.stats(bank.comb$pdays)$out
boxplot(age ~ default, data = bank.comb, main = "Subscription across job")

# treating the outliers using the Tukey rules on quartiles +/- 1.5 IQR
removeOUT <- function(x, y) {
  y.name <- eval(substitute(y),eval(x))
  total <- sum(!is.na(y.name))
  total1 <- sum(is.na(y.name))
  tot.mean <- mean(y.name, na.rm = T)
  par(mfrow = c(2, 2), oma = c(0,0,3,0))
  boxplot(y.name, main = "Data view with outliers(Boxplot)")
  hist(y.name, main = "Data view with outliers(Hist...)", xlab = NA, ylab = NA)
  detect.out <- boxplot.stats(y.name)$out
  outlier.mean <- mean(detect.out)
  y.name <- ifelse(y.name %in% detect.out, NA, y.name)
  boxplot(y.name, main = "Data view without outliers(Boxplot)")
  hist(y.name, main = "Data view without outliers(Hist...)", xlab = NA, ylab = NA)
  title("Viewing the outliers", outer = T)
  total2 <- sum(is.na(y.name))
  message("Found outliers: ", total2 - total1, " in ", total, " observations")
  message("Outlier's proportion (%): ", (total2 - total1) / total * 100)
  message("Outlier's mean: ", outlier.mean)
  tot.mean1 <- mean(y.name, na.rm = T)
  message("Mean with outliers: ", tot.mean)
  message("Mean without outliers: ", tot.mean1)
  view.rep <- readline(prompt = "Remove and replace outliers with NA? [yes/no]: ")
  if(view.rep == "y" | view.rep == "yes"){
    x[as.character(substitute(y))] <- invisible(y.name)
    assign(as.character(as.list(match.call())$x), x, envir = .GlobalEnv)
    message("Data updated: Outliers removed", "\n")
    return(invisible(x))
  } else{
    message("Data not updated", "\n")
    return(invisible(y.name))
  }
}

# running the code to remove the outliers
bank.Rmout <- bank.out
summary(bank.Rmout)

# analysing the variable (age)
ggplot(bank.comb[1:41188, ], aes(age, fill = y)) +
  geom_histogram() +
  ggtitle("Age") +
  xlab("Age") +
  ylab("Total count") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

bank.ageval <- boxplot.stats(bank.out$age)$out
boxplot(bank.out$age, main = "Age", boxwex = 0.1)
mtext(paste("Outliers: ", paste(bank.ageval, collapse = ", ")), cex = 0.5)

# remove outliers
removeOUT(bank.Rmout, age)

# analysing the variable (campaign)
summary(bank.comb)
ggplot(bank.comb[1:41188, ], aes(campaign, fill = y)) +
  geom_histogram() +
  ggtitle("Campaign") +
  xlab("Campaign") +
  ylab("Total count") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))
  
par(resetPar())
par(bg = "white")
bank.campval <- boxplot.stats(bank.out$campaign)$out
boxplot(bank.out$campaign, main = "Campaign", boxwex = 0.1)
mtext(paste("Outliers: ", paste(bank.campval, collapse = ", ")), cex = 0.5)

# remove outliers
removeOUT(bank.Rmout, campaign)

# analysing the variable (pdays)
bank.Rmout$new_pdays <- bank.Rmout$pdays
summary(bank.Rmout)
rbind(head(bank.Rmout$pdays), tail(bank.Rmout$pdays))
length(which(bank.Rmout$pdays == 999))
length(unique(bank.comb$pdays))
unique(bank.comb$pdays)
summary(bank.Rmout$pdays)
subset(bank.Rmout, pdays == 999 )
bank.Rmout[bank.Rmout$new_pdays == 999, "new_pdays"] <- 0

ggplot(bank.Rmout, aes(new_pdays, fill = factor(subscribe))) +
  geom_histogram(binwidth = 5) +
  ggtitle("new_Pdays") +
  xlab("new_Pdays") +
  ylab("Total count") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

par(resetPar())
par(bg = "white")
bank.pdval <- boxplot.stats(bank.Rmout$new_pdays)$out
boxplot(bank.Rmout$new_pdays, main = "new_Pdays", boxwex = 0.1)
mtext(paste("Outliers: ", paste(bank.pdval, collapse = ", ")), cex = 0.5)

# remove outliers
bank.Rmout$new_pdaysout <- bank.Rmout$new_pdays
removeOUT(bank.Rmout, new_pdaysout)
summary(bank.Rmout$new_pdays)
summary(bank.Rmout$new_pdaysout)

### clean missing values of new_pdaysout
is.na(bank.Rmout$new_pdaysout)
table(is.na(bank.Rmout$new_pdaysout))
table(bank.Rmout$new_pdaysout)
newpd.median <- median(bank.Rmout$new_pdaysout, na.rm = T)
bank.Rmout[is.na(bank.Rmout$new_pdaysout), "new_pdaysout"] <- newpd.median
table(is.na(bank.Rmout$new_pdaysout))
head(bank.Rmout)
summary(bank.Rmout$new_pdays)
summary(bank.Rmout$new_pdaysout)

# testing the data with or without outliers to know the best fit
# Plot of data with outliers.
par(mfrow=c(1, 2))
plot(bank.Rmout$new_pdays, bank.Rmout$subscribe, xlim=c(0, 28), ylim=c(0, 230), 
     main="With Outliers \n Better fit!", xlab="pdays", ylab="subscribe", pch="*", col="red", cex=2)
abline(lm(subscribe ~ new_pdays, data = bank.Rmout), col="blue", lwd=3, lty=2)

# Plot of data without outliers. 
# Note the change in slope (angle) of best fit line.
plot(bank.Rmout$new_pdaysout, bank.Rmout$subscribe, xlim=c(0, 28), ylim=c(0, 230), 
     main="With outliers removed", xlab="new_pdays", ylab="subscribe", pch="*", col="red", cex=2)
abline(lm(subscribe ~ new_pdaysout, data = bank.Rmout), col="blue", lwd=3, lty=2)

# analysing the variable (previous)
max(bank.Rmout$previous)
ggplot(bank.Rmout[1:41188, ], aes(previous, fill = factor(subscribe))) +
  geom_histogram(binwidth = 0.5) +
  ggtitle("Previous") +
  xlab("Previous") +
  ylab("Total count") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

order(bank.Rmout$previous)
length(which(bank.Rmout$previous > 5))
which(bank.Rmout$previous > 5)
summary(bank.Rmout$previous)

# analysing the variable (emp.var.rate)
bank.Rmout$emp_var_rate <- bank.Rmout$emp.var.rate
summary(bank.Rmout)
ggplot(bank.Rmout[1:41188, ], aes(emp_var_rate, fill = factor(subscribe))) +
  geom_histogram(binwidth = 0.5) +
  ggtitle("Employment Variation Rate") +
  xlab("Emp var rate") +
  ylab("Total count") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

bank.evr <- boxplot.stats(bank.Rmout$emp_var_rate)$out
boxplot(bank.Rmout$emp_var_rate, main = "Employment Variation Rate", boxwex = 0.1)
mtext(paste("Outliers: ", paste(bank.evr, collapse = ", ")), cex = 1)

# analysing the variable (cons.price.idx)
bank.Rmout$cons_price_idx <- bank.Rmout$cons.price.idx
summary(bank.Rmout)
ggplot(bank.Rmout[1:41188, ], aes(cons_price_idx, fill = factor(subscribe))) +
  geom_histogram(binwidth = 0.5) +
  ggtitle("Consumer Price Index") +
  xlab("Cons price idx") +
  ylab("Total count") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

bank.cpi <- boxplot.stats(bank.Rmout$cons_price_idx)$out
boxplot(bank.Rmout$cons_price_idx, main = "Employment Variation Rate", boxwex = 0.1)
mtext(paste("Outliers: ", paste(bank.cpi, collapse = ", ")), cex = 1)

# analysing the variable (cons.conf.idx)
bank.Rmout$cons_conf_idx <- bank.Rmout$cons.conf.idx
summary(bank.Rmout)
ggplot(bank.Rmout[1:41188, ], aes(cons_conf_idx, fill = factor(subscribe))) +
  geom_histogram(binwidth = 2) +
  ggtitle("Consumer Confidence Index") +
  xlab("Cons conf idx") +
  ylab("Total count") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

bank.cci <- boxplot.stats(bank.Rmout$cons_conf_idx)$out
boxplot(bank.Rmout$cons_conf_idx, main = "Consumer Confidence Index", boxwex = 0.1)
mtext(paste("Outliers: ", paste(bank.cci, collapse = ", ")), cex = 0.5)

# remove outliers
removeOUT(bank.Rmout, cons_conf_idx)
summary(bank.Rmout$cons_conf_idx)
summary(bank.Rmout$cons.conf.idx)

# testing the data with or without outliers to know the best fit
# Plot of data with outliers.
par(mfrow=c(1, 2))
plot(bank.Rmout$cons.conf.idx, bank.Rmout$subscribe, xlim=c(0, 28), ylim=c(0, 230), 
     main="With Outliers", xlab="cons.conf.idx", ylab="subscribe", pch="*", col="red", cex=2)
abline(lm(subscribe ~ cons.conf.idx, data = bank.Rmout), col="blue", lwd=3, lty=2)

# Plot of data without outliers. 
# Note the change in slope (angle) of best fit line.
plot(bank.Rmout$cons_conf_idx, bank.Rmout$subscribe, xlim=c(0, 28), ylim=c(0, 230), 
     main="With outliers removed \n No difference!", xlab="cons_conf_idx", ylab="subscribe", pch="*", col="red", cex=2)
abline(lm(subscribe ~ cons_conf_idx, data = bank.Rmout), col="blue", lwd=3, lty=2)

# analysing the variable (euribor3m)
summary(bank.Rmout$euribor3m)
ggplot(bank.Rmout[1:41188, ], aes(euribor3m, fill = factor(subscribe))) +
  geom_histogram(binwidth = 0.5) +
  ggtitle("Euribor 3 month rate") +
  xlab("Euribor3m") +
  ylab("Total count") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

par(resetPar())
par(bg = "white")
bank.eur <- boxplot.stats(bank.Rmout$euribor3m)$out
boxplot(bank.Rmout$euribor3m, main = "Euribor 3 month rate", boxwex = 0.1)
mtext(paste("Outliers: ", paste(bank.eur, collapse = ", ")), cex = 1)

# analysing the variable (nr.employed)
bank.Rmout$nr_employed <- bank.Rmout$nr.employed
summary(bank.Rmout$nr_employed)
ggplot(bank.Rmout[1:41188, ], aes(nr_employed, fill = factor(subscribe))) +
  geom_histogram(binwidth = 5) +
  ggtitle("Number of employees") +
  xlab("Nr employed") +
  ylab("Total count") +
  labs(fill = "Subscription") +
  theme(plot.title = element_text(hjust = 0.5))

par(resetPar())
par(bg = "white")
bank.nr <- boxplot.stats(bank.Rmout$nr_employed)$out
boxplot(bank.Rmout$nr_employed, main = "Number of employees", boxwex = 0.1)
mtext(paste("Outliers: ", paste(bank.nr, collapse = ", ")), cex = 1)

# analysing the variable (duration)
# checking the duration and y relationship
# removeOUT(bank.Rmout, duration)
bank.dury <- bank.comb[, c("duration", "y")]
rbind(head(bank.dury), tail(bank.dury))
length(which(bank.dury$duration == 0))
subset(bank.dury, duration == 0)
table(bank.dury$y)

# analysing the relationship between campaign, new_days, previous and poutcome
# campaign and pdays relationship
bank.campd <- bank.Rmout[, c("campaign", "pdays")]
bank.campd1 <- subset(bank.campd, pdays == 999)
length(bank.campd1$campaign)
max(bank.campd1$campaign, na.rm = T)

# pdays and previous relationship
bank.pdpre <- bank.Rmout[, c("pdays", "previous")]
rbind(head(bank.pdpre, 20), tail(bank.pdpre, 20))

# campaign, pdays and previous relationship
bank.capdpre <-  bank.Rmout[, c("campaign", "pdays", "previous")]
rbind(head(bank.capdpre, 20), tail(bank.capdpre, 20))
order(bank.capdpre$campaign)
max(bank.capdpre$campaign, na.rm = T)
subset(bank.capdpre, bank.capdpre$campaign > 2)

# previous and poutcome relationship
bank.prep <- bank.Rmout[, c("previous", "poutcome")]
subset(bank.prep, bank.prep$poutcome == "success")
bank.prepnon <- subset(bank.prep, bank.prep$poutcome == "nonexistent")
table(bank.prepnon$previous)
subset(bank.prep, bank.prep$poutcome == "failure")

# campaign, pdays, new_pdays, previous and poutcome relationship
bank.capdprepo <- bank.Rmout[, c("campaign", "pdays", "new_pdays", "previous", "poutcome")]
subset(bank.capdprepo, bank.capdprepo$poutcome == "success")
subset(bank.capdprepo, bank.capdprepo$poutcome == "failure")
subset(bank.capdprepo, bank.capdprepo$poutcome == "nonexistent")
summary(bank.Rmout$pdays)
summary(bank.Rmout$new_pdays)

# visualizing the campaign, new_days, previous and poutcome relationship
ggplot(bank.capdprepo[1:41188, ], aes(campaign, fill = poutcome)) +
  geom_histogram(binwidth = 2) +
  facet_wrap(~ new_pdays + previous, scales = "free", labeller = "label_both") +
  ggtitle("Campaign") +
  xlab("Campaign") +
  ylab("Total count") +
  labs(fill = "Poutcome") +
  theme(plot.title = element_text(hjust = 0.5))

### cleaning the dataset
getwd()
setwd("C:/Users/bolad/R")
summary(bank.Rmout)
rbind(head(bank.Rmout), tail(bank.Rmout))

# make some factor variables characters
bank.cl <- bank.Rmout
bank.cl[c("job", "marital", "education", "default", "housing",
          "loan", "poutcome")] <- lapply(bank.cl[c("job", "marital", "education", "default", "housing",
                                                   "loan", "poutcome")], as.character)

# delete non important variables
bank.cl$emp.var.rate <- NULL
bank.cl$cons.price.idx <- NULL
bank.cl$cons.conf.idx <- bank.cl$cons_conf_idx
bank.cl$cons.conf.idx <- NULL
bank.cl$nr.employed <- NULL
bank.cl$pdays <- NULL

install.packages("stringr")
library(stringr)
rbind(head(bank.cl), tail(bank.cl))

### cleaning the categorical variables
# cleaning the variable (job)
summary(bank.cl$job)
table(bank.cl$job)
bank.cl$job <- str_replace(bank.cl$job, "\\.", "")
bank.cl$job <- str_replace(bank.cl$job, "\\-", " ")

# cleaning the variable (marital)
summary(bank.cl$marital)
table(bank.cl$marital)

# cleaning the variable (education)
table(bank.cl$education)
bank.cl$education <- str_replace(bank.cl$education, "\\.", " ")

# cleaning the variable (default)
table(bank.cl$default)

# cleaning the variable (housing)
table(bank.cl$housing)
View(bank.cl$housing)

# cleaning the variable (loan)
table(bank.cl$loan)

# cleaning the variable (poutcome)
table(bank.cl$poutcome)
bank.cl$poutcome <- str_replace(bank.cl$poutcome, "nonexistent", "non existent")

# turning all the unknown into NA's
library(dplyr)
bank.cl <- mutate_all(bank.cl, funs(replace(., . == "unknown", NA)))

# dealing with the missing values
# make categorical variables
bank.cl[c("job", "marital", "education", "default", "housing",
          "loan", "poutcome")] <- lapply(bank.cl[c("job", "marital", "education", "default", "housing",
                                                   "loan", "poutcome")], as.factor)

summary(bank.cl)
str(bank.cl)
bank.cln <- bank.cl
bank.cln <- subset(bank.cln, select = -c(new_pdaysout))

# checking the percentage of missing data
bank.Pmiss <- function(x){
  sum(is.na(x)) / length(x) * 100
}
apply(bank.cln, 2, bank.Pmiss)
apply(bank.cln, 1, bank.Pmiss)

# checking the missng pattern using mice
# check if a package is installed
is.installed <- function(mypkg) is.element(mypkg, installed.packages()[, 1])
is.installed("mice")
library(mice)

# check the pattern and each number of variable missing values
md.pattern(bank.cln)
sapply(bank.cln, function(x) sum(is.na(x)))

# visualizing the missing values
is.installed("VIM")
install.packages("VIM")
library(VIM)
bank.clplot <- aggr(bank.cln, col = c("navyblue", "red"), numbers = T, sortVars = T, 
                    labels = names(bank.cln), cex.axis = 0.7, gap = 3, 
                    ylab = c("Missing data view","Pattern"))

# using boxplot to visualize the missing values of the 
# first two variables age and job
marginplot(bank.cl[c(1, 2)])

# imputing the missing data using mice
library(mice)
str(bank.cln)
summary(bank.cln)

# imputaion
init <- mice(bank.cln, maxit = 0) 
meth <- init$method
predM <- init$predictorMatrix

# remove both subscribe and default variables as a predictor
predM[, c("subscribe")] <- 0
predM[, c("default")] <- 0

# imputation method
meth[c("age", "campaign", "cons_conf_idx")] <- "norm" 
meth[c("default", "housing", "loan")] <- "logreg" 
meth[c("job", "marital", "education")] <- "polyreg"

# running the multiple imputation
set.seed(267)
bank.impute <- mice(bank.cln, method = meth, predictorMatrix = predM, m = 5)
summary(bank.impute)

# check the imputed data for age
bank.impute$imp$age

# create a dataset after imputation 
bank.imputed <- complete(bank.impute)

# inspecting the distribution of original and imputed data
sapply(bank.imputed, function(x) sum(is.na(x)))
xyplot(bank.impute, age ~ job + marital + education + default + housing + loan + campaign + cons_conf_idx,
       pch = 18, cex = 1, scales = "free", labeller = "label_both")
densityplot(bank.impute)
stripplot(bank.impute, pch = 20, cex = 1.2)

# checking the distribution of the final dataset
# for continuous variables
library(purrr)
library(tidyr)
library(ggplot2)

bank.cltrain %>% 
  keep(is.numeric) %>% 
  gather() %>% 
  ggplot(aes(value)) +
  facet_wrap(~ key, scales = "free") +
  geom_histogram(bins = 10)

# for categorical variables
bank.catcl <- bank.cltrain[c("job", "marital", "education", "default", "housing", "loan", "contact", "month", "day_of_week",
                             "poutcome", "subscribe")]
bank.cltrain %>% 
  keep(is.factor) %>% 
  gather() %>% 
  ggplot(aes(value)) +
  facet_wrap(~ key, scales = "free") +
  geom_bar()

# building the model
# split dataset into train and test
bank.clnimput$IsTrainSet <- bank.comb$IsTrainSet
str(bank.clnimput)
summary(bank.clnimput)
bank.cltrain <- bank.clnimput[bank.clnimput$IsTrainSet == T, ]
bank.cltest <- bank.clnimput[bank.clnimput$IsTrainSet == F, ]
summary(bank.cltrain)
summary(bank.cltest)

# cleaned dataset
write.csv(bank.cltrain, file = "bank.cltrain.csv", row.names = F)
write.csv(bank.cltest, file = "bank.cltest.csv", row.names = F)

# delete the isTrainset variable
bank.cltrain$IsTrainSet <- NULL
bank.cltest$IsTrainSet <- NULL

# proportion of customers who subscribe say yes to no
# also i'm trying to beat this in my models
table(bank.cltrain$subscribe)

# using a simple baseline method to check the accuracy of our model
# since those who say "no" are more than those who say "yes", in this case 
# we will predict most people did not subscribe to the bank term
(36548) / (36548 + 4640)

# selecting the best variables to use for the model
names(bank.cltrain)
str(bank.cltrain)

# correlation
sapply(bank.cltrain, class)
cor(bank.cltrain[c("age", "campaign", "previous", "euribor3m", "subscribe", "new_pdays", 
                   "emp_var_rate", "cons_price_idx", "cons_conf_idx", "nr_employed")])

# choosing variables to use
bank.model <- glm(subscribe ~ age + job + marital + education + default + housing + 
                    loan + contact + month + day_of_week + campaign +
                    previous + poutcome + euribor3m + new_pdays + emp_var_rate + cons_price_idx + 
                    cons_conf_idx + nr_employed, family = binomial, data = bank.cltrain)
summary(bank.model)

# correlation
is.installed("corrplot")
install.packages("corrplot")
library(corrplot)
is.installed("corrgram")
library(corrgram)
sapply(bank.cltrain, class)
bank.cor <- bank.cltrain[c("age", "campaign", "previous", "euribor3m", "new_pdays", 
                           "emp_var_rate", "cons_price_idx", "cons_conf_idx", "nr_employed")]
summary(bank.cor)
sapply(bank.cor, class)
cor(bank.cor)
is.installed("PerformanceAnalytics")
install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

corrplot(cor(bank.cor))
chart.Correlation(bank.cor, method = "spearman", histogram = T, pch = 16)

# correlation test
library(psych)
corr.test(bank.cor, use = "pairwise", method = "spearman", adjust = "none", alpha = 0.05)

# Computing the p-value of correlations
cor.mtest <- function(mat, ...) {
  mat <- as.matrix(mat)
  n <- ncol(mat)
  p.mat<- matrix(NA, n, n)
  diag(p.mat) <- 0
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      tmp <- cor.test(mat[, i], mat[, j], ...)
      p.mat[i, j] <- p.mat[j, i] <- tmp$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  p.mat
}
# matrix of the p-value of the correlation
p.mat <- cor.mtest(bank.cor)
head(p.mat[, 1:5])

# Specialized the insignificant value according to the significant level
corrplot(cor(bank.cor), type="upper", order="hclust", 
         p.mat = p.mat, sig.level = 0.01)

# Leave blank on no significant coefficient
corrplot(cor(bank.cor), type="upper", order="hclust", 
         p.mat = p.mat, sig.level = 0.01, insig = "blank")
#--------------------------------------------------------------------------
#
## logistic regression
#
#--------------------------------------------------------------------------
str(bank.cltrain)
bank.cltrain$subscribe <- as.factor(bank.cltrain$subscribe)
bank.cltest$subscribe <- as.factor(bank.cltest$subscribe)

# move the dependent variable to last colomn on both training and test set
library(dplyr)
names(bank.cltrain)
bank.cltrain <- select(bank.cltrain, age:euribor3m, new_pdays:nr_employed, subscribe)
bank.cltest <- select(bank.cltest, age:euribor3m, new_pdays:nr_employed, subscribe)

# build the model
bank.model <- glm(subscribe ~ age + job + marital + education + default + housing + 
                    loan + contact + month + day_of_week + campaign +
                    previous + poutcome + euribor3m + new_pdays + emp_var_rate + cons_price_idx + 
                    cons_conf_idx + nr_employed, family = binomial, data = bank.cltrain)
summary(bank.model)

bank.model1 <- glm(subscribe ~ job + education + contact + month + day_of_week +
                     poutcome + new_pdays + emp_var_rate + cons_price_idx + 
                     cons_conf_idx + nr_employed, family = binomial, data = bank.cltrain)
summary(bank.model1)

# predicting the model on the training set
bank.preTrain <- predict(bank.model1, data = bank.cltrain, type = "response")
summary(bank.preTrain)

# probability of a client subscribing or not
head(bank.preTrain)

# misclassification error for train data
bank.prederror <- ifelse(bank.preTrain > 0.5, 1, 0)
bank.errortab <- table(Predicted = bank.prederror, Actual = bank.cltrain$subscribe)
bank.errortab

# error rate
1 - sum(diag(bank.errortab)) / sum(bank.errortab)

# accuracy rate
sum(diag(bank.errortab)) / sum(bank.errortab)

# testing the quality of the prediction (to see if the prediction of no is higher yes)
# average prediction for each of the true outcomes
tapply(bank.preTrain, bank.cltrain$subscribe, mean)

# choose a right threshold value
is.installed("pROC")
install.packages("pROC")
library(pROC)
my.roc <- roc(bank.cltrain$subscribe, bank.preTrain)
coords(my.roc, "best", ret = "threshold")

# choose a threshold value graphically
is.installed("ROCR")
library(ROCR)
bank.predROCR <- prediction(bank.preTrain, bank.cltrain$subscribe)
bank.perfROCR <- performance(bank.predROCR, "tpr", "fpr")
par(mar = c(4, 4, 2, 2), mfrow = c(1, 1))
plot(bank.perfROCR)
plot(bank.perfROCR, colorize = T)
plot(bank.perfROCR, colorize = T, print.cutoffs.at = seq(0, 1, 0.1), text.adj = c(-0.2, 1.7))

# predicting the model on the test set
bank.preTest <- predict(bank.model1, type = "response", newdata = bank.cltest)
summary(bank.preTest)

# probability of a client subscribing or not
head(bank.preTest)

# using treashhold value
table(bank.cltest$subscribe, bank.preTest > 0.2)

# error rate
1 - ((3325 + 263) / (3325 + 343 + 188 + 263))

# model accuracy rate
(3325 + 263) / (3325 + 343 + 188 + 263)

# misclassification error for train data
bank.tsterror <- ifelse(bank.preTest > 0.2, 1, 0)
bank.tsttab <- table(Predicted = bank.tsterror, Actual = bank.cltest$subscribe)
bank.tsttab

# error rate
1 - sum(diag(bank.tsttab)) / sum(bank.tsttab)

# model accuracy rate
sum(diag(bank.tsttab)) / sum(bank.tsttab)

# model fit test
with(bank.model1, pchisq(null.deviance - deviance, df.null - df.residual,
                         lower.tail = F))

# out of sample accuracy(auc)
bank.testROCRpred <- prediction(bank.preTest, bank.cltest$subscribe)
as.numeric(performance(bank.testROCRpred, "auc")@y.values)

# F1 Score
table(bank.cltest$subscribe, bank.preTest > 0.2)
bank.lrpre <- (3325) / (3325 + 343)
bank.lrrec <- (3325) / (3325 + 188)
2 * ((bank.lrpre * bank.lrrec) / (bank.lrpre + bank.lrrec))

#--------------------------------------------------------------------------
#
## Decision tree with party
#
#--------------------------------------------------------------------------

is.installed("party")
install.packages("party")
library(party)

bank.ptytree <- ctree(subscribe ~ ., data = bank.cltrain)
bank.ptytree
plot(bank.ptytree)

# using some selected important variables
bank.ptytree1 <- ctree(subscribe ~ contact + poutcome + new_pdays + emp_var_rate + cons_price_idx + 
                         cons_conf_idx, data = bank.cltrain, 
                       controls = ctree_control(mincriterion = 0.99, minsplit = 5000))
bank.ptytree1
plot(bank.ptytree1)

# misclassification error for train dataset
bank.trmis <- table(predict(bank.ptytree), bank.cltrain$subscribe)
bank.trmis
1 - sum(diag(bank.trmis)) / sum(bank.trmis)

# model accuray
sum(diag(bank.trmis)) / sum(bank.trmis)

# predicting using the decision tree with test set
bank.ptypre <- predict(bank.ptytree, bank.cltest, type = "prob")
head(bank.ptypre)
bank.ptypre1 <- predict(bank.ptytree, newdata = bank.cltest)
head(bank.ptypre1, 100)

# misclassification error for test dataset
bank.tstmis <- table(bank.ptypre1, bank.cltest$subscribe)
bank.tstmis
1 - sum(diag(bank.tstmis)) / sum(bank.tstmis)

# model accuray
sum(diag(bank.tstmis)) / sum(bank.tstmis)

# error rate
1 - ((3619 + 104) / (3619 + 347 + 49 + 104))

# model accuracy rate
(3619 + 104) / (3619 + 347 + 49 + 104)

# F1 Score
bank.dtpre <- (3619) / (3619 + 347)
bank.dtrec <- (3619) / (3619 + 49)
2 * ((bank.dtpre * bank.dtrec) / (bank.dtpre + bank.dtrec))

#--------------------------------------------------------------------------
#
## Rpart
#
#--------------------------------------------------------------------------

# build the model
is.installed("rpart")
library(rpart)
library(rpart.plot)

str(bank.cltrain)
set.seed(2374)
bank.clTree <- rpart(subscribe ~ ., data = bank.cltrain, method = "class", 
                     control = rpart.control(minbucket = 25))

# plot the tree
prp(bank.clTree)

# predict the model with test data
bank.preCART <- predict(bank.clTree, newdata = bank.cltest, type = "class")

# check the accuracy of the prediction
table(bank.cltest$subscribe, bank.preCART)
(3634 + 85) / (3634 + 34 + 366 + 85)

# generate ROC for the CART model
library(ROCR)

bank.preROCRp <- predict(bank.clTree, newdata = bank.cltest)

# generate the ROC curve
bank.Rptpred <- prediction(bank.preROCRp[, 2], bank.cltest$subscribe)
bank.Rptperf <- performance(bank.Rptpred, "tpr", "fpr")
plot(bank.Rptperf)

# out of sample accuracy(auc)
as.numeric(performance(bank.Rptpred, "auc")@y.values)

# F1 Score
bank.rppre <- (3634) / (3634 + 34)
bank.rprec <- (3634) / (3634 + 366)
2 * ((bank.rppre * bank.rprec) / (bank.rppre + bank.rprec))

#--------------------------------------------------------------------------
#
## RandomForest
#
#--------------------------------------------------------------------------

# making the dependent variable logical
bank.cltnrf <- bank.cltrain
bank.cltsrf <- bank.cltest

# building the model
library(randomForest)
set.seed(222)
bank.forest <- randomForest(subscribe ~ ., data = bank.cltnrf)
print(bank.forest)
attributes(bank.forest)
bank.forest$confusion

# prediction and confussion matrix for the training data
library(caret)
bank.pretrn <- predict(bank.forest, bank.cltnrf)

# comparing model accuracy using the predicted model vs base model
head(bank.pretrn) # predicted model
head(bank.cltnrf$subscribe) # base model

# confussion matrix and stat
confusionMatrix(bank.pretrn, bank.cltnrf$subscribe)

# prediction and confussion matrix for the test data
bank.pretst <- predict(bank.forest, bank.cltsrf)

# comparing model accuracy using the predicted model vs base model
head(bank.pretst) # predicted model
head(bank.cltsrf$subscribe) # base model

# confussion matrix and stat
confusionMatrix(bank.pretst, bank.cltsrf$subscribe)

# check the accuracy of the prediction
table(bank.cltsrf$subscribe, bank.pretst)
(3661 + 247) / (3661 + 7 + 204 + 247)

# error rate in the random forest model
plot(bank.forest)

# further analysis on random forest model
# mtry tune
names(bank.cltnrf)
bank.tmtry <- tuneRF(bank.cltnrf[, -15], bank.cltnrf[, 15],
                     stepFactor = 0.5, plot = T,
                     ntreeTry = 600, trace = T, improve = 0.05)

# running the model again after getting the right tune
bank.forest1 <- randomForest(subscribe ~ ., data = bank.cltnrf,
                             ntree = 600, mtry = 4, importance = T)
print(bank.forest1) 

# prediction and confussion matrix for the training data
bank.pretrn1 <- predict(bank.forest1, bank.cltnrf)

# comparing model accuracy using the predicted model vs base model
head(bank.pretrn1) # predicted model
head(bank.cltnrf$subscribe) # base model

# confussion matrix and stat
confusionMatrix(bank.pretrn1, bank.cltnrf$subscribe)

# prediction and confussion matrix for the test data
bank.pretst1 <- predict(bank.forest1, bank.cltsrf)

# comparing model accuracy using the predicted model vs base model
head(bank.pretst1) # predicted model
head(bank.cltsrf$subscribe) # base model

# confussion matrix and stat
confusionMatrix(bank.pretst1, bank.cltsrf$subscribe)

# check the accuracy of the prediction
table(bank.cltsrf$subscribe, bank.pretst1)
(3662 + 248) / (3662 + 6 + 203 + 248)

# number of tree nodes
hist(treesize(bank.forest1),
     main = "Number of Tree Nodes",
     col = "green")

# variable importance
varImpPlot(bank.forest1, 
           sort = T,
           n.var = 10,
           main = "Top Ten Variable Importance")
importance(bank.forest1)
varUsed(bank.forest1)

# F1 Score
bank.rfpre <- (3662) / (3662 + 6)
bank.rfrec <- (3662) / (3662 + 206)
2 * ((bank.rfpre * bank.rfrec) / (bank.rfpre + bank.rfrec))

#--------------------------------------------------------------------------
#
## Cross validation
#
#--------------------------------------------------------------------------


# using cross validation for the model
library(caret)
is.installed("e1071")
library(e1071)
set.seed(123)

# get how many volt we want
bank.fitCntl <- trainControl(method = "cv", number = 10,
                             savePredictions = T)
bank.cartGrid <- expand.grid(.cp = (1:100) * 0.001)
bank.cvtrn <- train(subscribe ~ ., data = bank.cltrain, method = "rpart", 
                    trControl = bank.fitCntl, tuneGrid = bank.cartGrid)

# print bank.cvtrn1 to get the cp value
print(bank.cvtrn)

# create a new cart model
bank.treeCV <- rpart(subscribe ~ ., method = "class", data = bank.cltrain,
                     control = rpart.control(cp = 0.002))

# plot the tree
prp(bank.treeCV)

# prediction on test dataset
bank.predCV <- predict(bank.treeCV, newdata = bank.cltest, type = "class")

# check the confussion matrix and stat
table(predictors = bank.predCV, actual = bank.cltest$subscribe)

# check the accuracy of the prediction
table(bank.cltest$subscribe, bank.predCV)
(3622 + 111) / (3622 + 111 + 340 + 46)

# F1 Score
bank.cvpre <- (3634) / (3634 + 34)
bank.cvrec <- (3634) / (3634 + 366)
2 * ((bank.cvpre * bank.cvrec) / (bank.cvpre + bank.cvrec))