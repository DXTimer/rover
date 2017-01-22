# TW Tech Test

## Problem: Mars Rover

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.
A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.
In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same heading.

### Input:
* The first line of input is the upper-right coordinates of the plateau, the lower- left coordinates are assumed to be 0,0.
* The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau.
* The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation.
* Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.
Output: The output for each rover should be its final co-ordinates and heading.
￼￼
### Test Input:
```
55
12N
LMLMLMLMM
33E
MMRMMRMRRM
```
### Expected Output:
```
13N
51E
```
## Assumption

My solution is based on a few assumptions that are provided in the task info:
* The first line of input is the `upper-right coordinates of the plateau`, `the lower-left coordinates are assumed to be 0,0 ` - I will not be dealing with negative coordinates.
* `Each rover has two lines of input` - 1st line is rover's position, 2nd is instructions.
* `The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation` - Hence why the example below works in this situation based on such assumption:
```
def parse_text
   read_file.each_slice(2).map do |(position, instructions)|
      x, y, direction = position.split(' ')
      new_position = [x.to_i, y.to_i, direction]
      new_instructions = instructions.split('')
      [new_position, new_instructions]
   end
end
```
* It's safe to assume that the last letter is between N, E, S or W since `rover spins 90 degrees left or right respectively`.

## Approach

I decided to split the solution into 3 classes: Rover, Input and Controller.
* The `Input` class takes in a text file with the description of the mission, and then parses through the text file to extract useful/relevant information, ready for the `Controller` class to use.
* The `Controller` class then uses the inputs it receives to instruct each rover to follow.
* Once the `Rover` class is instantiated, it will use the inputs provided by the `Controller` to make the move.
*  There's a method that checks the position of the rover to ensure it does not go out of bound, according to the `upper-right coordinates of the plateau`, before it makes the next move. If it's heading out of bound, the execution of any consecutive instructions will stop, the rover will then return its current coordinates.
* Finally, once the mission has been completed each rover will return their final coordinates and in turn reports the results back to the `Controller`.

## Instructions

1. Make sure you have Ruby 2.1 or greater installed
2. Navigate to the directory
2. run `bundle`
3. To run the test, run `rspec`
4. To demo the solution like you would in irb, run `ruby demo.rb`
