function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights
  Theta = zeros(n, 1);

  % Go through every iteration.
  for k = 1 : iter

    % Recompute Theta vector.
    for j = 1 : n

      dJ = 0;
      % Compute partial derivative dJ/dTheta(j) in Theta.
      for i = 1 : m
        dJ = dJ + ((Theta') * (FeatureMatrix(i,:)') - Y(i)) * (FeatureMatrix(i,:)')(j);
      endfor
      dJ = dJ / m;

      % Recompute (j) component of the Theta vector.
      Theta(j) = Theta(j) - alpha * dJ;
    endfor

  endfor

  % Add bias.
  Theta = [0; Theta];
endfunction