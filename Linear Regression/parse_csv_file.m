function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  line = textread(file_path, '%s', 1);

  % Determin cate coloane am
  cols = 1;
  for i = 1 : columns(line{1})
    if (strcmp((line{1})(i), ',') == 1)
      cols = cols + 1;
    endif
  endfor

  input = textread(file_path, '%s', 'delimiter', ',');

  lines = (size(input))(1) / cols;
  for i = 1 : cols
    input(1) = [];
  endfor

  lines = lines - 1;
  cols = cols - 1;

  InitialMatrix = cell([cols, lines]);
  Y = [];

  % Get Y vector;

  for i = 1 : lines
   Y = [Y; str2num(input{1 + cols * (i - 1)})];
   input(1 + cols * (i - 1)) = [];
  endfor

   % Get matrix

   for i = 1 : rows(input)
     InitialMatrix{i} = input{i};
   endfor

   InitialMatrix=InitialMatrix';
   
endfunction