cdef extern from "invKepler_C.h":
    int invKepler_C(double M, double e, double* E)

cimport cython

def invKepler_cython_v4(
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

    cdef double E = 0;
    cdef int numIter = invKepler_C(M, e, &E);

    assert (numIter < 100), "Failed to converge."

    return E

