## Project Proposal

Michael Bankole  
April 05, 2018

## A Data-Driven Approach to Predict the Success of Bank Telemarketing

### Abstract
With this project an algorithm will be written to predict the success of telemarketing calls for selling bank long-term deposits. A Portuguese retail bank was addressed, with data collected from 2008 to 2013, after the effects of a recent financial crisis.This algorithm could help campaign managers meet their specific goals.

![Fig 1: A Telemarketing View](https://github.com/bolade4/Data-Science-Projects/blob/master/A-Data-Driven-Approach-to-Predict-the-Success-of-Bank-Telemarketing/images/telemarketing.jpg)  
Fig 1: A Telemarketing View

### Problem

To optimize target for telemarketing within the banking or any other marketing industry is a key issue, that put the organization under a growing pressure to increase profits and reduce costs. The recent 2008 financial crisis dramatically changed the business of European banks. Especially, Portuguese banks were pressured to increase capital requirements i.e. by capturing more long term deposits because:

* They need to contact thousands of clients for telemarketing
* They could contact a client multiple times
* They have no idea if a client will be interested in the     long term deposit or not 

Under this growing pressure, the use of a decision support system (DSS) will be a valuable tool, a support client selection decisions for the Portuguese bank campaign managers. In this project, an algorithm will be developed to predict the
result of a telemarketing phone call to sell long term deposits. 

The algorithm will help predict if a customer is going to say "yes" or "no" to the long term deposit subscription. And this will help the bank campaign managers decide who to target first and more in the telemarketing. It will help bank telemarketing managers increase campaign efficiency in terms of reducing client intrusiveness and contact costs. It will also ease the pressure on them and the organization.

### Data
In this project the data related with direct marketing campaigns of a Portuguese banking institution will be used. These marketing campaigns were based on phone calls. Basically, a client could be contacted more than one time to see if they were going to say "yes" or "no" to a bank term deposit for subscription.

The data is a multivariate dataset with 45211 instances, 21 attributes and there are several missing values in some categorical attributes, all coded with the "unknown" label. 

The data collected from from May 2008 to November 2010, with 90% of it being the training set (41188 instances) and 10% testing set (4119 instances).

You can download the data as a csv file [here.](http://archive.ics.uci.edu/ml/datasets/Bank+Marketing)

The attributes are divided into four sections:

* Bank client data
* Related with the last contact of the current campaign
* Other attributes and
* Social and economic context attributes

<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Below is the head and the tail of the dataset</caption>
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

### Modelling Approach
One of the main challenges in analyzing this data is that, it has a huge number of unknown data. This was treated using imputation techniques. 

Some kind of featured engineering was performed analysing the pdays based on this figure (numeric; 999 means client was not previously contacted). pdays is one of the important variables in this project. 

The fact remains that a supervised classification algorithm is a perfect choice to build the predictive model for this project but the dependent variable (y) is a binary in the character form ("yes", "no"). This was treated and analyzed as a categorical variable in the form ("0", "1") for both no and yes respectively and also predict the probability of each class.

Lastly, for different modelling approaches were developed for this analysis (Logistic Regression, Decision Tree, Rpart and Random Forest). The random forest gives the best accuracy.

### Deliverables
The deliverables include:

* All R codes used in this analysis from loading the data into R to predicting the analysis.
* Also, a report and a presentation on the project and the client can implement the algorithm with future dataset (test set)
* All that are mentioned above will be made available on the project's Github repository.

### References
1. [Moro et al., 2014] S. Moro, P. Cortez and P. Rita. A  Data-Driven Approach to Predict the Success of Bank Telemarketing. Decision Support Systems, Elsevier, 62:22-31, June 2014
2. S. Moro, R. Laureano and P. Cortez. Using Data Mining for Bank Direct Marketing: An Application of the CRISP-DM Methodology. In P. Novais et al. (Eds.), Proceedings of the European Simulation and Modelling Conference - ESM'2011, pp. 117-121, Guimaraes, Portugal, October, 2011. EUROSIS.
