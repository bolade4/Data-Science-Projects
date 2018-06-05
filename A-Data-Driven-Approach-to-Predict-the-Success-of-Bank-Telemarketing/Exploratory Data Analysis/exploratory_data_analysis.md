## EDA Summary

Michael Bankole  
April 05, 2018

### Understanding the data
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

**Dimension of the dataset**

```
## [1] 45307    21
```

**Column names**
<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Column names</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Variable Names </th>
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
   <td style="text-align:left;"> duration </td>
  </tr>
  <tr>
   <td style="text-align:left;"> campaign </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pdays </td>
  </tr>
  <tr>
   <td style="text-align:left;"> previous </td>
  </tr>
  <tr>
   <td style="text-align:left;"> poutcome </td>
  </tr>
  <tr>
   <td style="text-align:left;"> emp.var.rate </td>
  </tr>
  <tr>
   <td style="text-align:left;"> cons.price.idx </td>
  </tr>
  <tr>
   <td style="text-align:left;"> cons.conf.idx </td>
  </tr>
  <tr>
   <td style="text-align:left;"> euribor3m </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nr.employed </td>
  </tr>
  <tr>
   <td style="text-align:left;"> y </td>
  </tr>
</tbody>
</table></div>

**Structure of the dataset**

```
## 'data.frame':	45307 obs. of  21 variables:
##  $ age           : int  56 57 37 40 56 45 59 41 24 25 ...
##  $ job           : Factor w/ 12 levels "admin.","blue-collar",..: 4 8 8 1 8 8 1 2 10 8 ...
##  $ marital       : Factor w/ 4 levels "divorced","married",..: 2 2 2 2 2 2 2 2 3 3 ...
##  $ education     : Factor w/ 8 levels "basic.4y","basic.6y",..: 1 4 4 2 4 3 6 8 6 4 ...
##  $ default       : Factor w/ 3 levels "no","unknown",..: 1 2 1 1 1 2 1 2 1 1 ...
##  $ housing       : Factor w/ 3 levels "no","unknown",..: 1 1 3 1 1 1 1 1 3 3 ...
##  $ loan          : Factor w/ 3 levels "no","unknown",..: 1 1 1 1 3 1 1 1 1 1 ...
##  $ contact       : Factor w/ 2 levels "cellular","telephone": 2 2 2 2 2 2 2 2 2 2 ...
##  $ month         : Factor w/ 10 levels "apr","aug","dec",..: 7 7 7 7 7 7 7 7 7 7 ...
##  $ day_of_week   : Factor w/ 5 levels "fri","mon","thu",..: 2 2 2 2 2 2 2 2 2 2 ...
##  $ duration      : int  261 149 226 151 307 198 139 217 380 50 ...
##  $ campaign      : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ pdays         : int  999 999 999 999 999 999 999 999 999 999 ...
##  $ previous      : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ poutcome      : Factor w/ 3 levels "failure","nonexistent",..: 2 2 2 2 2 2 2 2 2 2 ...
##  $ emp.var.rate  : num  1.1 1.1 1.1 1.1 1.1 1.1 1.1 1.1 1.1 1.1 ...
##  $ cons.price.idx: num  94 94 94 94 94 ...
##  $ cons.conf.idx : num  -36.4 -36.4 -36.4 -36.4 -36.4 -36.4 -36.4 -36.4 -36.4 -36.4 ...
##  $ euribor3m     : num  4.86 4.86 4.86 4.86 4.86 ...
##  $ nr.employed   : num  5191 5191 5191 5191 5191 ...
##  $ y             : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
```

**Counting the number of missing values in the dataset**

```
## [1] 0
```

**Summary of the dataset**

```
##       age                 job            marital     
##  Min.   :17.00   admin.     :11434   divorced: 5058  
##  1st Qu.:32.00   blue-collar:10138   married :27437  
##  Median :38.00   technician : 7434   single  :12721  
##  Mean   :40.03   services   : 4362   unknown :   91  
##  3rd Qu.:47.00   management : 3248                   
##  Max.   :98.00   retired    : 1886                   
##                  (Other)    : 6805                   
##                education        default         housing     
##  university.degree  :13432   no     :35903   no     :20461  
##  high.school        :10436   unknown: 9400   unknown: 1095  
##  basic.9y           : 6619   yes    :    4   yes    :23751  
##  professional.course: 5778                                  
##  basic.4y           : 4605                                  
##  basic.6y           : 2520                                  
##  (Other)            : 1917                                  
##       loan            contact          month       day_of_week
##  no     :37299   cellular :28796   may    :15147   fri:8595   
##  unknown: 1095   telephone:16511   jul    : 7885   mon:9369   
##  yes    : 6913                     aug    : 6814   thu:9483   
##                                    jun    : 5848   tue:8931   
##                                    nov    : 4547   wed:8929   
##                                    apr    : 2847              
##                                    (Other): 2219              
##     duration         campaign          pdays          previous     
##  Min.   :   0.0   Min.   : 1.000   Min.   :  0.0   Min.   :0.0000  
##  1st Qu.: 102.0   1st Qu.: 1.000   1st Qu.:999.0   1st Qu.:0.0000  
##  Median : 180.0   Median : 2.000   Median :999.0   Median :0.0000  
##  Mean   : 258.1   Mean   : 2.565   Mean   :962.3   Mean   :0.1745  
##  3rd Qu.: 319.0   3rd Qu.: 3.000   3rd Qu.:999.0   3rd Qu.:0.0000  
##  Max.   :4918.0   Max.   :56.000   Max.   :999.0   Max.   :7.0000  
##                                                                    
##         poutcome      emp.var.rate      cons.price.idx  cons.conf.idx  
##  failure    : 4706   Min.   :-3.40000   Min.   :92.20   Min.   :-50.8  
##  nonexistent:39086   1st Qu.:-1.80000   1st Qu.:93.08   1st Qu.:-42.7  
##  success    : 1515   Median : 1.10000   Median :93.75   Median :-41.8  
##                      Mean   : 0.08217   Mean   :93.58   Mean   :-40.5  
##                      3rd Qu.: 1.40000   3rd Qu.:93.99   3rd Qu.:-36.4  
##                      Max.   : 1.40000   Max.   :94.77   Max.   :-26.9  
##                                                                        
##    euribor3m      nr.employed     y        
##  Min.   :0.634   Min.   :4964   no :40216  
##  1st Qu.:1.344   1st Qu.:5099   yes: 5091  
##  Median :4.857   Median :5191              
##  Mean   :3.621   Mean   :5167              
##  3rd Qu.:4.961   3rd Qu.:5228              
##  Max.   :5.045   Max.   :5228              
```

### New Variables and Data Types
some new variables were created while some existing variables were deleted from the dataset for this analysis and variables were converted accordingly for the analysis.

**Cleaned data variable names**
<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>New Column Names</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Variable Names </th>
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

From the above, some new variable names were created, e.g. new_pdays, from the actual dataset, pdays depicts number of days that passed by after the client was last contacted from a previous campaign which contains some observations 999. And from the dataset information, 999 means client was not previously contacted. So, all observations with 999 from this variable was replaced with zero (0) which means there was no number of days that passed before any client under this category was contacted. Further analysis was performed to make sure this numeric figure (999) was accurately replaced. It's all in the R code.

Some of the variables were dropped from the dataset, i.e. duration. This means last contact duration, it is in seconds (numeric). Important note:  this attribute highly affects the output target (e.g., if duration = 0 then subscribe = "no") meaning there was no contact. Yet, the duration is not known before a call is performed. Also, after the end of the call, subscription (if a client says yes or no) is obviously known. Thus, this input was only included for a benchmark purpose and was discarded from the cleaned (final) dataset in order to have a realistic predictive model.

**New structure of the dataset with the right data type for the analysis**

```
## 'data.frame':	41188 obs. of  20 variables:
##  $ age           : num  56 57 37 40 56 45 59 41 24 25 ...
##  $ job           : Factor w/ 11 levels "admin","blue collar",..: 4 8 8 1 8 8 1 2 10 8 ...
##   ..- attr(*, "contrasts")= num [1:11, 1:10] 0 1 0 0 0 0 0 0 0 0 ...
##   .. ..- attr(*, "dimnames")=List of 2
##   .. .. ..$ : chr  "admin" "blue collar" "entrepreneur" "housemaid" ...
##   .. .. ..$ : chr  "2" "3" "4" "5" ...
##  $ marital       : Factor w/ 3 levels "divorced","married",..: 2 2 2 2 2 2 2 2 3 3 ...
##   ..- attr(*, "contrasts")= num [1:3, 1:2] 0 1 0 0 0 1
##   .. ..- attr(*, "dimnames")=List of 2
##   .. .. ..$ : chr  "divorced" "married" "single"
##   .. .. ..$ : chr  "2" "3"
##  $ education     : Factor w/ 7 levels "basic 4y","basic 6y",..: 1 4 4 2 4 3 6 6 6 4 ...
##   ..- attr(*, "contrasts")= num [1:7, 1:6] 0 1 0 0 0 0 0 0 0 1 ...
##   .. ..- attr(*, "dimnames")=List of 2
##   .. .. ..$ : chr  "basic 4y" "basic 6y" "basic 9y" "high school" ...
##   .. .. ..$ : chr  "2" "3" "4" "5" ...
##  $ default       : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
##  $ housing       : Factor w/ 2 levels "no","yes": 1 1 2 1 1 1 1 1 2 2 ...
##   ..- attr(*, "contrasts")= num [1:2, 1] 0 1
##   .. ..- attr(*, "dimnames")=List of 2
##   .. .. ..$ : chr  "no" "yes"
##   .. .. ..$ : chr "2"
##  $ loan          : Factor w/ 2 levels "no","yes": 1 1 1 1 2 1 1 1 1 1 ...
##   ..- attr(*, "contrasts")= num [1:2, 1] 0 1
##   .. ..- attr(*, "dimnames")=List of 2
##   .. .. ..$ : chr  "no" "yes"
##   .. .. ..$ : chr "2"
##  $ contact       : Factor w/ 2 levels "cellular","telephone": 2 2 2 2 2 2 2 2 2 2 ...
##   ..- attr(*, "contrasts")= num [1:2, 1] 0 1
##   .. ..- attr(*, "dimnames")=List of 2
##   .. .. ..$ : chr  "cellular" "telephone"
##   .. .. ..$ : chr "2"
##  $ month         : Factor w/ 10 levels "apr","aug","dec",..: 7 7 7 7 7 7 7 7 7 7 ...
##   ..- attr(*, "contrasts")= num [1:10, 1:9] 0 1 0 0 0 0 0 0 0 0 ...
##   .. ..- attr(*, "dimnames")=List of 2
##   .. .. ..$ : chr  "apr" "aug" "dec" "jul" ...
##   .. .. ..$ : chr  "2" "3" "4" "5" ...
##  $ day_of_week   : Factor w/ 5 levels "fri","mon","thu",..: 2 2 2 2 2 2 2 2 2 2 ...
##   ..- attr(*, "contrasts")= num [1:5, 1:4] 0 1 0 0 0 0 0 1 0 0 ...
##   .. ..- attr(*, "dimnames")=List of 2
##   .. .. ..$ : chr  "fri" "mon" "thu" "tue" ...
##   .. .. ..$ : chr  "2" "3" "4" "5"
##  $ campaign      : num  1 1 1 1 1 1 1 1 1 1 ...
##  $ previous      : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ poutcome      : Factor w/ 3 levels "failure","non existent",..: 2 2 2 2 2 2 2 2 2 2 ...
##   ..- attr(*, "contrasts")= num [1:3, 1:2] 0 1 0 0 0 1
##   .. ..- attr(*, "dimnames")=List of 2
##   .. .. ..$ : chr  "failure" "non existent" "success"
##   .. .. ..$ : chr  "2" "3"
##  $ euribor3m     : num  4.86 4.86 4.86 4.86 4.86 ...
##  $ new_pdays     : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ emp_var_rate  : num  1.1 1.1 1.1 1.1 1.1 1.1 1.1 1.1 1.1 1.1 ...
##  $ cons_price_idx: num  94 94 94 94 94 ...
##  $ cons_conf_idx : num  -36.4 -36.4 -36.4 -36.4 -36.4 -36.4 -36.4 -36.4 -36.4 -36.4 ...
##  $ nr_employed   : num  5191 5191 5191 5191 5191 ...
##  $ subscribe     : Factor w/ 2 levels "0","1": 1 1 1 1 1 1 1 1 1 1 ...
```

**Summary of the cleaned dataset**

```
##       age                 job            marital     
##  Min.   :17.00   admin      :10493   divorced: 4623  
##  1st Qu.:32.00   blue collar: 9353   married :24973  
##  Median :38.00   technician : 6783   single  :11592  
##  Mean   :39.81   services   : 3990                   
##  3rd Qu.:47.00   management : 2946                   
##  Max.   :86.66   retired    : 1750                   
##                  (Other)    : 5873                   
##                education     default     housing      loan      
##  basic 4y           : 4450   no :41175   no :19086   no :34797  
##  basic 6y           : 2410   yes:   13   yes:22102   yes: 6391  
##  basic 9y           : 6349                                      
##  high school        : 9896                                      
##  illiterate         :   31                                      
##  professional course: 5439                                      
##  university degree  :12613                                      
##       contact          month       day_of_week    campaign     
##  cellular :26144   may    :13769   fri:7827    Min.   :-2.146  
##  telephone:15044   jul    : 7174   mon:8514    1st Qu.: 1.000  
##                    aug    : 6178   thu:8623    Median : 2.000  
##                    jun    : 5318   tue:8090    Mean   : 2.050  
##                    nov    : 4101   wed:8134    3rd Qu.: 3.000  
##                    apr    : 2632               Max.   : 6.154  
##                    (Other): 2016                               
##     previous             poutcome       euribor3m       new_pdays      
##  Min.   :0.000   failure     : 4252   Min.   :0.634   Min.   : 0.0000  
##  1st Qu.:0.000   non existent:35563   1st Qu.:1.344   1st Qu.: 0.0000  
##  Median :0.000   success     : 1373   Median :4.857   Median : 0.0000  
##  Mean   :0.173                        Mean   :3.621   Mean   : 0.2212  
##  3rd Qu.:0.000                        3rd Qu.:4.961   3rd Qu.: 0.0000  
##  Max.   :7.000                        Max.   :5.045   Max.   :27.0000  
##                                                                        
##   emp_var_rate      cons_price_idx  cons_conf_idx     nr_employed  
##  Min.   :-3.40000   Min.   :92.20   Min.   :-50.80   Min.   :4964  
##  1st Qu.:-1.80000   1st Qu.:93.08   1st Qu.:-42.70   1st Qu.:5099  
##  Median : 1.10000   Median :93.75   Median :-41.80   Median :5191  
##  Mean   : 0.08189   Mean   :93.58   Mean   :-40.69   Mean   :5167  
##  3rd Qu.: 1.40000   3rd Qu.:93.99   3rd Qu.:-36.40   3rd Qu.:5228  
##  Max.   : 1.40000   Max.   :94.77   Max.   :-29.80   Max.   :5228  
##                                                                    
##  subscribe
##  0:36548  
##  1: 4640  
```

### Analysing Subscription Rate
Considering the features of the dataset, it is highly recommended to consider the distinction rate between the two levels of subscription of the bank customers whether they say yes or no to the bank term deposit.

I will like to explore the relationship between some of the features and subscription below.

**Age, Education and Subscription Relationship**
![AgeEducationandSubscription](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/AgeEducationandSubscription.PNG)<!-- -->

The facet histogram above shows the relationship between age, education and subscription rate to the bank term deposit. From this graph, it could be noted that non of those in the illiterate class is afected by the bank term subscription and this can help our further analysis.

**Age, Job, Contact, Subscription Relationship**
![eda](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/eda.PNG)<!-- -->

From the scatter plot above, a padering could be viewed that more of those been contacted throgh cellular tend to subscribe to the bank term than those been contated through telephone even though the distribution between these two means of contact is kind of even. This features could also be useful in the analysis. This facet shows the relationship between age, job, contact and subscribe.

**Age, Job, Marital status, Previous, Subscription Relationship**
![eda1](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/eda1.PNG)<!-- -->

The scatter plot above shows the subscription rate of the customer based on their age, job, marital status and how many times a particular customer has been contacted before this campaign. If a customer has been contated before this campaign, it shows there's been a relationship between such customer and the bank before this campaign else this campaign will be pulling them together into business for the first time. As we can see from te graph, some quite lot of customers that has not been contacted before this campaign (previous = 0) will also be interested in the bank term and they will say yes. This graph shows another useful features for this analysis. The plot shows the relationship between age, job, marital status, previous and subscribe.

### Checking if a feature fits
Trying to check if some of the features if they will fit for the model when with outliers and when not with outliers. new_pdays was one the the tested features and below is the plot for both with outliers and without outliers.

![eda2](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/eda2.PNG)<!-- -->

### Cleaned data
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

### Conclusion
The exploratory process helps make the data ready for the predictive model analysis and also, it helps understand the structure of the data.
