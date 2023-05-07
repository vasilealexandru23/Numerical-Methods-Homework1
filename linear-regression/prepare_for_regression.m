function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples

  % Initialize FeatureMatrix. 
  [m n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n + 1);
    for i = 1 : m
      for j = 1 : n
      % Build FeatureMatrix.
      if (strcmp(InitialMatrix{i, j}, "yes") == 1)
        FeatureMatrix(i, j) = 1;
      elseif (strcmp(InitialMatrix{i, j}, "no") == 1)
        FeatureMatrix(i, j) = 0;
      elseif (strcmp(InitialMatrix{i, j}, "furnished") == 1)
        FeatureMatrix(i, j) = 0;
        FeatureMatrix(i, j + 1) = 0;
      elseif (strcmp(InitialMatrix{i, j}, "semi-furnished") == 1)
        FeatureMatrix(i, j) = 1;
        FeatureMatrix(i, j + 1) = 0;
      elseif (strcmp(InitialMatrix{i, j}, "unfurnished") == 1)
        FeatureMatrix(i, j) = 0;
        FeatureMatrix(i, j + 1) = 1;
      else
        if (j == n)
          FeatureMatrix(i, j + 1) = str2num(InitialMatrix{i, j});
        else
          FeatureMatrix(i, j) = str2num(InitialMatrix{i, j});
        endif
      endif
    endfor
  endfor

endfunction