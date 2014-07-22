#_____________________________________________________________________________
#
# Linear algebra routines for nimrod
#
# Emre Safak (c) 2014
#_____________________________________________________________________________

import future, math

type 
  TVec*[I] = array[I, float]
  TNum* = int or float

#_____________________________________________________________________________
#
# Helper functions
#_____________________________________________________________________________

proc `$`*[I](x: TVec[I]): string {.noSideEffect.} =
  result = "["
  for key in x: result &=  ' ' & $(key) & ','
  result[result.high] = ']'

#_____________________________________________________________________________
#
# Vector creation
#_____________________________________________________________________________

proc zeros*(N: int) : auto {.noSideEffect.} =
  result = array(0..N-1, float)
  for val in result: val = 0.0

proc ones*(N: int) : auto {.noSideEffect.} =
  result = array[0..N-1, float]
  for val in result: val = 1.0

template arange*(N: int) : seq[int] = arange(0, N, int)

template arange*(N1: int, N2: int) : seq[int] = arange(N1, N2, int)

proc arange*[T](N: int, typ: typedesc[T]) : seq[T] = arange(0, N, T)

proc arange*[T](N1: int, N2: int, typ: typedesc[T]) : seq[T] =
  if N2 < N1: raise newException(EInvalidValue, 
    "The upper limit must exceed the lower limit!")

  result = newSeq[T](N2-N1)
  for k, v in result: result[k] = T(k+N1)

#_____________________________________________________________________________
#
# unary operations
#_____________________________________________________________________________

proc `-`*[I] (x: array[I, TNum]) : array[I, TNum] {.noSideEffect, inline.} =
  for k, v in x: result[k] = -v

proc intpow*(x: TNum, n: int): auto {.inline.} =
  case n
  of 0: result = float(x != 0)
  of 1: result = abs(x)
  of 2: result = x*x
  else: result = pow(abs(x), float(n))

proc norm*[I](x: TVec[I], root: bool = True, p: int = 2): float {.inline.} =
  # result = x.mapIt(float, intpow(it, p)).sum
  result = sum(map(x, proc (it: float) : float = intpow(abs(it), p)))
  if root and p > 0: result = pow(result, 1/p)

#_____________________________________________________________________________
#
# vector-vector operations
#_____________________________________________________________________________

proc `-=`*[I] (x: var array[I, TNum], c: array[I, TNum]) : void {.inline.} =
  # echo "Substracting ", c, " from ", x
  for k, v in x: x[k] -= c[k]
  # echo "Got ", x

proc `+=`*[I] (x: var array[I, TNum], c: array[I, TNum]) : void {.inline.} =
  for k, v in x: x[k] += c[k]

proc `+`*[I] (x, y: TVec[I]) : TVec[I] {.noSideEffect.} = 
  # result = zip(@x, @y).map(proc (t: tuple[a, b: float]): T = t.a + t.b)
  # result = zip(@x, @y).mapIt(float, it[0] + it[1]) #.map((a, b) => a + b) #
  result = x
  for k, v in y: result[k] += v     

proc `-`*[I] (x, y: TVec[I]) : TVec[I] {.noSideEffect.} = 
  # result = zip(@x, @y).map(proc (t: tuple[a, b: float]): T = t.a - t.b)
  result = x
  for k, v in y: result[k] -= v

proc `./`*[I] (x, y: TVec[I]) : TVec[I] {.noSideEffect.} = 
  result = x
  for k, v in y: result[k] /= y[k]

proc `.*`*[I] (x, y: TVec[I]) : float {.noSideEffect.} = 
  result = 0
  for k, v in x: result += v*y[k]

#_____________________________________________________________________________
#
# scalar-vector operations
#_____________________________________________________________________________

proc `-`*[I] (x: TVec[I], c: TNum) : TVec[I] {.noSideEffect.} =
  result = x
  for i in x.low..x.high: result[i] -= float(c)

proc `*`*[I] (x: TVec[I], c: TNum) : TVec[I] {.noSideEffect.} =
  result = x
  for i in x.low..x.high: result[i] *= float(c)

proc `+`*[I] (x: TVec[I], c: TNum) : TVec[I] {.noSideEffect.} =
  result = x
  for i in x.low..x.high: result[i] += float(c)

proc `/`*[I] (x: TVec[I], c: TNum) : TVec[I] {.noSideEffect.} =
  result = x
  for i in x.low..x.high: result[i] /= float(c)

proc `/`*[I] (c: TNum, x: TVec[I]) : TVec[I] {.noSideEffect.} =
  result = x
  for i in x.low..x.high: result[i] = float(c)/result[i]

#_____________________________________________________________________________
#
# commutativity definitions
#_____________________________________________________________________________

template `*`*[I, T] (c: TNum, x: array[I, T]) : auto = x*c
template `+`*[I, T] (c: TNum, x: array[I, T]) : auto = x+c
template `-`*[I, T] (c: TNum, x: array[I, T]) : auto = -x+c