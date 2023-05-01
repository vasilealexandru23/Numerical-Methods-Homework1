function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  A = FeatureMatrix' * FeatureMatrix;
  eigs = eig(A);
  if (all(eigs > 0) == 0)
    Theta = zeros(rows(Y), 1);
    Theta = [0; Theta];
    return;
  endif
  Theta = conjugate_gradient(A, FeatureMatrix' * Y, zeros(rows(Y), 1), tol, iter);
  Theta = [0; Theta]; 
endfunction