function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples
  
  InitialMatrix = InitialMatrix';
  [m n] = size(InitialMatrix);
  FeatureMatrix = zeros(n, m + 1);
    for i = 1 : m
      for j = 1 : n
      if (strcmp(InitialMatrix{i, j}, "yes") == 1)
        FeatureMatrix(j, i) = 1;
      elseif (strcmp(InitialMatrix{i, j}, "no") == 1)
        FeatureMatrix(j, i) = 0;
      elseif (strcmp(InitialMatrix{i, j}, "furnished") == 1)
        FeatureMatrix(j, i) = 0;
        FeatureMatrix(j, i + 1) = 0;
      elseif (strcmp(InitialMatrix{i, j}, "semi-furnished") == 1)
        FeatureMatrix(j, i) = 1;
        FeatureMatrix(j, i + 1) = 0;
      elseif (strcmp(InitialMatrix{i, j}, "unfurnished") == 1)
        FeatureMatrix(j, i) = 0;
        FeatureMatrix(j, i + 1) = 1;
      else
        FeatureMatrix(j, i) = str2num(InitialMatrix{i, j});
      endif
    endfor
  endfor

endfunction