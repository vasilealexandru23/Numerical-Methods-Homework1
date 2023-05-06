function [decoded_path] = decode_path(path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  decoded_path = [];

  % Use the transpose to work more easily with the vector.
  path = path';

  % We go through the vector and build the answer.
  for idx = 1 : columns(path) - 1
    new_line = floor(path(idx) / cols);
    new_col = mod(path(idx), cols);

    % Check edge cases.
    if (mod(path(idx), cols) != 0)
      new_line = new_line + 1;
    endif

    % Check edge cases.
    if (new_col == 0)
      new_col = cols;
    endif

    % Add new pair to decoded path.
    decoded_path = [decoded_path; new_line, new_col];
  endfor

endfunction