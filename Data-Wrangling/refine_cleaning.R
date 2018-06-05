# 0: Load the data in RStudio

refine <- read.csv("refine_original.csv")
head(refine)
class(refine)
dim(refine)
names(refine)
str(refine)
glimpse(refine)
tail(refine)


# 1: Clean up brand names

refine$company
refine$company <- tolower(refine$company)
head(refine)
tail(refine)
refine$company[refine$company == "phillips"] <- "philips"
refine$company[refine$company == "phllips"] <- "philips"
refine$company[refine$company == "phillps"] <- "philips"
refine$company[refine$company == "fillips"] <- "philips"
refine$company[refine$company == "ak zo"] <- "akzo"
refine$company[refine$company == "akz0"] <- "akzo"
refine$company[refine$company == "unilver"] <- "unilever"
head(refine, 15)


# 2: Separate product code and number

names(refine)
refine1 <- separate(refine, Product.code...number, c("product_code", "product_number"))
head(refine1)


# 3: Add product categories

refine2 <- mutate(refine1, product_category = product_code)
head(refine2)
refine3 <- select(refine2, company, product_code, product_category,
                  product_number:name)
refine3$product_category[refine3$product_category == "p"] <- "Smartphone"
refine3$product_category[refine3$product_category == "v"] <- "TV"
refine3$product_category[refine3$product_category == "x"] <- "Laptop"
refine3$product_category[refine3$product_category == "q"] <- "Tablet"
head(refine3, 20)


# 4: Add full address for geocoding

refine4 <- separate(refine3, address, c("street", "num"))
head(refine4)
refine5 <- unite(refine4, address, num, street, sep = " ")
refine5 <- unite(refine5, full_address, address, city, country, sep = ", ")
head(refine5)


# 5: Create dummy variables for company and product category

refine5$company <- str_replace(refine5$company, "philips", "company_philips")
refine5$company <- str_replace(refine5$company, "akzo", "company_akzo")
refine5$company <- str_replace(refine5$company, "van houten", "company_van_houten")
refine5$company <- str_replace(refine5$company, "unilever", "company_unilever")
head(refine5)
tail(refine5)

rm(refine6)

refine5$product_category <- str_replace(refine5$product_category, 
                                        "Smartphone", "product_smartphone")
refine5$product_category <- str_replace(refine5$product_category, 
                                        "TV", "product_tv")
refine5$product_category <- str_replace(refine5$product_category, 
                                        "Laptop", "product_laptop")
refine5$product_category <- str_replace(refine5$product_category, 
                                        "Tablet", "product_tablet")
head(refine5)
tail(refine5)

# Naming the clean refine data

refine_clean <- write.csv(refine5, file = "refine_clean.csv")

