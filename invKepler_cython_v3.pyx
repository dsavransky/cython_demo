cimport cython

cdef extern from "math.h":
    double sin(double x)

cdef extern from "math.h":
    double cos(double x)


@cython.cdivision(True)
def invKepler_cython_v3(
    double M,
    double e,
):
    """Finds eccentric anomaly from mean anomaly and eccentricity


    This method uses Newton-Raphson iteration to find the eccentric
    anomaly from mean anomaly and eccentricity, assuming a closed (0<e<1)
    orbit.

    Args:
        M (float):
            mean anomaly (rad)
        e (float):
            eccentricity (eccentricity may be a scalar if M is given as
            an array, but otherwise must match the size of M.)
    Returns:
        E (float):
            eccentric anomaly (rad)

    """

    # initial value for E
    cdef double E = M / (1 - e)
    if (e * E**2) > (6 * (1 - e)):
        E = (6 * M / e) ** (1.0 / 3.0)

    # Newton-Raphson setup
    cdef double tolerance = 1e-15
    cdef int numIter = 0
    cdef double err = 1.0
    cdef int maxIter = 100

    while (err > tolerance) and (numIter < maxIter):
        E = E - (M - E + e * sin(E)) / (e * cos(E) - 1)
        err = abs(M - (E - e * sin(E)))
        numIter += 1

    if numIter == maxIter:
        raise ValueError("Failed to converge.")

    return E

