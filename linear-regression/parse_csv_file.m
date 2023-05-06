function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % Read first line to count the number of columns.
  line = textread(file_path, '%s', 1);

  % Get the number of columns.
  cols = 1;
  for i = 1 : columns(line{1})
    if (strcmp((line{1})(i), ',') == 1)
      cols++;
    endif
  endfor

  % Read the csv file.
  input = textread(file_path, '%s', 'delimiter', ',');

  % Get number of lines of the csv file.
  lines = (size(input))(1) / cols;

  % Erase some labels to work more easily.
  for i = 1 : cols
    input(1) = [];
  endfor

  lines--;
  cols--;

  % Initialize data.
  InitialMatrix = cell([cols, lines]);
  Y = [];

  % Get Y vector.
  for i = 1 : lines
   Y = [Y; str2num(input{1 + cols * (i - 1)})];
   input(1 + cols * (i - 1)) = [];
  endfor

   % Get InitialMatrix.
   for i = 1 : rows(input)
     InitialMatrix{i} = input{i};
   endfor

   InitialMatrix = InitialMatrix';
   
endfunction