#_____________________________________________________________________________
#
# Create some vectors
#_____________________________________________________________________________

import niml.vec

echo vec.zeros(10)
echo vec.ones(10)

#_____________________________________________________________________________
#
# Create some matrices
#_____________________________________________________________________________

# import niml.mat

#_____________________________________________________________________________
#
# Check the numerical optimization routines
#_____________________________________________________________________________

import niml.opt

echo opt.gd(proc(x: array[2, float]) : auto = 2*(x-[2.0, 1.0]), [1.0, 0.0])
echo opt.nm(proc(x: array[2, float]) : auto = 2*(x-[2.0, 1.0]), 
    proc(x: array[2, float]) : auto = array([2.0, 2.0]), [1.0, 0.0])

#_____________________________________________________________________________
#
# Check BLAS functionality -- for internal use. 
#_____________________________________________________________________________

import niml.cblas

var data = [1.0,1,1]
# Let's multiply data entrywise by a scalar using DSCAL:
cblas.dscal(3, 4.323, data, 1)
echo data.repr

#_____________________________________________________________________________
#
# Check LAPACK functionality -- for internal use.
#_____________________________________________________________________________

import niml.clapack

# Example from http://www.nag.com/lapack-ex/node5.html
var a : array[0..15, doublereal] = [1.8.doublereal, 5.25, 1.58, -1.11, 2.88, -2.95, -2.69, -0.66, 
                            2.05, -0.95, -2.9, -0.59, -0.89, -3.8, -1.04, 0.8]
var a_tr : array[0..15, doublereal] = [1.8.doublereal, 2.88, 2.05, -0.89, 5.25, -2.95, -0.95, -3.80, 1.58, -2.69, -2.90, -1.04, -1.11, -0.66, -0.59, 0.80]
var b : array[0..3, doublereal] = [9.52.doublereal, 24.35, 0.77, -6.22]
var ipiv : array[0..3, cint]
var (n, nrhs, lda, ldb) = (4.integer, 1.integer, 4.integer, 4.integer)

# http://www.cs.rochester.edu/~bh/cs400/using_lapack.html
# var a : array[0..8, doublereal] = [76.0, 25, 11, 27, 89, 51, 18, 60, 32]
# # var a : array[0..8, doublereal] = [76.0, 27, 18, 25, 89, 60, 11, 51, 32]
# var b : array[0..2, doublereal] = [10.0, 7, 43]
# var ipiv : array[0..2, cint]
# var (n, nrhs, lda, ldb) = (3.integer, 1.integer, 3.integer, 3.integer)

# var a : array[0..8, doublereal] = [1.0,3,2,3,5,4,-2,6,3]
# # var a : array[0..8, doublereal] = [1.0,3,-2,3,5,6,2,4,3]
# var b : array[0..2, doublereal] = [5.0,7,8]
# var ipiv : array[0..2, cint] 
# var (n, nrhs, lda, ldb) = (3.integer, 1.integer, 3.integer, 3.integer)

var info : integer # array[0..15, doublereal]

discard clapack.dgesv(n, nrhs, &:a, lda, &:ipiv, &:b, ldb, info)
# echo clapack.dgesv(addr n, addr nrhs, a, addr lda, ipiv, b, addr ldb, addr info)
echo b.repr, ipiv.repr, info

import niml.lapacke
b = [9.52.doublereal, 24.35, 0.77, -6.22]
discard clapack.dgesv(n, nrhs, &:a_tr, lda, &:ipiv, &:b, ldb, info)
echo b.repr

#_____________________________________________________________________________
#
# Check the linear algebra routines
#_____________________________________________________________________________

import niml.mat

const
  Ma = [[1.0, 2.0],
        [3.0, 4.0]]
  Mb = [[1.0,  2,  3,  4],
       [ 4.0,  5,  6,  7],
       [ 7.0,  8,  9, 10],
       [10.0, 11, 12, 13]]
  Mc = [[0.0,  1,  2,  3,  4],
       [ 5.0,  6,  7,  8,  9],
       [10.0, 11, 12, 13, 14],
       [15.0, 16, 17, 18, 19],
       [20.0, 21, 22, 23, 24]]

echo "And now for some matrix tests!"

echo Mc.shape.repr
