function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg
  
  % Initialize data (get Theta1, Theta2 from params and theta).
  Theta1 = reshape(params(1:hidden_layer_size * (input_layer_size + 1))
                   hidden_layer_size, (input_layer_size + 1));
  Theta2 = reshape(params((1 + (hidden_layer_size * (input_layer_size + 1))):end),
                   output_layer_size, (hidden_layer_size + 1));
  theta = [Theta1(:); Theta2(:)];

  % Forward propagation.
  a1 = [ones(rows(X), 1), X]';
  z2 = Theta1 * a1;
  a2 = [ones(1, columns(z2)); sigmoid(z2)];
  z3 = Theta2 * a2;
  a3 = sigmoid(z3);

  Y = eye(rows(a3))(y,:)

  % Get the cost function using the proper formula (part I).
  J = sum(sum(-Y * log(a3) - (1 - Y) * log(1 - a3))) / rows(X);

  % Determine the gradients (accumulate them).
  delta3 = a3 - Y';
  bigdelta2 = delta3 * a2';
  delta2 = delta3' * Theta2(:,2:end) * (sigmoid(z2) * sigmoid(ones(rows(z2), columns(z2)) - z2)');
  bigdelta1 = delta2' * a1';
  
  % Compute some auxiliars sums for the cost function.
  aux1 = sum(sum(Theta1(:, 2:end) .* Theta1(:, 2:end)));
  aux2 = sum(sum(Theta2(:, 2:end) .* Theta2(:, 2:end)));

  % Get the cost function using the proper formula (part II).
  J += (lambda / (2 * rows(X))) * (aux1 + aux2);

  bigdelta1 = bigdelta1 ./ rows(X) + Theta1 .* (lambda / rows(X));
  bigdelta2 = bigdelta2 ./ rows(X) + Theta2 .* (lambda / rows(X));

  % Get grad.
  grad = [bigdelta1(:) ; bigdelta2(:)];
endfunction
