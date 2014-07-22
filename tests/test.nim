import niml.opt, niml.vec

echo opt.gd(proc(x: array[2, float]) : auto = 2*(x-[2.0, 1.0]), [1.0, 0.0])
echo opt.nm(proc(x: array[2, float]) : auto = 2*(x-[2.0, 1.0]), 
  proc(x: array[2, float]) : auto = array([2.0, 2.0]), [1.0, 0.0])