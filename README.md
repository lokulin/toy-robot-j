Toy Robot
=========

Toy Robot is a minimalistic toy robot [j language](http://www.jsoftware.com/) implementation that somewhat conforms to the specifications from the [problem description](PROBLEM.md).

Three versions are supplied.

1. [toyrobot-simple.ijs](toyrobot-simple.ijs) is an attempt at a more readable implementation that combines procedural, functional and array programming.
1. [toyrobot-terse-functional.ijs](toyrobot-terse-functional.ijs) is a quite terse implementation that is more purely array/functional as the robot is represented as an array and each "command" is represted as a verb that "returns" a new robot. 
1. [toyrobot-tacit.ijs](toyrobot-tacit.ijs) is an attempt at a more purely tacit approach.

Testing
-------

There are no tests as such, just running example inputs.

Running
-------

To run the toy robot against an input file in the j console:

```
load 'toyrobot-simple.ijs'
run '/location/of/toyrobot/example1.txt'
```
