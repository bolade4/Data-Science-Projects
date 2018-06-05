library(dplyr)
 
# 0: Load the data in RStudio
getwd()
dir("C:/Users/bolad/R/UCI HAR Dataset")
setwd("C:/Users/bolad/R/UCI HAR Dataset")
getwd()
setwd("C:/Users/bolad/R")
getwd()
rm(test)
rm(train_test)
rm(training)
rm(features)

subject_test <- read.table("C:/Users/bolad/R/UCI HAR Dataset/subject_test.txt")
x_test <- read.table("C:/Users/bolad/R/UCI HAR Dataset/X_test.txt")
y_test <- read.table("C:/Users/bolad/R/UCI HAR Dataset/y_test.txt")

subject_train <- read.table("C:/Users/bolad/R/UCI HAR Dataset/subject_train.txt")
x_train <- read.table("C:/Users/bolad/R/UCI HAR Dataset/X_train.txt")
y_train <- read.table("C:/Users/bolad/R/UCI HAR Dataset/y_train.txt")

activity_labels <- read.table("C:/Users/bolad/R/UCI HAR Dataset/activity_labels.txt")[, 2]
features <- read.table("C:/Users/bolad/R/UCI HAR Dataset/features.txt")[, 2]

glimpse(features)
features <- as.character(features)

names(x_test) <- features
names(x_train) <- features

test_data <- cbind(y_test, subject_test, x_test)
train_data <- cbind(y_train, subject_train, x_train)

names(test_data)[c(1, 2)] <- c("Activity", "Subject")
names(train_data)[c(1, 2)] <- c("Activity", "Subject")
head(test_data)


# 1: Merge data sets
subject_train_test <- rbind(subject_train, subject_test)
x_train_test <- rbind(x_train, x_test)
y_train_test <- rbind(y_train, y_test)
head(y_train_test)
str(y_train_test)


# 2: Mean and standard deviation
x_train[1:4, 1:5]
x_train_test[1:4, 1:5]

columns <- colnames(x_train_test)
columns_mean <- grep("mean\\(\\)", columns)
columns_std <- grep("std\\(\\)", columns)
x_mean_std <- x_train_test[, c(columns_mean, columns_std)]
x_mean_std[1:4, 1:6]
head(x_mean_std)
str(x_mean_std)


# 3: Add new variables
dim(activity_labels)
str(activity_labels)
View(activity_labels)
activity_label_name <- cbind(y_train_test, x_mean_std)
colnames(activity_label_name)[1] <- "ActiviyLabel"
activity_label_name[1:5, 1:6]
activity_label_name <- merge(activity_labels, activity_label_name)
colnames(activity_label_name)[1] <- "ActivityName"
activity_label_name[1:5, 1:6]


# 4: Create tidy data set
independent_tidy_set <- mutate(activity_label_name, activity_ave = mean(activity_label_name$Activiy),
          subject_ave = mean(activity_label_name$Subject))

dim(activity_label_name)
head(independent_tidy_set)

write.csv(independent_tidy_set, "tidy_data_set.csv")
