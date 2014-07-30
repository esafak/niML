import niml.opt, niml.vec, niml.cblas, niml.clapack

# Create some vectors
echo vec.zeros(10)
echo vec.ones(10)

echo opt.gd(proc(x: array[2, float]) : auto = 2*(x-[2.0, 1.0]), [1.0, 0.0])
echo opt.nm(proc(x: array[2, float]) : auto = 2*(x-[2.0, 1.0]), 
    proc(x: array[2, float]) : auto = array([2.0, 2.0]), [1.0, 0.0])

# Check BLAS functionality -- for internal use.
var data = [1.0,1,1]
# Let's multiply data entrywise by a scalar using DSCAL:
cblas.dscal(3, 4.323, data, 1)
echo data.repr

# Check LAPACK functionality -- for internal use.

# Example from http://www.nag.com/lapack-ex/node5.html
var a : array[0..15, doublereal] = [1.8.doublereal, 5.25, 1.58, -1.11, 2.88, -2.95, -2.69, -0.66, 
                            2.05, -0.95, -2.9, -0.59, -0.89, -3.8, -1.04, 0.8]
# var a : array[0..15, doublereal] = [1.80, 2.88, 2.05, -0.89, 5.25, -2.95, -0.95, -3.80, 1.58, -2.69, -2.90, -1.04, -1.11, -0.66, -0.59, 0.80]
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

echo clapack.dgesv(n, nrhs, &:a, lda, &:ipiv, &:b, ldb, info)
# echo clapack.dgesv(addr n, addr nrhs, a, addr lda, ipiv, b, addr ldb, addr info)
echo b.repr, ipiv.repr, info