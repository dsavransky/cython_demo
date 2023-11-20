import numpy as np

M = np.pi/3
e = 0.999

from invKepler_python import invKepler_python
%timeit res0 = invKepler_python(M,e)
#1.87 µs ± 93.7 ns per loop (mean ± std. dev. of 7 runs, 100,000 loops each)

#python setup.py build_ext --inplace

from invKepler_cython_v1 import invKepler_cython_v1
%timeit res1 = invKepler_cython_v1(M,e)
#1.21 µs ± 10.9 ns per loop (mean ± std. dev. of 7 runs, 1,000,000 loops each)

from invKepler_cython_v2 import invKepler_cython_v2
%timeit res2 = invKepler_cython_v2(M,e)
#1.11 µs ± 20.6 ns per loop (mean ± std. dev. of 7 runs, 1,000,000 loops each)

from invKepler_cython_v3 import invKepler_cython_v3
%timeit res3 = invKepler_cython_v3(M,e)
#257 ns ± 4.03 ns per loop (mean ± std. dev. of 7 runs, 1,000,000 loops each)

from cver.invKepler_cython_v4 import invKepler_cython_v4
%timeit res4 = invKepler_cython_v4(M,e)
#243 ns ± 4.35 ns per loop (mean ± std. dev. of 7 runs, 1,000,000 loops each)

