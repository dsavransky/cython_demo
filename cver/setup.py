from setuptools import setup, Extension
from Cython.Build import cythonize

setup(
    ext_modules=cythonize(
        Extension("invKepler_cython_v4", ["invKepler_cython_v4.pyx", "invKepler_C.c"]),
        annotate=True,
        compiler_directives={"language_level": "3"},
    ),
)
