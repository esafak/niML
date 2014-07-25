import niml.opt, niml.vec, niml.cblas

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