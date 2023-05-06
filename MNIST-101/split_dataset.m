function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

% Get permutations of columns.
shuffled_indices = randperm(columns(X));

% Rearange X and y by the previous permutation.
X = X(shuffled_indices, :);
y = y(shuffled_indices);

% Number of examples for the train set.
num_train_examples = round(columns(X) * percent);

% Get the train set.
X_train = X(1 : num_train_examples, :);
y_train = y(1 : num_train_examples);

% Get the test set.
X_test = X(num_train_examples + 1 : end, :);
y_test = y(num_train_examples + 1 : end);

endfunction