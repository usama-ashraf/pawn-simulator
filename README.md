Application read these commands of the following form:
- PLACE X,Y,F,C
- MOVE X
- LEFT
- RIGHT
- REPORT

command to run the program is:
- ruby runner.rb
- below is the testing data
Testing data: 
- PLACE 3,3,NORTH,BLACK
- MOVE 2
- LEFT
- MOVE 1
- REPORT
OUTPUT: 2,5,WEST,BLACK

TEST DATA:
PLACE 7,0,EAST,WHITE
MOVE 1 (INVALID)
LEFT
REPORT
OUTPUT: 7,1,NORTH,WHITE

PLACE 1,2,EAST,BLACK
MOVE 2
MOVE 1
LEFT
MOVE
REPORT
Output: 4,3,NORTH,BLACK

To exit the pawn game type "EXIT"
