from setuptools import setup
from Cython.Build import cythonize

setup(
    ext_modules=cythonize(
        ["invKepler_cython_v1.pyx", "invKepler_cython_v2.pyx", "invKepler_cython_v3.pyx"],
        annotate=True,
        compiler_directives={"language_level": "3"},
    ),
)
