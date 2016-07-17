# Path Of Lowest Cost
Pillar Technology Application Kata

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
