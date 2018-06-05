## Project Proposal

Michael Bankole  
April 05, 2018

## A Data-Driven Approach to Predict the Success of Bank Telemarketing

### Abstract
With this project an algorithm will be written to predict the success of telemarketing calls for selling bank long-term deposits. A Portuguese retail bank was addressed, with data collected from 2008 to 2013, after the effects of a recent financial crisis.This algorithm could help campaign managers meet their specific goals.

![Fig 1: A Telemarketing View](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/telemarketing.jpg)  
Fig 1: A Telemarketing View  

### Problem

To optimize target for telemarketing within the banking or any other marketing industry is a key issue, that put the organization under a growing pressure to increase profits and reduce costs. The recent 2008 financial crisis dramatically changed the business of European banks. Especially, Portuguese banks were pressured to increase capital requirements i.e. by capturing more long term deposits because:

* They need to contact thousands of clients for telemarketing
* They could contact a client multiple times
* They have no idea if a client will be interested in the     long term deposit or not 

Under this growing pressure, the use of a decision support system (DSS) will be a valuable tool, a support client selection decisions for the Portuguese bank campaign managers. In this project, an algorithm will be developed to predict the
result of a telemarketing phone call to sell long term deposits. 

The algorithm will help predict if a customer is going to say "yes" or "no" to the long term deposit subscription. And this will help the bank campaign managers decide who to target first and more in the telemarketing. It will help bank telemarketing managers increase campaign efficiency in terms of reducing client intrusiveness and contact costs. It will also ease the pressure on them and the organization.

### Data Source and Preparation
This project uses a Portuguese banking institution direct marketing campaign dataset which can be downloaded from the UCI Machine Learning Repository as a csv file [here.](http://archive.ics.uci.edu/ml/datasets/Bank+Marketing). These marketing campaigns were based on phone calls. Basically, a client could be contacted more than one time to see if they were going to say "yes" or "no" to a bank term deposit for subscription.

The data is a multivariate dataset with 45211 instances, 21 attributes and there are several missing values in some categorical attributes, all coded with the "unknown" label. 

The data is collected from May 2008 to November 2010, with 90% of it being the training set (41188 instances) and 10% testing set (4119 instances).

The attributes are divided into five sections:

* Bank client data (age, job, marital, education, default, housing, and loan)
* Related with the last contact of the current campaign (contact, month, day_of_week, and duration)
* Other attributes (campaign, pdays, previous, and poutcome)
* Social and economic context attributes (emp.var.rate, cons.price.idx, cons.conf.idx, euribor3m, and nr.employed) and
* Output variable: desired target (y)

### Loading Dataset

```r
bank.train <- read.csv("bank-additional-full.csv", header = T, sep = ";")
bank.test <- read.csv("bank-additional.csv", header = T, sep = ";")
bank.comb <- rbind(bank.train, bank.test)
```

### Statistical Summary of the Data

```
##           File File.Size TotalCharaters TotalRow TotalColumn
## 1    Train Set 4193.1 Kb        3610377    41188          21
## 2     Test Set  428.3 Kb         361030     4119          21
## 3 Combined Set 4611.5 Kb        3971404    45307          21
```

### Dataset Limitations
Firstly, there are several missing values in some categorical attributes, all coded with the "unknown" label all coming from the bank client data attributes. Also, the pdays attribute has a large number of "999" impute (96% of the attribute) which means client was not previously contacted.

Secondly, based on some of the missing categorical attributes coded with the "unknown" label which were replaced by "NA" and outliers in some other attributes that were treated and replaced by "NA", there turn out to be some quite number of missing values with the average   age (1.1%), job(0.8%), marital(0.2%), education(4.2%), default(20.7%), housing(2.4%), loan(2.4%), contact(no missing value), month(no missing value), day_of_week(no missing value), campaign(5.8%), previous(no missing value), poutcome(no missing value), euribor3m(no missing value), subscribe(no missing value), new_pdays(no missing value), emp_var_rate(no missing value), cons_price_idx(no missing value), cons_conf_idx(1.1%) and nr_employed(no missing value). The default has the highest percentage of missing data in the dataset.

### Cleaning the Data
In order to get the dataset ready for statistical analysis and be able to build a great predictive model, it is necessary to clean and wrangle to dataset. I checked the data for typos and missing values using different methods. Some of the variable names were renamed, some were dropped while some new variables were created. I used the stringr package for doing most of the editting on the dataset. A new variable was created for the dependent variable "subscribe" as a categorical variable with the values (0 and 1) for (no and yes) and replaced the intial variable "y" a binary variable which denotes a ("yes" and "no").
So many other steps were taken in cleaning the dataset.

### Data Analysis
First the data is loaded into R and after this I will try to view the variable names, dimensions of the dataset, column names, data types of each and every variable, counting the number of missing values in the dataset and the summary of the dataset.

**Load the dataset**
<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Head and Tail of the Dataset</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> age </th>
   <th style="text-align:left;"> job </th>
   <th style="text-align:left;"> marital </th>
   <th style="text-align:left;"> education </th>
   <th style="text-align:left;"> default </th>
   <th style="text-align:left;"> housing </th>
   <th style="text-align:left;"> loan </th>
   <th style="text-align:left;"> contact </th>
   <th style="text-align:left;"> month </th>
   <th style="text-align:left;"> day_of_week </th>
   <th style="text-align:right;"> duration </th>
   <th style="text-align:right;"> campaign </th>
   <th style="text-align:right;"> pdays </th>
   <th style="text-align:right;"> previous </th>
   <th style="text-align:left;"> poutcome </th>
   <th style="text-align:right;"> emp.var.rate </th>
   <th style="text-align:right;"> cons.price.idx </th>
   <th style="text-align:right;"> cons.conf.idx </th>
   <th style="text-align:right;"> euribor3m </th>
   <th style="text-align:right;"> nr.employed </th>
   <th style="text-align:left;"> y </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 56 </td>
   <td style="text-align:left;"> housemaid </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> basic.4y </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> telephone </td>
   <td style="text-align:left;"> may </td>
   <td style="text-align:left;"> mon </td>
   <td style="text-align:right;"> 261 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191.0 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 57 </td>
   <td style="text-align:left;"> services </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> high.school </td>
   <td style="text-align:left;"> unknown </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> telephone </td>
   <td style="text-align:left;"> may </td>
   <td style="text-align:left;"> mon </td>
   <td style="text-align:right;"> 149 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191.0 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:left;"> services </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> high.school </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> yes </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> telephone </td>
   <td style="text-align:left;"> may </td>
   <td style="text-align:left;"> mon </td>
   <td style="text-align:right;"> 226 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191.0 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 40 </td>
   <td style="text-align:left;"> admin. </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> basic.6y </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> telephone </td>
   <td style="text-align:left;"> may </td>
   <td style="text-align:left;"> mon </td>
   <td style="text-align:right;"> 151 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191.0 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 56 </td>
   <td style="text-align:left;"> services </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> high.school </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> yes </td>
   <td style="text-align:left;"> telephone </td>
   <td style="text-align:left;"> may </td>
   <td style="text-align:left;"> mon </td>
   <td style="text-align:right;"> 307 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191.0 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:left;"> services </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> basic.9y </td>
   <td style="text-align:left;"> unknown </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> telephone </td>
   <td style="text-align:left;"> may </td>
   <td style="text-align:left;"> mon </td>
   <td style="text-align:right;"> 198 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191.0 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 45302 </td>
   <td style="text-align:right;"> 31 </td>
   <td style="text-align:left;"> admin. </td>
   <td style="text-align:left;"> single </td>
   <td style="text-align:left;"> university.degree </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> yes </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> cellular </td>
   <td style="text-align:left;"> nov </td>
   <td style="text-align:left;"> thu </td>
   <td style="text-align:right;"> 463 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 93.200 </td>
   <td style="text-align:right;"> -42.0 </td>
   <td style="text-align:right;"> 4.076 </td>
   <td style="text-align:right;"> 5195.8 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 45303 </td>
   <td style="text-align:right;"> 30 </td>
   <td style="text-align:left;"> admin. </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> basic.6y </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> yes </td>
   <td style="text-align:left;"> yes </td>
   <td style="text-align:left;"> cellular </td>
   <td style="text-align:left;"> jul </td>
   <td style="text-align:left;"> thu </td>
   <td style="text-align:right;"> 53 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.4 </td>
   <td style="text-align:right;"> 93.918 </td>
   <td style="text-align:right;"> -42.7 </td>
   <td style="text-align:right;"> 4.958 </td>
   <td style="text-align:right;"> 5228.1 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 45304 </td>
   <td style="text-align:right;"> 39 </td>
   <td style="text-align:left;"> admin. </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> high.school </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> yes </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> telephone </td>
   <td style="text-align:left;"> jul </td>
   <td style="text-align:left;"> fri </td>
   <td style="text-align:right;"> 219 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.4 </td>
   <td style="text-align:right;"> 93.918 </td>
   <td style="text-align:right;"> -42.7 </td>
   <td style="text-align:right;"> 4.959 </td>
   <td style="text-align:right;"> 5228.1 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 45305 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:left;"> student </td>
   <td style="text-align:left;"> single </td>
   <td style="text-align:left;"> high.school </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> cellular </td>
   <td style="text-align:left;"> may </td>
   <td style="text-align:left;"> mon </td>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> failure </td>
   <td style="text-align:right;"> -1.8 </td>
   <td style="text-align:right;"> 92.893 </td>
   <td style="text-align:right;"> -46.2 </td>
   <td style="text-align:right;"> 1.354 </td>
   <td style="text-align:right;"> 5099.1 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 45306 </td>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:left;"> admin. </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> high.school </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> cellular </td>
   <td style="text-align:left;"> aug </td>
   <td style="text-align:left;"> fri </td>
   <td style="text-align:right;"> 528 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.4 </td>
   <td style="text-align:right;"> 93.444 </td>
   <td style="text-align:right;"> -36.1 </td>
   <td style="text-align:right;"> 4.966 </td>
   <td style="text-align:right;"> 5228.1 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 45307 </td>
   <td style="text-align:right;"> 34 </td>
   <td style="text-align:left;"> management </td>
   <td style="text-align:left;"> single </td>
   <td style="text-align:left;"> high.school </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> yes </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> cellular </td>
   <td style="text-align:left;"> nov </td>
   <td style="text-align:left;"> wed </td>
   <td style="text-align:right;"> 175 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 93.200 </td>
   <td style="text-align:right;"> -42.0 </td>
   <td style="text-align:right;"> 4.120 </td>
   <td style="text-align:right;"> 5195.8 </td>
   <td style="text-align:left;"> no </td>
  </tr>
</tbody>
</table></div>

### Analysing Subscription Rate
Considering the features of the dataset, it is highly recommended to consider the distinction rate between the two levels of subscription of the bank customers whether they say yes or no to the bank term deposit.

I will like to explore the relationship between some of the features and subscription below.

**Age, Education and Subscription Relationship**
![AgeEducationandSubscription](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/AgeEducationandSubscription.PNG)<!-- -->

The facet histogram above shows the relationship between age, education and subscription rate to the bank term deposit. From this graph, it could be noted that non of those in the illiterate class is afected by the bank term subscription and this can help our further analysis.

**Age, Job, Marital status, Previous, Subscription Relationship**
![eda1](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/eda1.PNG)<!-- -->

The scatter plot above shows the subscription rate of the customer based on their age, job, marital status and how many times a particular customer has been contacted before this campaign. If a customer has been contated before this campaign, it shows there's been a relationship between such customer and the bank before this campaign else this campaign will be pulling them together into business for the first time. As we can see from te graph, some quite lot of customers that has not been contacted before this campaign (previous = 0) will also be interested in the bank term and they will say yes. This graph shows another useful features for this analysis. The plot shows the relationship between age, job, marital status, previous and subscribe.

### Missing values
Several methods were used to check for missing values in the dataset. There is a lot of unknown values in the dataset. They were all turned into NA's because almost all the variables with unknown values are important for the modelling.

### Outliers
Several methods were used to detect outliers in this dataset.
For the outliers, one of the methods used is Cooks distance to detect all of the outliers in the dataset. I wrote a function that detect the outliers using the Tukey rules on quartiles +/- 1.5 IQR and once outliers are detected from any variable. It ask if I will like for it to delete the outliers and turn them to NA's. Once I hit the "Y" button my keyboard, it will turn them to NA's and give me a new summary of the variable with the mean of the variable before detecting the outliers and the new mean after deleting the outliers. If hit any other button on my keyboard, the function will do nothing to the outliers. Actually, all the outliers were deleted and turned into NA's. I illustrated on one of the variables (Age) outliers below: 

**Using Cooks Distance method to detect all outliers in the dataset**

![Cooks Distance](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/Cooks_distance.PNG)<!-- -->

**Viewing the influential row numbers**
<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Head of outliers in the dataset</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> age </th>
   <th style="text-align:left;"> job </th>
   <th style="text-align:left;"> marital </th>
   <th style="text-align:left;"> education </th>
   <th style="text-align:left;"> default </th>
   <th style="text-align:left;"> housing </th>
   <th style="text-align:left;"> loan </th>
   <th style="text-align:left;"> contact </th>
   <th style="text-align:left;"> month </th>
   <th style="text-align:left;"> day_of_week </th>
   <th style="text-align:right;"> campaign </th>
   <th style="text-align:right;"> pdays </th>
   <th style="text-align:right;"> previous </th>
   <th style="text-align:left;"> poutcome </th>
   <th style="text-align:right;"> emp.var.rate </th>
   <th style="text-align:right;"> cons.price.idx </th>
   <th style="text-align:right;"> cons.conf.idx </th>
   <th style="text-align:right;"> euribor3m </th>
   <th style="text-align:right;"> nr.employed </th>
   <th style="text-align:right;"> subscribe </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 76 </td>
   <td style="text-align:right;"> 41 </td>
   <td style="text-align:left;"> blue-collar </td>
   <td style="text-align:left;"> divorced </td>
   <td style="text-align:left;"> basic.4y </td>
   <td style="text-align:left;"> unknown </td>
   <td style="text-align:left;"> yes </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> telephone </td>
   <td style="text-align:left;"> may </td>
   <td style="text-align:left;"> mon </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 84 </td>
   <td style="text-align:right;"> 49 </td>
   <td style="text-align:left;"> entrepreneur </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> university.degree </td>
   <td style="text-align:left;"> unknown </td>
   <td style="text-align:left;"> yes </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> telephone </td>
   <td style="text-align:left;"> may </td>
   <td style="text-align:left;"> mon </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 89 </td>
   <td style="text-align:right;"> 49 </td>
   <td style="text-align:left;"> technician </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> basic.9y </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> telephone </td>
   <td style="text-align:left;"> may </td>
   <td style="text-align:left;"> mon </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 130 </td>
   <td style="text-align:right;"> 41 </td>
   <td style="text-align:left;"> technician </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> professional.course </td>
   <td style="text-align:left;"> unknown </td>
   <td style="text-align:left;"> yes </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> telephone </td>
   <td style="text-align:left;"> may </td>
   <td style="text-align:left;"> mon </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 183 </td>
   <td style="text-align:right;"> 42 </td>
   <td style="text-align:left;"> blue-collar </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> basic.9y </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> yes </td>
   <td style="text-align:left;"> yes </td>
   <td style="text-align:left;"> telephone </td>
   <td style="text-align:left;"> may </td>
   <td style="text-align:left;"> mon </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 287 </td>
   <td style="text-align:right;"> 39 </td>
   <td style="text-align:left;"> housemaid </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> basic.9y </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> yes </td>
   <td style="text-align:left;"> no </td>
   <td style="text-align:left;"> telephone </td>
   <td style="text-align:left;"> may </td>
   <td style="text-align:left;"> mon </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 999 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> nonexistent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table></div>

### Data Explotration Continued
After the data is cleaned and ready for anylysis, the below  show the distributions plot, the density plot for some of the variables and the strip plot of the cleaned dataset:

**Distribution of the final dataset**
** The continuous variables**
![eda3](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/eda3.PNG)<!-- -->

**The categorical variables**

```
## Warning: attributes are not identical across measure variables;
## they will be dropped
```

![eda4](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/eda4.PNG)<!-- -->

**The density plot**
![eda5](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/eda5.PNG)<!-- -->

**The strip plot**
![eda6](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/eda6.PNG)<!-- -->


### Correlations
**Combining correlogram with the significance test**
I used a custom R function to compute the matrix of p-value. From the plot below, correlations with p-value > 0.01 are considered insignificant. Note: From the plot, correlation coefficient values are crossed in the first cor graph and left blank in the second.

**Computing the p-value of correlations**
<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Head of the p-value matrix</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> age </th>
   <th style="text-align:right;"> campaign </th>
   <th style="text-align:right;"> previous </th>
   <th style="text-align:right;"> euribor3m </th>
   <th style="text-align:right;"> new_pdays </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> age </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.4615024 </td>
   <td style="text-align:right;"> 0.7669422 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.2656217 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> campaign </td>
   <td style="text-align:right;"> 0.4615024 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> previous </td>
   <td style="text-align:right;"> 0.7669422 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> euribor3m </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> new_pdays </td>
   <td style="text-align:right;"> 0.2656217 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> emp_var_rate </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0.0000000 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
</tbody>
</table></div>

**Add significance level to the correlogram**
correlation coefficient values are crossed right here.
![eda7](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/eda7.PNG)<!-- -->

**Left blank on no significant coefficient**
correlation coefficient values are left blank here.
![eda8](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/eda8.PNG)<!-- -->

**Correlation graph with histogram using the spearman method**
![eda9](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/eda9.PNG)<!-- -->

### Analysis Approach
For this project, machine learning will be used to build a predictive model. Four binary classification data minning (DM) models will be tested: logistic regression (LR), decision trees (DTs), rpart (CART) and random forest (RF). Also, a cross validation method will be used on the rpart in building this model.

The LR is a choice people like to use which operates a smooth nonlinear logistic transformation over a multiple regression model and it allows the estimation of class probabilities. The DT is a branching structure that represents a set of rules, it distinguish values in a hierarchical form. The DT representation can be translated into a set of IF – THEN rules, that could be understood easily. The CART programs are used to build classification or regression models of a very general structure that uses a two stage procedure. The resulting models can also be represented in binary trees. RF are an ensemble learning method for classification, regression and other tasks. They operate by constructing a multitude of decision trees at training time and outputting the class which are the mode of the classes or mean prediction.

Some of the variables are not correlated while some have high correlation which will be used in the logistic regression model, in other word, not all variables will be used for the logistic regression medel.

### References
1. [Moro et al., 2014] S. Moro, P. Cortez and P. Rita. A  Data-Driven Approach to Predict the Success of Bank Telemarketing. Decision Support Systems, Elsevier, 62:22-31, June 2014
2. S. Moro, R. Laureano and P. Cortez. Using Data Mining for Bank Direct Marketing: An Application of the CRISP-DM Methodology. In P. Novais et al. (Eds.), Proceedings of the European Simulation and Modelling Conference - ESM'2011, pp. 117-121, Guimaraes, Portugal, October, 2011. EUROSIS.
