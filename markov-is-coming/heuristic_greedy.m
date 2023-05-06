function [path] = heuristic_greedy(start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm

  % Extract dimensions of adjacency matrix.
  [lines columns] = size(Adj);

  % Create path and visited arrays.
  path = [start_position];
  visited = sparse(zeros(lines,1));
  visited(start_position) = 1;

  % Run dfs.
  while 1
    % Extract the top of the stack and mark as visited.
    curr_cell = path(end);
    visited(curr_cell) = 1;

    % Check if we are adjacent to WIN cell.
    if (Adj(curr_cell, lines - 1) == 1)
      path = [path, lines - 1];
      path = path';
      return;
    endif

    next_cell = -1;
    best_prob = -1;

    % Get the neighbour with the highest winning probability.
    for neigh = 1 : lines - 2
      if (Adj(curr_cell, neigh) == 1) && (visited(neigh) == 0) && (probabilities(neigh) > best_prob)
        % Update for the best neighbour.
        next_cell = neigh;
        best_prob = probabilities(neigh);
      endif
    endfor

    % No neighbors were found, we delete the top of the stack.
    if (next_cell == -1)
      path(end) = [];
    else
      % Push the next cell in stack.
      path = [path, next_cell];
      visited(next_cell) = 1;
    endif

  endwhile

endfunction