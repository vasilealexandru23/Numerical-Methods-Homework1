function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function
  m = rows(Y)
  Theta(1) = [];
  Error = 0;

  % Apply the formula for the cost function.
  for i = 1 : m
    Error = Error + ((Theta') * (FeatureMatrix(i,:)') - Y(i)) ^ 2;
  endfor

  Error = Error / (2 * m);

endfunction