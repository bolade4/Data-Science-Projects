rm(titanic_gender, titanic_test, titanic_train, Titanic)
rm(titanic)

# 0: Load the data in RStudio
Titanic <- read.csv("titanic_original.csv")
head(Titanic)
class(Titanic)


# 1: Port of embarkation
is.na(Titanic$embarked)
any(is.na(Titanic$embarked))
summary(Titanic$embarked)
head(Titanic$embarked)
glimpse(Titanic)

Titanic$embarked <- as.character(Titanic$embarked)
is.na(Titanic$embarked)
summary(Titanic$embarked)
!complete.cases(Titanic$embarked)
head(Titanic$embarked, 20)
tail(Titanic$embarked, 20)

str_detect(Titanic$embarked, "")
str_detect(Titanic$embarked, "NA")
Titanic$embarked[Titanic$embarked == ""] <- "S"
tail(Titanic$embarked, 20)
str_detect(Titanic$embarked, "")
summary(Titanic$embarked)
Titanic$embarked


# 2: Age
rm(Titanic1)
head(Titanic$age, 20)
any(is.na(Titanic$age))
summary(Titanic$age)
sum(is.na(Titanic$age))

glimpse(Titanic)
mean_na <- mean(na.omit(Titanic$age))
mean_na
Titanic$age[is.na(Titanic$age)] <- mean_na
summary(Titanic$age)
head(Titanic)
tail(Titanic$age, 30)


# 3: Lifeboat
head(Titanic$boat)
Titanic$boat <- as.character(Titanic$boat)
summary(Titanic$boat)
glimpse(Titanic$boat)
Titanic$boat[Titanic$boat == ""] <- "None"
tail(Titanic$boat, 20)


# 4: Cabin
tail(Titanic$cabin)
head(Titanic$cabin)
 "Yes it is necessary"
 "It means some poeple were not in any cabin"

Titanic$cabin <- as.character(Titanic$cabin)
summary(Titanic$cabin)
glimpse(Titanic)

Titanic <- mutate(Titanic, has_cabin_number = ifelse(Titanic$cabin == "", "0", "1"))


# 5: Submit the project on Github
write.csv(Titanic, "titanic_clean.csv")

