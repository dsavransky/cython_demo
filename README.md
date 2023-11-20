# Cython Demo

This repository contains materials used for a short, introductory tutorial on Cython  (https://cython.readthedocs.io/en/latest/).  A recording of the tutorial is available at https://youtu.be/KEmNYlpONiE

The directory contents are as follows:

- ``cython_demo.py``: A top-level calling function for the various implementations in this repository.  The commands in this file are expected to be executed, one by one, in an IPython interactive session (https://ipython.org/) running in the root directory of this repository. 
- ``invKepler_python.py``: Reference Python implementation of Kepler time equation solution via Newton-Raphson iteration, used for benchmarking.
- ``invKepler_cython_v?.pyx``: Three different versions of the baseline Python implementation, Cythonized to different degrees.
- ``setup.py``: Setup file for building the 3 Cythonized versions.
- ``cver\invKepler_C.c``: Fully C-translated version of the baseline Python implementation (with header ``invKepler_C.h``).
- ``cver\invKepler_cython_v4.pyx``: Cython wrapper for the full C version.
- ``cver\setup.py``: Setup file for the C version of the code

In order to build the Cythonized extensions run:
```
python setup.py build_ext --inplace
```

You wil need to run this both at the root level as well as in the ``cver`` directory. 

