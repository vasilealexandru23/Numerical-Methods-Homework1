function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(n, 1);
  for k = 1 : iter
    for j = 1 : n

      % Calculez derivata partiala
      calc = 0;
      for i = 1 : m
        calc = calc + ((Theta') * (FeatureMatrix(i,:)') - Y(i)) * (FeatureMatrix(i,:)')(j);
      endfor
      calc = calc / m;

      Theta(j) = Theta(j) - alpha * calc;
    endfor
  endfor
  Theta = [0; Theta];
endfunction