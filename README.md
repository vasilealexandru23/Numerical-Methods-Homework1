<img align="right" src="https://i0.wp.com/www.pacorabadan.com/wp-content/uploads/2017/08/gnu-octave-logo-lnx.png?ssl=1" width="200" height="100">

**Name: Vasile Alexandru-Gabriel**  
**Group: 314CA**

### **Numerical-Methods-Homework1**

#
### Task1 - Markov is coming ...
#### Description:
* Task 1 consists in determining an exit path for a robot from a maze for
which we know the starting position. For each step, we have to choose the
direction with the highest probability to get the robot out of the maze.
    * **parse_labyrinth(file_path)** : Function that receives a relative path
    to a text file with the encoded maze matrix. We read the dimensions of the
    labyrinth and then the matrix itself.
    * **get_adjacency_matrix(Labyrinth)** : Function that receives the maze
    matrix and returns the adjacency matrix. We iterate over every cell
    of the matrix and for each cell, we build the adjacency matrix by
    checking all of the neighbours and the coresponding bits.
    * **get_link_matrix(Labyrinth)** : Function that receives the maze
    matrix and returns the link matrix. We use the adjacency matrix
    to build the link matrix easily. For each line in the adjacency matrix
    we count how many ones are on a line, and for each one in the current
    line we put in the link matrix the ratio between 1 and how many ones we
    counted on the line. 
    * **get_Jacobi_parameters(Link)** : Function that receives the link
    matrix and returns the parameters for Jacobi iteration method by
    selecting the coresponding submatrix.
    * **perform_iterative(G, c, x0, tol, max_steps)** : Function that performs
    Jacobi iteration.
    * **heuristic_greedy(start_position, probabilities, Adj)** : Function that 
    perform custom dfs and return the path to WIN. We just perform dfs, but
    we push in stack the nodes with the highest winning probability.
    * **decode_path(path, lines, cols)** : Function that decodes the path. We
    iterate over the path cells, decode each cell with the right formulas and
    add it to answer.
#

### Task2 - Linear Regression
#### Description:
* Task 2 consists in the manipulation of predictions and errors that can appear
in the computational processing of a multiple linear regression used in
determining some predictions regarding the price of some apartments.
    * **parse_data_set_file(file_path)** : Function that receives the
    relative path to a text file from where we load the data and store it
    in a cell matrix.
    * **prepare_for_regression(InitialMatrix)** : Function that receives the
    InitialMatrix and converts it into the FeatureMatrix. We just iterate
    through the matrix and build our FeatureMatrix as the statement says.
    * **linear_regression_cost_function(Theta, Y, FeatureMatrix)** : Function
    that receives the vector of weights, the vector of all actual values
    and the FeatureMatirix (the matrix with all training examples) and returns
    the cost. We just apply the formula for the cost function.
    * **parse_csv_file(file_path)** : Function that receives the relative path
    to a csv file and returns a vector with values and the InitiaMatrix.
    We read the first line to determine how many columns the matrix will have.
    Than we read the whole input and start building Y and InitialMatrix by
    iterating over the input (which is a big column cell vector) from where
    we extract the proper data.
    * **gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)** : Function that
    computes the vector of weights which performs a step depending on the
    gradient of the cost function and the value chosen for the learning rate.
    For implementation we iterate over the number of trainings and recompute
    Theta every step with the given formula.
    * **normal_equation(FeaturesMatrix, Y, tol, iter)** : Function that
    returns the vector of weights, this time computed with the conjugate
    gradient. For implementation we first check for the A matrix to be
    positive definite and then apply the given conjugate gradient algorithm.
    * **lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)** : Function
    that receives the vector of weights, the vector of all actual values
    , the FeatureMatirix (the matrix with all training examples), lambda and
    returns the cost. We just apply the formula for the cost function.
    * **ridge_regression_cost_function(Theta, Y, FeMatrix, lambda)** : Function
    that receives the vector of weights, the vector of all actual values
    , the FeatureMatirix (the matrix with all training examples), lambda and
    returns the cost. We just apply the formula for the cost function. This
    function compute what we want in a better complexity than the previous one.


#

### Task3 - MNIST 101
#### Description:
* Task 3 proposes the classification of pictures that contain handwritten
decimal digits (from 0 to 9) using a classification model, where each picture
is represented by a matrix in gray-scale format with a fixed format (20 x 20).
The chosen classifier is a small neural network that contains 3 layers
(input, hidden & output).
    * **load_dataset(path)** : The load_dataset function receives a relative
    path to a .mat file and loads that file into memory, returning the matrix
    that contains the examples used for training and for the test.
    * **split_dataset(X, y, percent)** : The split dataset function receives a
    dataset, and splits the dataset into 2 sets: a training set and a test set.
    To mix the data we generate a random permutation of columns and than
    we shuffle the data. Than we extract from it the percent given by function
    and build the dataset for training and test and the coresponding labels.
    * **initialize_weights(L_prev, L_next)** : This function returns a matrix
    with random elements in the interval (-eps, eps). It's a very easy function
    because the rand function returns values between 0 and 1 so by multiplying
    those values with eps gives the interval that we want.
    * **cost_function(params, X, y, lambda, input_layer_size,
    hidden_layer_size, output_layer_size)** : This function receives as
    parameters the data about our neural network and returns the cost and the
    accumulated gradients. It is done by first computing forward propagation,
    than computing J which is the cost function for the given parameters, and
    than computing and accumulating the gradients.
    * **predict_classes(X, weights, input_layer_size,
    hidden_layer_size, output_layer_size)** : The final function, which returns
    the predictions on the tests given as a parameter, again using forward
    propagation and taking from the output vector of 10 elements the number
    with the highest activation.
#