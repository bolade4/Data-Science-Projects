## Machine Learning

Michael Bankole  
April 05, 2018

## Machine Learning Technique
Machine learning will be used to write an algorithm in creating a predictive model for this analysis. Moreover this project is based on a supervised problem. It is a classification problem as the outcome variable is binary. Four binary classification data minning (DM) models will be used to build a predictive model: logistic regression (LR), decision trees (DTs), rpart (CART) and random forest (RF). Also, a cross validation method will be used on the rpart in building this model.

## Model Features
**For this model, the main features are:** 
<div style="border: 1px solid #ddd; padding: 5px; overflow-y: scroll; height:300px; overflow-x: scroll; width:900px; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>Model Main Features</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> All Features </th>
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
   <th style="text-align:left;"> LR Features </th>
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

For the DTs, CART and RF all the of the features were thrown into the model. 

**Below is the feature importance for random forest.**
![unnamed-chunk-3-1.png](https://github.com/bolade4/Springboard-Introduction-to-Data-Science-Workshop/blob/master/Capstone/images/unnamed-chunk-3-1.png)<!-- -->

## Machine Learning Technique Used
For this project, Four binary classification data minning (DM) models will be tested: logistic regression (LR), decision trees (DTs), rpart (CART) and random forest (RF). Also, a cross validation method will be used on the rpart in building this model.

The LR is a choice people like to use which operates a smooth nonlinear logistic transformation over a multiple regression model and it allows the estimation of class probabilities. The DT is a branching structure that represents a set of rules, it distinguish values in a hierarchical form. The DT representation can be translated into a set of IF – THEN rules, that could be understood easily. The CART programs are used to build classification or regression models of a very general structure that uses a two stage procedure. The resulting models can also be represented in binary trees. RF are an ensemble learning method for classification, regression and other tasks. They operate by constructing a multitude of decision trees at training time and outputting the class which are the mode of the classes or mean prediction.

## Models
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
<caption>Metric Comparison</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Metric </th>
   <th style="text-align:right;"> LR (%) </th>
   <th style="text-align:right;"> DT (%) </th>
   <th style="text-align:right;"> CART (%) </th>
   <th style="text-align:right;"> RF (%) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> APM </td>
   <td style="text-align:right;"> 0.8711 </td>
   <td style="text-align:right;"> 0.9039 </td>
   <td style="text-align:right;"> 0.9053 </td>
   <td style="text-align:right;"> 0.9493 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> F1 Score </td>
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
