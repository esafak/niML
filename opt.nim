#_____________________________________________________________________________
#
# Numerical optimization routines for nimrod 
#
# Emre Safak (c) 2014
#_____________________________________________________________________________

import vec

type
  EConvergenceError = object of EBase
  FNum*[I] = proc (void : TVec[I]) : TVec[I]

const MAX_ITER = 1000

proc gd*[I] (grad: FNum[I], x0: TVec[I], iters : int = MAX_ITER, 
  tol: float = 1e-6, EPS : float = 1e-1): TVec[I] =
  ## Gradient descent
  var (n, xn) = (0, x0)
  var xo = xn + 2*TOL
  while n < min(iters, MAX_ITER) and norm(xn - xo) > tol:
    xo = xn
    xn -= EPS*grad(xn)
    n += 1
  # echo n
  result = xn
  if n == MAX_ITER: raise newException(EConvergenceError, 
    "Failed to converge after " & $n & " iterations.")

proc nm*[I] (grad: FNum[I], hess: FNum[I], x0: TVec[I],
  iters : int = MAX_ITER, tol: float = 1e-6): TVec[I] =
  ## Newton's method
  var (n, xn) = (0, x0)
  var xo = xn + 2*TOL
  while n < min(iters, MAX_ITER) and norm(xn - xo) > tol:
    xo = xn
    xn -= grad(xn)./hess(xn)
    n += 1
  # echo n
  result = xn
  if n == MAX_ITER: raise newException(EConvergenceError, 
    "Failed to converge after " & $n & " iterations.")