function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  A = FeatureMatrix' * FeatureMatrix;

  % Check if A is a positive definite matrix.
  if (all(eig(A) > 0) == 0)
    Theta = zeros(rows(A), 1);
    Theta = [0; Theta];
    return;
  endif

  % Get Theta using conjugate gradient.
  Theta = conjugate_gradient(A, FeatureMatrix' * Y,
            zeros(columns(FeatureMatrix), 1), tol, iter);
  
  % Add bias.
  Theta = [0; Theta]; 

endfunction