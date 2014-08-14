#_____________________________________________________________________________
#
# Linear algebra routines for nimrod
#
# Emre Safak (c) 2014
#_____________________________________________________________________________

import vec

type TMatrix*[R, C: range; T: TNumber] = array[C, array[R, T]]

#_____________________________________________________________________________
#
# Ancillary routines
#_____________________________________________________________________________

# used to cast arrays to their base pointers for C procedures
template `&:`*(x: expr): expr = 
  when type(x[0]) is array:
    cast[ptr type(x[0][0])](addr x)
  else:
    cast[ptr type(x[0])](addr x)

#_____________________________________________________________________________
#
# Matrix creation routines
#_____________________________________________________________________________

# proc zeros*(n, m: int) : auto {.noSideEffect.} = result = newSeq[float](N)

# proc zeros*(n, m: int, T : typedesc) : auto {.noSideEffect.} = result = newSeq[T](N)

#_____________________________________________________________________________
#
# Informational routines
#_____________________________________________________________________________

proc shape*[R,C,T](x: TMatrix[R,C,T]) : array[0..1, int] =
  result[0] = R.high-R.low+1
  result[1] = C.high-C.low+1
#_____________________________________________________________________________
#
# Manipulation routines
#_____________________________________________________________________________

