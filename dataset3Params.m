function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


arr = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
minErr = 101;
maxC = 0;
maxSigma = 0;
sizer = size(arr,2);
for cval = 1:sizer
    for sig = 1:sizer
        ypredict = svmPredict(svmTrain(X, y, arr(cval), @(x1,x2)gaussianKernel(x1,x2,arr(sig))), Xval); %the function takes a func pointer to a func that calculates kernel bw x1 & x2! why are we checking similarity of X and Xval rather than y and Yval? Don't we need magnitudes?
        err = mean(double(ypredict ~= yval));
        if minErr > err
            minErr = err;
            maxC = arr(cval);
            maxSigma = arr(sig);
        end
    end
end
            
C = maxC;
sigma = maxSigma;
% =========================================================================

end
