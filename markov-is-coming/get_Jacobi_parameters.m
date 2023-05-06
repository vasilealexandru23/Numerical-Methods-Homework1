function [G, c] = get_Jacobi_parameters(Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % Extract dimensions of Link matrix.
  [lines columns] = size(Link);

  % G -> iteration matrix
  G = Link(1 : lines - 2, 1 : columns - 2);

	% c -> iteration vector
  c = Link(:,columns - 1 : columns - 1);

  % Erase last elements(WIN and LOSE).
  c(columns - 2) = [];
  c(columns - 2) = [];

endfunction