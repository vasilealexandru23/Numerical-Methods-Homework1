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
    * 
#

### Task2 - MNIST 101
#### Description:
* Task 3 proposes the classification of pictures that contain handwritten
decimal digits (from 0 to 9) using a classification model, where each picture
is represented by a matrix in gray-scale format with a fixed format (20 x 20).
The chosen classifier is a small neural network that contains 3 layers
(input, hidden & output).

#