function [x] = conjugate_gradient(A, b, x_0, tol, max_iter)
  r_prev = b - A * x_0;
  v = r_prev;
  x = x_0;
  tol_squared = tol * tol;
  k = 1;
  while 1
    if (k >= max_iter || (r_prev') * r_prev <= tol_squared)
      return;
    endif

    t = ((r_prev)' * r_prev) / (v' * A * v);
    x = x + t * v;
    r = r_prev - t * A * v;
    s = ((r') * r) / ((r_prev)' * r_prev);
    v = r + s * v;
    r_prev = r;

    k = k + 1;
  endwhile

endfunction