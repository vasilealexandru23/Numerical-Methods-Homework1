function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  Error = 0;
  m = rows(Y);
  Theta(1) = [];
  for i = 1 : m
    Error = Error + ((Theta') * (FeatureMatrix(i,:)') - Y(i)) ^ 2;
  endfor
  Error = Error / m;
  Error = Error + lambda * norm(Theta, 1);
endfunction