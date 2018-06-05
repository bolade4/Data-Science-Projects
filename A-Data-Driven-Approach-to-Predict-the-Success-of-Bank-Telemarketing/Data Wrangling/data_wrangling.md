## Data Wrangling

Michael Bankole  
April 05, 2018

### Loading the data
Both the training and the testing set were first loaded into R, not looking tidy. The two data set was binded together with the head below.
<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Head of the dataset</caption>
 <thead>
  <tr>
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
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
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
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
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
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
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
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
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
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
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
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:left;"> no </td>
  </tr>
</tbody>
</table></div>

### Cleaning the column and the row names
Some of the column names were cleaned to make it simple and descriptive. Also, some of the row names were not tidy, this was cleaned up as well using the stringr. After cleaning the obvious typos in the dataset, several methods were used to check if there could be any left in the data but there was non.
<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Head of the dataset</caption>
 <thead>
  <tr>
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
   <th style="text-align:right;"> emp_var_rate </th>
   <th style="text-align:right;"> cons_price_idx </th>
   <th style="text-align:right;"> cons_conf_idx </th>
   <th style="text-align:right;"> euribor3m </th>
   <th style="text-align:right;"> nr_employed </th>
   <th style="text-align:left;"> y </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 56 </td>
   <td style="text-align:left;"> housemaid </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> basic 4y </td>
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
   <td style="text-align:left;"> non existent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 57 </td>
   <td style="text-align:left;"> services </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> high school </td>
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
   <td style="text-align:left;"> non existent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:left;"> services </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> high school </td>
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
   <td style="text-align:left;"> non existent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 40 </td>
   <td style="text-align:left;"> admin </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> basic 6y </td>
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
   <td style="text-align:left;"> non existent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 56 </td>
   <td style="text-align:left;"> services </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> high school </td>
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
   <td style="text-align:left;"> non existent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:left;"> no </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:left;"> services </td>
   <td style="text-align:left;"> married </td>
   <td style="text-align:left;"> basic 9y </td>
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
   <td style="text-align:left;"> non existent </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 93.994 </td>
   <td style="text-align:right;"> -36.4 </td>
   <td style="text-align:right;"> 4.857 </td>
   <td style="text-align:right;"> 5191 </td>
   <td style="text-align:left;"> no </td>
  </tr>
</tbody>
</table></div>

### Missing values
Several methods were used to check for missing values in the dataset. There is a lot of unknown values in the dataset. They were all turned into NA's because almost all the variables with unknown values are important for the modelling.

### Outliers
Several methods were used to detect outliers in this dataset.
For the outliers, one of the methods used is Cooks distance to detect all of the outliers in the dataset. I wrote a function that detect the outliers using the Tukey rules on quartiles +/- 1.5 IQR and once outliers are detected from any variable. It ask if I will like for it to delete the outliers and turn them to NA's. Once I hit the "Y" button my keyboard, it will turn them to NA's and give me a new summary of the variable with the mean of the variable before detecting the outliers and the new mean after deleting the outliers. If hit any other button on my keyboard, the function will do nothing to the outliers. Actually, all the outliers were deleted and turned into NA's. I illustrated on one of the variables (Age) outliers below: 

**Using Cooks Distance method to detect all outliers in the dataset**

![Cooks Distance](https://github.com/bolade4/Data-Science-Projects/blob/master/A-Data-Driven-Approach-to-Predict-the-Success-of-Bank-Telemarketing/images/unnamed-chunk-8-1.png)<!-- -->

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

**Age Distribution**
![Age Distribution](https://github.com/bolade4/Data-Science-Projects/blob/master/A-Data-Driven-Approach-to-Predict-the-Success-of-Bank-Telemarketing/images/Age_distribution.PNG)<!-- -->

**Age with Outliers listed on top of the boxplot**
![Age Outliers](https://github.com/bolade4/Data-Science-Projects/blob/master/A-Data-Driven-Approach-to-Predict-the-Success-of-Bank-Telemarketing/images/Age_outliers.PNG)<!-- -->

**Removing the Age Outliers**

```
## Found outliers: 508 in 45307 observations
```

```
## Outlier's proportion (%): 1.12123954355839
```

```
## Outlier's mean: 76.9153543307087
```

```
## Mean with outliers: 40.0322025294105
```

```
## Mean without outliers: 39.6139645974241
```

```
## Remove and replace outliers with NA? [yes/no]:
```

```
## Data not updated
```

![Age Outlier Treat](https://github.com/bolade4/Data-Science-Projects/blob/master/A-Data-Driven-Approach-to-Predict-the-Success-of-Bank-Telemarketing/images/Age_outliers_treat.PNG)<!-- -->

From above, the function return a summary after checking for outliers. It gives a summary of the total number of outlier, observation, outlier's proportion, the mean with outliers in the obsservation and the mean after removing the outliers. Once it detects an outlier, it will ask if to remove the outlier and replace it with NA. If you want to get the outlier off, you hit the y button on your keyboard and this will be removed. Then it gives you an update on the chosen option (data updated or data not updated). It also plot two different graphs, one boxplot and one histogram with outliers and the other one is a boxplot and an histogram without outliers.

### Doing some feature engineering
I added some new variables to the dataset based on doing some further analysis on it. Variables like subscribe which is the new dependent variable, a categorical variable with two levels, also new_pdays is another new variable derived from analysing existing variables. I dropped some of the variables that are not necessary for the analysis i.e. duration, y. Lastly, I defined the classes of all the variables.

### Dealing with the NA's
I used imputation method to fix the NA's in the dataset. Calling on the mice package to handle this.

**Percentage of each missing data**
<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Variable percentage of missing data</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> x </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> age </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> job </td>
   <td style="text-align:right;"> 0.8144437 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> marital </td>
   <td style="text-align:right;"> 0.2008520 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> education </td>
   <td style="text-align:right;"> 4.1891981 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> default </td>
   <td style="text-align:right;"> 20.7473459 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> housing </td>
   <td style="text-align:right;"> 2.4168451 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> loan </td>
   <td style="text-align:right;"> 2.4168451 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> contact </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> month </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> day_of_week </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> campaign </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> previous </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> poutcome </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> euribor3m </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> subscribe </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
</tbody>
</table></div>

**Viewing the missing data**
<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Number of missing data in each variable</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> x </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> age </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> job </td>
   <td style="text-align:right;"> 369 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> marital </td>
   <td style="text-align:right;"> 91 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> education </td>
   <td style="text-align:right;"> 1898 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> default </td>
   <td style="text-align:right;"> 9400 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> housing </td>
   <td style="text-align:right;"> 1095 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> loan </td>
   <td style="text-align:right;"> 1095 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> contact </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> month </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> day_of_week </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> campaign </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> previous </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> poutcome </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> euribor3m </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> subscribe </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table></div>

```

```

![Missing Data Pattern](https://github.com/bolade4/Data-Science-Projects/blob/master/A-Data-Driven-Approach-to-Predict-the-Success-of-Bank-Telemarketing/images/Missing_pattern.png)<!-- -->

```
## 
##  Variables sorted by number of missings: 
##     Variable       Count
##      default 0.207473459
##    education 0.041891981
##      housing 0.024168451
##         loan 0.024168451
##          job 0.008144437
##      marital 0.002008520
##          age 0.000000000
##      contact 0.000000000
##        month 0.000000000
##  day_of_week 0.000000000
##     campaign 0.000000000
##     previous 0.000000000
##     poutcome 0.000000000
##    euribor3m 0.000000000
##    subscribe 0.000000000
```

After using the imputation method to fix the NA's, the data is now clean and ready for analysis.
