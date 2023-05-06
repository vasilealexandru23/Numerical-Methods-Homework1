function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function
  Error = 0;
  m = rows(Y);
  Theta(1) = [];

  % Do formula for the cost function.
  for i = 1 : m
    Error = Error + ((Theta') * (FeatureMatrix(i,:)') - Y(i)) ^ 2;
  endfor

  Error = Error / m;
  Error = Error + lambda * norm(Theta, 1);

endfunction