require 'format/printf'
facing=:0
xloc=:0
yloc=:0
placed=:0
cmds=:'PLACEMOVERIGHTLEFTREPORT'
dirs=:;:'EAST NORTH WEST SOUTH'
EAST=:0
NORTH=:1
WEST=:2
SOUTH=:3

cos=:<.@:(+&0.5)@(2&o.)
sin=:<.@:(+&0.5)@(1&o.)

isOnTable=: 3 : 0
  2=+/ y = 0 0 >. y <. 4 4
)

MOVE=: 3 : 0
  newx=.xloc + cos o.facing%2
  newy=.yloc + sin o.facing%2
  if. 1=isOnTable newx,newy do.
   xloc=:newx
   yloc=:newy
  end.
  ''
)

RIGHT=: 3 : 0 
  facing=:4|<:facing
  ''
)

LEFT=: 3 : 0
  facing=:4|>:facing
  ''
)

PLACE=: 3 : 0
  newx=.0{y
  newy=.1{y
  if. 1=isOnTable newx,newy do.
    xloc=:newx
    yloc=:newy
    facing=:2{y
    placed=:1
  end.
  ''
)

REPORT=: 3 : 0
  if. 1=placed do.
    '%d,%d,%s'printf(xloc;yloc;(facing { dirs))
  end. 
  ''
)

tidy =: 3 : 0
 y =. y , (LF ~: {: y) # LF    NB. supply LF
 (y ~: CR) # y                 NB. remove CR
)

doCmds=: 3 : 0
  torun=. I. ((i.4){y) E. cmds
  if. _1=torun do. ''
  elseif. 0<torun do. out=:". (> y,' 0')
  elseif. 0=torun do. ". (> y)
  end.
  ''
)

run=: 3 : 0
 out=:doCmds ;. _2 tidy 1!:1 < y
)

run '/home/lauchlin/j64-803-user/projects/toyrobot/example1.txt'