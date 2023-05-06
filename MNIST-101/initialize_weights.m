function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % matrix -> the matrix with random values
  matrix = zeros(L_next, L_prev + 1);
endfunction
