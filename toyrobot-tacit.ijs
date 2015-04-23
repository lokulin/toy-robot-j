NB. An attempt at a more tacit/functional approach
NB. At the moment PLACE does not work unless it is the first command in the input file.
NB. An example interactive run would be REPORT MOVE MOVE MOVE LEFT MOVE PLACE 0,0,NORTH

require 'format/printf'
NORTH=:0
EAST=:o.0.5
SOUTH=:o.1
WEST=:o.1.5
dirs=:;: 'NORTH EAST SOUTH WEST'
cmds=:;:'PLACE MOVE RIGHT LEFT REPORT'

cos=:<.@:(+&0.5)@(2&o.)
sin=:<.@:(+&0.5)@(1&o.)

NB. Lots of braces, could be much neater!
MOVE=:((0>.4<.((0{[)+(]sin(2{[)[))),(0>.4<.((1{[)+(]cos(2{[)[))),(2{[),(3{[))
RIGHT=:((0{[),(1{[),((]o._0.5)+2{[),3{[)
LEFT=:((0{[),(1{[),((]o.0.5)+2{[),3{[)
PLACE=:((0{[),(1{[),(2{[),(0=((0>(0{[))+(4<(0{[))+(0>(1{[))+(4<(1{[)))))
REPORT=: 3 : 0
 '%d,%d,%s'printf(0{y);(1{y);(((2{y)%(o.0.5)) { dirs)
 y
)

tidy =: 3 : 0
 y =. y , (LF ~: {: y) # LF    NB. supply LF
 (y ~: CR) # y                 NB. remove CR
)

NB. Read the commands in, tidy up, reverse order
cmdlist=:|. < ;._2 tidy 1!:1 < '/path/to/toyrobot/example1.txt'
NB. Find only known commands
cmdmask=:+/cmds=/0 { |: ;: > cmdlist
NB. Pick out only known commands
cleancmds=:(I. cmdmask) { cmdlist

NB. To run use ". ,,.>cleancmds

NB. Trying to figure out a way to cap the PLACE command
NB. dirmask=:+/dirs=/ ;: > cmdlist
NB. ;,/ |: 2 5 $ cmds,' ] ';' ';' ';' ';' '
