function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth

  % Build the adjacency matrix as sparce matrix.
  [lines columns] = size(Labyrinth);
  Adj = sparse(zeros(lines * columns + 2, lines * columns + 2));

  % We go through the labyrinth matrix element
  % by element and build the adjacency matrix.
  for line = 1 : lines
    for column = 1 : columns
      curr_node = (line - 1) * columns + column;

      % Check the neighboring cell to west.
      if (bitget(Labyrinth(line, column), 1) == 0)
        if (column - 1 >= 1)
          Adj(curr_node, curr_node - 1) = 1;
        else
          % Adjacent to LOSE cell.
          Adj(curr_node, lines * columns + 2) = 1;
        endif
      endif

      % Check the neighboring cell to east.
      if (bitget(Labyrinth(line, column), 2) == 0)
        if (column + 1 <= columns)
          Adj(curr_node, curr_node + 1) = 1;
        else
          % Adjacent to LOSE cell.
          Adj(curr_node, lines * columns + 2) = 1;
        endif
      endif

      % Check the neighboring cell to south.
      if (bitget(Labyrinth(line, column), 3) == 0)
        if (line + 1 <= lines)
          Adj(curr_node, curr_node + columns) = 1;
        else
          % Adjacent to WIN cell.
          Adj(curr_node, lines * columns + 1) = 1;
        endif
      endif

      % Check the neighboring cell to north.
      if (bitget(Labyrinth(line, column), 4) == 0)
        if (line - 1 >= 1)
          Adj(curr_node, curr_node - columns) = 1;
        else
          % Adjacent to WIN cell.
          Adj(curr_node, lines * columns + 1) = 1;
        endif
     endif

    endfor
  endfor

  % Mark the edge between WIN-WIN and LOSE-LOSE.
  Adj(lines * columns + 1, lines * columns + 1) = 1;
  Adj(lines * columns + 2, lines * columns + 2) = 1;

endfunction