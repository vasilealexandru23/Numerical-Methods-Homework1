function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
  % X -> the test examples for which the classes must be predicted
  % weights -> the trained weights (after optimization)
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % classes -> a vector with labels from 1 to 10 corresponding to
  %            the test examples given as parameter
  
  % Initialize data.
  Theta1 = reshape(weights(1:hidden_layer_size * (input_layer_size + 1)),
                   hidden_layer_size, (input_layer_size + 1));
  Theta2 = reshape(weights((1 + (hidden_layer_size * (input_layer_size + 1))):end),
                   output_layer_size, (hidden_layer_size + 1));
  classes = [];

  % Get number of tests.
  m = rows(X);

  % Iterate over tests.
  for i = 1 : m

    % Forward propragation.
    a1 = [1; X(i,:)'];
    z2 = Theta1 * a1;
    a2 = sigmoid(z2);
    a2 = [1; a2];
    z3 = Theta2 * a2;
    a3 = sigmoid(z3);

    % Get the best prediction.
    best_ind = 1;
    for i = 1 : 10
      if (a3(i, 1) > a3(best_ind, 1))
        best_ind = i;
      endif
    endfor

    % Add to the answer.
    classes = [classes; best_ind];
  endfor

endfunction