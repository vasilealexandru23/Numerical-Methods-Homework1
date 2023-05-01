function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
  input = textread(file_path, '%s');
  m = str2num(input{1});
  input(1,:) = [];
  n = str2num(input{1});
  input(1,:) = [];
  InitialMatrix = cell([n, m]);
  Y = [];

  % Get Y vector;

  for i = 1 : m
   Y = [Y; str2num(input{1 + n * (i - 1)})];
   input(1 + n * (i - 1)) = [];
  endfor

   % Get matrix

   for i = 1 : rows(input)
     InitialMatrix{i} = input{i};
   endfor

  InitialMatrix=InitialMatrix';

endfunction