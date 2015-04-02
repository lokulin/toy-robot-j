require 'format/printf'
EAST=:0
NORTH=:o.0.5
WEST=:o.1
SOUTH=:o.1.5
dirs=:;: 'EAST NORTH WEST SOUTH'
cmds=:;:'PLACE MOVE RIGHT LEFT REPORT'

cos=:<.@:(+&0.5)@(2&o.)
sin=:<.@:(+&0.5)@(1&o.)

MOVE=:((0>.4<.((0{[)+(]cos(2{[)[))),(0>.4<.((1{[)+(]sin(2{[)[))),(2{[),(3{[))
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

cmdlist=:|. < ;._2 tidy 1!:1 < 'C:\Users\lauchlin\j64-803-user\projects\toyrobot\example1.txt'
cmdmask=:+/cmds=/0 { |: ;: > cmdlist
cleancmds=:(I. cmdmask) { cmdlist
". ,,.>cleancmds

dirmask=:+/dirs=/ ;: > cmdlist
;,/ |: 2 5 $ cmds,' ] ';' ';' ';' ';' '