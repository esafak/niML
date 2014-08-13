#_____________________________________________________________________________
#
# Linear algebra routines for nimrod
#
# Emre Safak (c) 2014
#_____________________________________________________________________________

import future, math

type
  Tfloat* = TReal
  TNum* = TNumber
  TVec*[I] = array[I, Tfloat]

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
# Converters
#_____________________________________________________________________________

converter `toCint`*[T](lst: openarray[T]): seq[cint] = map(lst, proc (x: T) : cint = cint(x))
converter `toCint`*[T](lst: varargs[T]): seq[cint] = map(lst, proc (x: T) : cint = cint(x))

#_____________________________________________________________________________
#
# Vector creation
#_____________________________________________________________________________

proc zeros*(N: int) : auto {.noSideEffect.} = result = newSeq[float](N)

proc zeros*(N: int, T : typedesc) : auto {.noSideEffect.} = result = newSeq[T](N)

proc ones*(N: int) : auto {.noSideEffect.} =
  result = newSeq[float](N)
  for i in 0..N-1: result[i] = 1.0

proc ones*(N: int, T : typedesc) : auto {.noSideEffect.} =
  result = newSeq[T](N)
  for i in 0..N-1: result[i] = 1.0

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

proc `-`*[I] (x: TVec[I]) : TVec[I] {.noSideEffect, inline.} =
  for k, v in x: result[k] = -v

template `+`*[I] (x: TVec[I]) : expr = x

proc intpow*(x: TNum, n: int): auto {.inline.} =
  case n
  of 0: result = float(x != 0)
  of 1: result = abs(x)
  of 2: result = x*x
  else: result = pow(abs(x), float(n))

proc norm*[I](x: TVec[I], root: bool = True, p: int = 2): float {.inline.} =
  result = sum(map(x, proc (it: float) : float = intpow(abs(it), p)))
  if root and p > 0: result = pow(result, 1/p)

#_____________________________________________________________________________
#
# vector-vector operations
#_____________________________________________________________________________

proc `-=`*[I] (x: var TVec[I], c: TVec[I]) : void {.inline.} =
  for i in x.low..x.high: x[i] -= c[i] # what if c's indices are different?

proc `+=`*[I] (x: var TVec[I], c: TVec[I]) : void {.inline.} =
  for i in x.low..x.high: x[i] += c[i] # what if c's indices are different?

proc `+`*[I] (x, y: TVec[I]) : TVec[I] {.noSideEffect.} = 
  for i in x.low..x.high: result[i] = x[i] + y[i]

proc `-`*[I] (x, y: TVec[I]) : TVec[I] {.noSideEffect.} = 
  for i in x.low..x.high: result[i] = x[i] - y[i]

proc `./`*[I] (x, y: TVec[I]) : TVec[I] {.noSideEffect.} = 
  for i in x.low..x.high: result[i] = x[i]/y[i]

proc `.*`*[I] (x, y: TVec[I]) : float {.noSideEffect.} = 
  for i in x.low..x.high: result += x[i] * y[i]

proc `~=`*[I] (x, y: TVec[I], tolerance: float = 1e-6) : bool {.noSideEffect.} = 
  for i in x.low..x.high:
    if abs(x[i] - y[i]) >= tolerance: return false
  result = true

#_____________________________________________________________________________
#
# scalar-vector operations
#_____________________________________________________________________________

proc `-`*[I] (x: TVec[I], c: TNum) : TVec[I] {.noSideEffect.} =
  for i in x.low..x.high: result[i] = x[i] - float(c)

proc `*`*[I] (x: TVec[I], c: TNum) : TVec[I] {.noSideEffect.} =
  for i in x.low..x.high: result[i] = x[i] * float(c)

proc `+`*[I] (x: TVec[I], c: TNum) : TVec[I] {.noSideEffect.} =
  for i in x.low..x.high: result[i] = x[i] + float(c)

proc `/`*[I] (x: TVec[I], c: TNum) : TVec[I] {.noSideEffect.} =
  for i in x.low..x.high: result[i] = x[i] / float(c)

proc `/`*[I] (c: TNum, x: TVec[I]) : TVec[I] {.noSideEffect.} =
  for i in x.low..x.high: result[i] = float(c)/x[i]

#_____________________________________________________________________________
#
# commutativity definitions
#_____________________________________________________________________________

template `*`*[I] (c: TNum, x: TVec[I]) : auto = x*c
template `+`*[I] (c: TNum, x: TVec[I]) : auto = x+c
template `-`*[I] (c: TNum, x: TVec[I]) : auto = -x+c