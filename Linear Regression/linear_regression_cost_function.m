function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  m = rows(Y)
  Theta(1) = [];
  Error = 0;
  for i = 1 : m
    Error = Error + ((Theta') * (FeatureMatrix(i,:)') - Y(i)) ^ 2;
  endfor
  Error = Error / (2 * m);
endfunction