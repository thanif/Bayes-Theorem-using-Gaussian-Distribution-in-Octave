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
## @deftypefn {Function File} {@var{retval} =} testMAP (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Talha Hanif Butt <talha@talha-Inspiron-15-7000-Gaming>
## Created: 2018-09-21

## The function implements the computation of probability using Gaussian

function [predictedLabels MAPClass0 MAPClass1] = testMAP(X, meanVecClass0, meanVecClass1, covMatrixClass0, covMatrixClass1, prior0, prior1)
  
  MAPClass0 = zeros(size(X)(1),1);
  MAPClass1 = zeros(size(X)(1),1);
  
  
  for i= 1:size(X)(1)
  
    if det(covMatrixClass0) == 0
    
      MAPClass0(i) = 0;  
    
    endif
    
    if det(covMatrixClass0) != 0
    
      if size(X)(1)<2
      
        MAPClass0 = (1/(((2*pi)^(size(X)(2)/2))*(det(covMatrixClass0)^0.5))) *exp(-0.5*(X-meanVecClass0')*inv(covMatrixClass0)*(X-meanVecClass0')');   
        MAPClass0 = MAPClass0*prior0;      
      
      endif
      
      if size(X)(1)>1
    
        MAPClass0(i) = (1/(((2*pi)^(size(X)(2)/2))*(det(covMatrixClass0)^0.5))) *exp(-0.5*(X(i,:)-meanVecClass0')*inv(covMatrixClass0)*(X(i,:)-meanVecClass0')');  
        MAPClass0(i) = MAPClass0(i)*prior0;
      
      endif
      
    
    endif
   
    if det(covMatrixClass1) == 0
    
      MAPClass1(i) = 0;  
    
    endif
    
    if det(covMatrixClass1) != 0
    
      if size(X)(1)<2
      
      MAPClass1 = (1/(((2*pi)^(size(X)(2)/2))*(det(covMatrixClass1)^0.5))) *exp(-0.5*(X-meanVecClass1')*inv(covMatrixClass1)*(X-meanVecClass1')');
      MAPClass1 = MAPClass1*prior1;      
      
      endif
      
      if size(X)(1)>1
      
        MAPClass1(i) = (1/(((2*pi)^(size(X)(2)/2))*(det(covMatrixClass1)^0.5))) *exp(-0.5*(X(i,:)-meanVecClass1')*inv(covMatrixClass1)*(X(i,:)-meanVecClass1')'); 
        MAPClass1(i) = MAPClass1(i)*prior1;
      
      endif
      
    
    endif   
   
  endfor  
    
  
  predictedLabels = zeros(size(X)(1),1);  
  
  for i = 1:size(X)(1)
  
    if MAPClass0(i) > MAPClass1(i)
    
      predictedLabels(i) = 0;
    
    endif
    
    if MAPClass0(i) < MAPClass1(i)
    
      predictedLabels(i) = 1;
      
    endif  
      
    if MAPClass0(i) == MAPClass1(i)
    
      predictedLabels(i) = 0;      
    
    endif
  
  endfor

endfunction
