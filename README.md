# niML

niML is eventually going to be a machine learning library for nimrod. Currently it only provides numerical optimization functionality.

## Example

Let's find the minimum of the function y(x) = (x-x_0)^2 for x_0 = (2,1) using gradient descent and Newton's method. For this we will have to pass the gradient and Hessian of the function.

```nimrod
import niml.opt, niml.vec

echo opt.gd(proc(x: array[2, float]) : auto = 2*(x-[2.0, 1.0]), [1.0, 0.0])
echo opt.nm(proc(x: array[2, float]) : auto = 2*(x-[2.0, 1.0]), 
  proc(x: array[2, float]) : auto = array([2.0, 2.0]), [1.0, 0.0])
```
The result is
```
[ 1.9999976054757174e+00, 9.9999760547571737e-01]
[ 2.0000000000000000e+00, 1.0000000000000000e+00]
```

## To do/roadmap

There's obviously a lot to do, and you can help.

* Comment the code.
* Write unit tests.
* Create a package.
* File bug reports.
* Write ML routines.
* Add multi-threading.
* Support PLASMA/MAGMA.

# License

This software is released under the [GNU GPL v2.0](http://choosealicense.com/licenses/gpl-2.0/) license.