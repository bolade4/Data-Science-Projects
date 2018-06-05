## A Data Driven Approach to Predict the Success of Bank Telemarketing

Michael Bankole  
April 05, 2018

### Abstract
With this project an algorithm will be written to predict the success of telemarketing calls for selling bank long-term deposits. A Portuguese retail bank was addressed, with data collected from 2008 to 2013, after the effects of a recent financial crisis. This algorithm could help campaign managers meet their specific goals.

![Fig 1: A Telemarketing View](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/telemarketing.jpg)  
Fig 1: A Telemarketing View

### Problem

To optimize target for telemarketing within the banking or any other marketing industry is a key issue that put the organization under a growing pressure to increase profits and reduce costs. The recent 2008 financial crisis dramatically changed the business of European banks. Especially, Portuguese banks were pressured to increase capital requirements i.e. by capturing more long term bank deposits because:

* They need to contact thousands of clients for telemarketing
* They could or need to contact a client multiple times
* They have no idea if a client will be interested in the long term deposit or not 

Under this growing pressure, the use of a decision support system (DSS) will be a valuable tool, a support client selection decisions for the Portuguese bank campaign managers. In this project, an algorithm will be developed to predict the result of a telemarketing phone call of clients who will be interested in buying the long term deposit. 

The algorithm will help predict if a customer is going to say "yes" or "no" to the long term deposit subscription. And this will help the bank campaign managers decide who to target first and more in the telemarketing campaign. It will help bank telemarketing managers increase campaign efficiency in terms of reducing client intrusiveness and contact costs. It will also ease the pressure on them and the organization.

### Data Source and Preparation
This project uses a Portuguese banking institution direct marketing campaign dataset which can be downloaded from the UCI Machine Learning Repository as a csv file [here.](http://archive.ics.uci.edu/ml/datasets/Bank+Marketing). This marketing campaign was based on phone calls. Basically, a client could be contacted more than one time to see if they were going to say "yes" or "no" to the bank term deposit subscription.

The data is a multivariate dataset with 45211 instances, 21 attributes and there are several missing values in some categorical attributes, all coded with the "unknown" label. 

The data is collected from May 2008 to November 2010, with 90% of it being the training set (41188 instances) and 10% testing set (4119 instances).

The attributes are divided into five sections:

* Bank client data attributes (age, job, marital, education, default, housing, and loan)
* Related with the last contact of the current campaign attributes (contact, month, day_of_week, and duration)
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
             File File.Size TotalCharaters TotalRow TotalColumn
## 1    Train Set 4193.1 Kb        3610377    41188          21
## 2     Test Set  428.3 Kb         361030     4119          21
## 3 Combined Set 4611.5 Kb        3971404    45307          21
```

### Dataset Limitations
Firstly, I dropped the feature "duration" from the dataset because I want to build a realistic predictive model. The feature "duration" from the dataset means last contact duration, it is in seconds (numeric). Important note:  this attribute highly affects the output target (e.g., if duration = 0 then subscribe = "no") meaning there was no contact. Yet, the duration is not known before a call is performed. Also, after the end of the call, subscription (if a client says yes or no) is obviously known. Thus, this input was only included for a benchmark purpose and was discarded from the cleaned (final) dataset in order to have a realistic predictive model.

Secondly, there are several missing values in some categorical attributes, all coded with the "unknown" label and all coming from the bank client data attributes. Also, the pdays attribute has a large number of "999" impute (96% of the attribute) which means client was not previously contacted.

Lastly, based on some of the missing categorical attributes coded with the "unknown" label which were replaced by "NA" and outliers in some other attributes that were treated and replaced by "NA", there turn out to be some quite number of missing values with the average;   age (1.1%), job (0.8%), marital (0.2%), education (4.2%), default (20.7%), housing (2.4%), loan (2.4%), contact (no missing value), month (no missing value), day_of_week (no missing value), campaign (5.8%), previous (no missing value), poutcome (no missing value), euribor3m (no missing value), subscribe (no missing value), new_pdays (no missing value), emp_var_rate (no missing value), cons_price_idx (no missing value), cons_conf_idx (1.1%) and nr_employed (no missing value). The default has the highest percentage of missing data in the dataset.

### Cleaning the Data
In order to get the dataset ready for statistical analysis and be able to build a great predictive model, it is necessary to clean and wrangle the dataset. Therefore, I checked the data for typos and missing values using different methods. Some of the variable names were renamed, some were dropped while some new variables were created. I used the stringr package for doing most of the editting on the dataset. A new variable was created for the dependent variable called "subscribe", it is a categorical variable with the values (0 and 1) for (no and yes) and it replaced the intial variable "y" a binary variable which denotes the final outcome of the campaign, if a client subscribe or not ("yes" and "no"). 

So many other steps were taken in cleaning the dataset i.e. Some of the column names were cleaned to make it simple and descriptive. Also, some of the row names were not tidy, this was cleaned up as well using the stringr. After cleaning the obvious typos in the dataset, several methods were used to check if there could be any left in the data but there was non.

### Data Analysis
First, the data is loaded into R and after this I will try to view the variable names, dimensions of the dataset, column names, data types of each and every variable, counting the number of missing values in the dataset if there's any, and the summary of the dataset.

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
![unnamed-chunk-4-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-4-1.png)<!-- -->

The facet histogram above shows the relationship between age, education and subscription rate to the bank term deposit. From this graph, it could be denoted that non of those in the illiterate class is affected by the bank term subscription and this can help our further analysis.

**Age, Job, Contact, Subscription Relationship**
![unnamed-chunk-5-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-5-1.png)<!-- -->

From the scatter plot above, a padering could be viewed that more of those been contacted throgh cellular tend to subscribe to the bank term than those been contated through telephone even though the distribution between these two means of contact is kind of even. These features could also be useful in the analysis. This facet shows the relationship between age, job, contact and subscribe.

**Age, Job, Marital status, Previous, Subscription Relationship**
![unnamed-chunk-6-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-6-1.png)<!-- -->

The scatter plot above shows the subscription rate of the customer based on their age, job, marital status and how many times a particular customer has been contacted before this campaign. If a customer has been contated before this campaign, it shows there's been a relationship between such customer and the bank before this campaign else this campaign will be pulling them together into business for the first time. As we can see from te graph, some quite lot of customers that has not been contacted before this campaign (previous = 0) will also be interested in the bank term and they will say yes. This graph shows another useful features for this analysis. The plot shows the relationship between age, job, marital status, previous and subscribe.

### Missing values
Based on the discription of the dataset, several methods were used to check for missing values in the dataset. There are a lot of unknown values in the dataset. They were all turned into NA's because almost all the variables with unknown values are important for the modelling.

### Outliers
Several methods were used to detect outliers in this dataset.
Doing this, one of the methods used is Cooks distance to detect all of the outliers in the dataset. Using a Cook's distance is very important because it collectively consider the features that matter in a dataset, it doesn't just declare an observation as an outlier based on a just one rather unimportant feature which could lead to unrealistic inferences. Cook’s distance is a measure computed with respect to a given regression model and therefore is impacted only by the X variables included in the model. In other word, it computes the influence exerted by each data point (row) on the predicted outcome.
Mathematically, cook’s distance Di for observation i is computed as:

![](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/Cooks_form.PNG)<!-- -->

**Using Cooks Distance method to detect all outliers in the dataset**
![unnamed-chunk-8-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-8-1.png)<!-- -->

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

**The continuous variables**
![unnamed-chunk-9-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-9-1.png)<!-- -->

**The categorical variables**
![unnamed-chunk-10-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-10-1.png)<!-- -->

**The density plot**
![unnamed-chunk-11-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-11-1.png)<!-- -->

**The strip plot**
![unnamed-chunk-12-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-12-1.png)<!-- -->

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
![unnamed-chunk-14-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-14-1.png)<!-- -->

**Left blank on no significant coefficient**
correlation coefficient values are left blank here.
![unnamed-chunk-15-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-15-1.png)<!-- -->

**Correlation graph with histogram using the spearman method**
![unnamed-chunk-16-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-16-1.png)<!-- -->

## Models
## Machine Learning Technique
Machine learning was used to write an algorithm in creating a predictive model for this analysis. Moreover this project is based on a supervised problem. It is a classification problem as the outcome variable is binary. Four binary classification data minning (DM) models was used to build a predictive model: logistic regression (LR), decision trees (DTs), rpart (CART) and random forest (RF). Also, a cross validation method was used on the rpart in building this model.

## Model Features
**For this model, the main features are:** 
<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Model Main Features</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Model Variables </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> age </td>
  </tr>
  <tr>
   <td style="text-align:left;"> job </td>
  </tr>
  <tr>
   <td style="text-align:left;"> marital </td>
  </tr>
  <tr>
   <td style="text-align:left;"> education </td>
  </tr>
  <tr>
   <td style="text-align:left;"> default </td>
  </tr>
  <tr>
   <td style="text-align:left;"> housing </td>
  </tr>
  <tr>
   <td style="text-align:left;"> loan </td>
  </tr>
  <tr>
   <td style="text-align:left;"> contact </td>
  </tr>
  <tr>
   <td style="text-align:left;"> month </td>
  </tr>
  <tr>
   <td style="text-align:left;"> day_of_week </td>
  </tr>
  <tr>
   <td style="text-align:left;"> campaign </td>
  </tr>
  <tr>
   <td style="text-align:left;"> previous </td>
  </tr>
  <tr>
   <td style="text-align:left;"> poutcome </td>
  </tr>
  <tr>
   <td style="text-align:left;"> euribor3m </td>
  </tr>
  <tr>
   <td style="text-align:left;"> new_pdays </td>
  </tr>
  <tr>
   <td style="text-align:left;"> emp_var_rate </td>
  </tr>
  <tr>
   <td style="text-align:left;"> cons_price_idx </td>
  </tr>
  <tr>
   <td style="text-align:left;"> cons_conf_idx </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nr_employed </td>
  </tr>
  <tr>
   <td style="text-align:left;"> subscribe </td>
  </tr>
</tbody>
</table></div>

**For the LR, the following features are used:**
<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Logistic Regression Features</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Logistic Regression Variables </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> job </td>
  </tr>
  <tr>
   <td style="text-align:left;"> education </td>
  </tr>
  <tr>
   <td style="text-align:left;"> contact </td>
  </tr>
  <tr>
   <td style="text-align:left;"> month </td>
  </tr>
  <tr>
   <td style="text-align:left;"> day_of_week </td>
  </tr>
  <tr>
   <td style="text-align:left;"> poutcome </td>
  </tr>
  <tr>
   <td style="text-align:left;"> new_pdays </td>
  </tr>
  <tr>
   <td style="text-align:left;"> emp_var_rate </td>
  </tr>
  <tr>
   <td style="text-align:left;"> cons_price_idx </td>
  </tr>
  <tr>
   <td style="text-align:left;"> cons_conf_idx </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nr_employed </td>
  </tr>
</tbody>
</table></div>

For the DTs, CART and RF all the of the features were thrown into the algorithm to build the models. 

### Training and Testing Sets
The data is a multivariate dataset with 45211 instances, 21 attributes. It is collected from May 2008 to November 2010, with 90% of it being the training set (41188 instances) and 10% testing set (4119 instances). The training data is used for feature and model
selection. The test data is used for measuring the prediction capabilities of the selected data-driven model. Each record included the output target ("no" or "yes"), the contact outcome (“failure” or “success”), and customer's input features. These include: 
bank client data (e.g., age), related with the last contact of the current campaign (e.g., contact), and other attributes (e.g., campaign). These records were enriched with social and economic influence features (e.g., employment variation rate), by gathering external data from the central bank of the Portuguese
Republic statistical website.

### Logistic Regression (LR)
The LR is a choice people like to use which operates a smooth nonlinear logistic transformation over a multiple regression model and it allows the estimation of class probabilities.
For this model, only 11 of the features are important for the analysis. For this analysis, a threshold of 0.2 was used, after using two different methods for picking a threshold that can be seen below:

**Picking a threshold statistically**

```r
my.roc <- roc(bank.cltrain$subscribe, bank.preTrain)
coords(my.roc, "best", ret = "threshold")
```

```
## [1] 0.1550556
```

**Picking a threshold graphically using the ROC curve**
![unnamed-chunk-20-2.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-20-2.png)<!-- -->

After picking a treshold of 0.2 and running the test dataset on the predictive model, I got an error rate of 13% and an acurracy rate of 87%. I got an AUC of 78% and an F1 Score of 93%.

### Decision Trees (DTs)
The DT is a branching structure that represents a set of rules, it distinguish values in a hierarchical form. The DT representation can be translated into a set of IF – THEN rules, that could be understood easily.
For this model all of the features were thrown into the algorithm. The trees can be viewed below, but kind of clumsy due to the large dataset.

**Decision Tree**
![unnamed-chunk-21-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-21-1.png)<!-- -->

The DTs improved the model compared to the LG and after running the testing set on the model, I got an error rate of 10% and an accuracy rate of 90%. I got an F1 Score of 95%.

###  Rpart (CART)
The CART programs are used to build classification or regression models of a very general structure that uses a two stage procedure. The resulting models can also be represented in binary trees. 
For this model all of the features were thrown into the algorithm. The trees can be viewed below which gives a better view than the DTs.

**CART Tree**
![unnamed-chunk-22-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-22-1.png)<!-- -->

**ROC curve**
![unnamed-chunk-23-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-23-1.png)<!-- -->

This got a slight improvement on the DTs and after running the testing set on the model, I got an error rate of 9% and an accuracy rate of 91%. I got an AUC of 72% and an F1 Score of 95% which is same as the DTs F1 Score.

### Random Forest (RF)
RF are an ensemble learning method for classification, regression and other tasks. They operate by constructing a multitude of decision trees at training time and outputting the class which are the mode of the classes or mean prediction.
For this model all of the features were thrown into the algorithm. The feature importance can be viewed below:

**Below is the feature importance for random forest.**
![unnamed-chunk-24-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-24-1.png)<!-- -->

For this model, the mtry was tuned to get a perfect mtry and ntree, which help in not overfitting in building the model.

**Number of Tree Nodes**
![unnamed-chunk-25-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-25-1.png)<!-- -->

This model present the best accuracy rate and it is better than the other three. With this model, I got an error rate of 5% and an accuracy rate of 95%. I got an F1 Score of 97%.

### Cross Validation
This is a model validation technique for assessing how the results of a statistical analysis will generalize to an independent data set. I used a 10-fold cross validation on the rpart and perfectly got an error of 9% and an accuracy of 91%. Also, an F1 Score of 95%. 
 
## Metric
All models were built in R. Using a simple baseline method to check the accuracy of the model with the training set, we get 89% accuracy. This is the accuracy I want my model to beat and I have used some metrics to check the accuracy of the models I built using the testing set. For this project I will be using two metric to validate the accuracy of my models and below is a comparison of the models using the two different metrics. First, the accuracy performance measure and second, the F1 Score.

Accuracy - Accuracy is the most instinctive performance measure. It's simply a ratio of correctly predicted observation to the total observations. Accuracy is a great measure but only when you have symmetric datasets where values of false positive and false negatives are almost same. In this case it is not so, therefore, I have to look at other parameter (F1 Score) to evaluate the performance of my model.

Accuracy = (TP + TN) / (TP + FP + FN + TN)

F1 score - F1 Score is the weighted average of Precision and Recall. Therefore, this score takes both false positives and false negatives into account. F1 is usually more useful than accuracy, especially if you have an uneven class distribution. Accuracy works best if false positives and false negatives have similar values. If the value of false positives and false negatives are very different, it’s better to look at both Precision and Recall. 

F1 Score = 2 * (Recall * Precision) / (Recall + Precision)

Precision - Precision is the ratio of correctly predicted positive observations to the total predicted positive observations. The question that this metric answer is of all clients that subscribe to the bank term, how many actually subscribed? High precision relates to the low false positive rate.

Precision = TP / (TP + FP)

Recall (Sensitivity) - Recall is the ratio of correctly predicted positive observations to the all observations in actual class - yes. The question recall answers is: Of all the clients that truly subscribed, how many say yes? 

Recall = TP / (TP + FN)

<div style="border: 1px solid #ddd; padding: 5px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">

**Metric Comparison**
 <thead>
  <tr>
   <th style="text-align:left;"> Metric </th>
   <th style="text-align:right;"> LR </th>
   <th style="text-align:right;"> DT </th>
   <th style="text-align:right;"> CART </th>
   <th style="text-align:right;"> RF </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> APM (%) </td>
   <td style="text-align:right;"> 0.8711 </td>
   <td style="text-align:right;"> 0.9039 </td>
   <td style="text-align:right;"> 0.9053 </td>
   <td style="text-align:right;"> 0.9493 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> F1 Score (%) </td>
   <td style="text-align:right;"> 0.9261 </td>
   <td style="text-align:right;"> 0.9481 </td>
   <td style="text-align:right;"> 0.9478 </td>
   <td style="text-align:right;"> 0.9719 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Num of Features </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 19 </td>
  </tr>
</tbody>
</table></div>

The RF presented the best results (APM = 95% and F1 Score = 97%). Therefore, the proposed method is the random forest which provides the highest rate of accuracy than others.

### Ideas for further research
* This models could be improved on by doing some further feature engineering on the dataset. i.e. categorizing the age, also, reducing or merging up some of the education categories e.t.c.
* Also, some other different types of models and analysis could also be explored. Although the models used here are quite interesting and they all improved on the base line model but there are some more other algorithms in machine learning that could be explored that may better explain the relationships within the data and maybe build a better model using different feature combinations or algorithm parameters.
* Some of the features in this dataset could be worth more exploring. The social and economic context attributes are very esential to the models and they could be further analysed and using rpart tree, this could help do some further analysis on these variables that are essential in the dataset.
* New valuable knowledge could also be possibly provided to improve model accuracy.

### Recommendations 
* Bank campaign managers will be advised to first target only the most likely buyers of the long term deposits based on the model prediction. This model will help create value for the bank telemarketing managers by improving campaign efficiency, reducing client intrusiveness and contact costs.
* Bank campaign managers will be advised based on the decision tree, using a sensitivity analysis, ranking the input attributes and showing the average effect of the most relevant features. i.e.learning the CART model responses with a low error rate and allowing the extraction of decision rules that are easy to interpret.
* Bank campaign managers will be advised to focus on the top ten RF important variables based on the sensitivity analysis results which could help them know and understand how to relate with each customer they will be selling the bank term deposit to, leading to more success in the campaign.

### Conclusion
Using machine learning could help reduce pressure and increase efficiency in telemarketing. Banking industry have been under a huge pressure of meeting and optimizing target. And contacting tens of thousands of customers within a short targeted time can put the campaign managers and the organization under unnecessary pressure.Portuguese banks were pressured to increase capital requirements i.e. by capturing more long term deposits. Based on this, the use of machine learning to build a predictive model to predict the result of a telemarketing phone call to sell long term deposits will be valuable to support client selection decisions for bank campaign managers. It will help the Portuguese bank to have a campaign efficiency improvement i.e. reducing pressure, reducing client intrusiveness, and being cost effective. It could help achieve more success  when compared with the based bank practice. Moreover, some predictive models have been built with the RF presenting the best result which could be used to achieve these.

### References
1. [Moro et al., 2014] S. Moro, P. Cortez and P. Rita. A  Data-Driven Approach to Predict the Success of Bank Telemarketing. Decision Support Systems, Elsevier, 62:22-31, June 2014
2. S. Moro, R. Laureano and P. Cortez. Using Data Mining for Bank Direct Marketing: An Application of the CRISP-DM Methodology. In P. Novais et al. (Eds.), Proceedings of the European Simulation and Modelling Conference - ESM'2011, pp. 117-121, Guimaraes, Portugal, October, 2011. EUROSIS.
