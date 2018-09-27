# Reading training data 
dat = load('trainingData.txt'); 

# Last column in training file has the labels
# All labels are in trainLabels
trainLabels = dat(:,end);

# All the features are now in trainX
trainX = dat(:,1:end-1);

# Loading test data
X = load('testingData.txt'); 

# Learning parameters using diagonal covariance matrix
[meanVecClass0 meanVecClass1 covMatrixClass0 covMatrixClass1 prior0 prior1] = learnGaussDiagonalCov (trainX,trainLabels);

# Predictions on test data
[predictedLabels MAPClass0 MAPClass1] = testMAP(X, meanVecClass0, meanVecClass1, covMatrixClass0, covMatrixClass1, prior0, prior1)

# Learning parameters using complete covariance matrix
[meanVecClass0 meanVecClass1 covMatrixClass0 covMatrixClass1 prior0 prior1] = learnGauss (trainX,trainLabels);

# Predictions on test data
[predictedLabels MAPClass0 MAPClass1] = testMAP(X, meanVecClass0, meanVecClass1, covMatrixClass0, covMatrixClass1, prior0, prior1)

