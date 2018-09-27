## Copyright (C) 2018 Talha Hanif Butt
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} learnGaussDiagonalCov (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Talha Hanif Butt <talha@talha-Inspiron-15-7000-Gaming>
## Created: 2018-09-20

function [meanVecClass0 meanVecClass1 covMatrixClass0 covMatrixClass1 prior0 prior1] = learnGaussDiagonalCov (trainX,trainLabels)

# Calculating prior probability of Class 0
  prior0 = sum(trainLabels == 0)/size(trainLabels)(1);

# Calculating prior probability of Class 1 
  prior1 = sum(trainLabels == 1)/size(trainLabels)(1);
  
# Calculating Mean Vector for Class 0 and Class 1

  meanVecClass0 = zeros(size(trainX)(2),1);
  meanVecClass1 = zeros(size(trainX)(2),1);

  for i = 1:size(trainX)(2)  
  
    meanVecClass0(i) = sum(trainX(trainLabels == 0,i) == 0)/sum(trainLabels == 0);
    meanVecClass1(i) = sum(trainX(trainLabels == 1,i) == 1)/sum(trainLabels == 1);
  
  endfor
  
# Calculating Diagonal Covariance Matrix for Class 0 and Class 1    
  
  covMatrixClass0 = zeros(size(trainX)(2),size(trainX)(2));  
  covMatrixClass1 = zeros(size(trainX)(2),size(trainX)(2));
  
 
  for i = 1:size(trainX)(2)
  
    for j = 1:size(trainX)(1)
    
      if trainLabels(j) == 0
      
        covMatrixClass0(i,i) = covMatrixClass0(i,i) + (trainX(j,i) - meanVecClass0(i))**2;  
      
      endif  
      
      if trainLabels(j) == 1
      
        covMatrixClass1(i,i) = covMatrixClass1(i,i) + (trainX(j,i) - meanVecClass1(i))**2;
      
      endif        
    
    endfor
  
  endfor
  
  covMatrixClass0 = covMatrixClass0./(sum(trainLabels == 0)-1);
  covMatrixClass1 = covMatrixClass1./(sum(trainLabels == 1)-1);
  


endfunction
