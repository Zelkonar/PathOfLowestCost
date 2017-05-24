 Path Of Lowest Cost
Pillar Technology Application Kata

## The Challenge

**The Problem**

The objective is to find the path of lowest cost when moving across a grid. For this challenge, you are provided a grid of integers where each integer represents the amount of cost encountered at a given point on the grid. A path enters the grid from the left (at any point) and passes through the grid to the right, moving only one column per round. Movement is always to an adjacent column, meaning the path can proceed horizontally or diagonally. For the sake of this challenge, we assume the first and last row are also adjacent. Effectively, the grid “wraps”.

The total cost of a path is the sum of the integers in each of the visited cells. The solution needs to handle grids of various sizes with a minimum of 1 row and 5 columns up to 10 rows and 100 columns. If in the next move, the total cost will exceed 50, that path is abandoned.

The purpose of this challenge is to find the path of least cost (that is, the path with the lowest total cost of any possible path). The paths of least cost through two slightly different 5 x 6 grids are shown below. The grid values differ only in the bottom row. The path for the grid on the right takes advantage of the adjacency between the first and last rows.

**Input**

The input consists of a sequence of row specifications. Each row is represented by a series of delimited integers on a single line. Note: integers are not restricted to being positive

**Output**

Three lines should be output for each matrix specification. The first line is either “Yes” or “No” to indicate the path made it all the way through the grid. The second line is the total cost. The third line shows the path taken as a sequence of n delimited integers, each representing the rows traversed in turn. If there is more than one path of least cost, only one path need be shown in the solution.

Example

    Input:
    3 4 1 2 8 6
    6 1 8 2 7 4
    5 9 3 9 9 5
    8 4 1 3 2 6
    3 7 2 8 6 4

    Output:
    Yes
    16
    1 2 3 4 4 5

    Input:
    3 4 1 2 8 6
    6 1 8 2 7 4
    5 9 3 9 9 5
    8 4 1 3 2 6
    3 7 2 1 2 3

    Output:
    Yes
    11
    1 2 1 5 4 5

    Input:
    19 10 19 10 19
    21 23 20 19 12
    20 12 20 11 10

    Output:
    No
    48
    1 1 1


## Running

**Environment**

The project was made using XCode 7 and Swift 2.2, and thus will run best using XCode, and thus on an Apple Computer.

**Unit Tests**

There is no 'main' program, but rather the kata is considered complete due to the tests

Ensure that the project target is *PathOfLowestCostTest*

⌘+U will run all unit tests in the *PathOfLowestCostTest* directory

These tests should prove that the program is functional as per business requirements

**Performance Tests**

Like Unit Tests, change the project target to *PathOfLowestCostPerformance*, and run using ⌘+U

These prove that the program runs within an acceptable time based on requirements: Grids from 1x5 to 10x100

Performance may differ as my machine specs are likely different, but they should still run *fast* in that each

    measureBlock{ [code] }

should report < 1s run times

## Assumptions
It is assumed that a path that travels farthest has higher priority than a lower cost path that travels a shorter distance. This was due to a discussion with my contact at Pillar.

Example

    +----+----+----+
    | 1  | 1  | 1  |
    +----+----+----+
    | 5  | 50 | 50 |
    +----+----+----+
    | 1  | 50 | 50 |
    +----+----+----+
    | 5  | 50 | 50 |
    +----+----+----+

Output:

    Yes
    3
    1 1 1

Incorrect Output:

    No
    1
    3
