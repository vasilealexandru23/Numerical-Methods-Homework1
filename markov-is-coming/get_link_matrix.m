function [Link] = get_link_matrix(Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth

  % Get adjacency matrix to easily build the Link matrix.
  Adj = get_adjacency_matrix(Labyrinth);

  % Extract the dimensions of adjacency matrix.
  [lines columns] = size(Adj);

  % Build the Link matrix as sparse.
  Link = sparse(zeros(lines, columns));

  % Get through every line of adjaceny matrix
  % and build the Link matrix.
  for line = 1 : lines
    % Function to see how many ones are in the current line.
    neighbours = nnz(Adj(line, :));

    % Update every adjacent cell(nonzero cell).
    for col = 1 : columns
      if (Adj(line, col))
        Link(line, col) = 1 / neighbours;
      endif
    endfor

  endfor

 endfunction