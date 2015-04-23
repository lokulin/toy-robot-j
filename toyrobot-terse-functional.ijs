NB. A terse functional implementation where robot is represented as an array.

require 'format/printf'
robot=:0,0,0,0
NORTH=:0
EAST=:o.0.5
SOUTH=:o.1
WEST=:o.1.5
cmds=:'PLACEMOVERIGHTLEFTREPORT'
dirs=:;: 'NORTH EAST SOUTH WEST'

cos=:<.@:(+&0.5)@(2&o.)
sin=:<.@:(+&0.5)@(1&o.)

MOVE=: 3 : 'robot=:((0>.4<.((0{[)+(]sin(2{[)[))),(0>.4<.((1{[)+(]cos(2{[)[))),(2{[),(3{[)) y'
RIGHT=: 3 : 'robot=:((0{[),(1{[),((]o._0.5)+2{[),3{[) y'
LEFT=: 3 : 'robot=:((0{[),(1{[),((]o.0.5)+2{[),3{[) y'
PLACE=: 3 : 'robot=:((0{[),(1{[),(2{[),(0=((0>(0{[))+(4<(0{[))+(0>(1{[))+(4<(1{[))))) y'
REPORT=: 3 : 0
 '%d,%d,%s'printf(0{robot);(1{robot);(((2{robot)%(o.0.5)) { dirs)
)

tidy =: 3 : 0
 y =. y , (LF ~: {: y) # LF    NB. supply LF
 (y ~: CR) # y                 NB. remove CR
)

doCmds=: 3 : 0
 torun=. I. ((i.4){y) E. cmds
 if. _1=torun do. ''
 elseif. 0<torun do. ". (> y,' robot')
 elseif. 0=torun do. ". (> y)
 end.
)

run=: 3 : 0
 robot=:0,0,0,0
 out=: doCmds ;. _2 tidy 1!:1 < y
)
