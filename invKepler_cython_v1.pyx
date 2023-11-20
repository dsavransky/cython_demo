from math import sin, cos


def invKepler_cython_v1(
    M,
    e,
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
    E = M / (1 - e)
    if (e * E**2) > (6 * (1 - e)):
        E = (6 * M / e) ** (1.0 / 3.0)

    # Newton-Raphson setup
    tolerance = 1e-15
    numIter = 0
    err = 1.0
    maxIter = 100

    while (err > tolerance) and (numIter < maxIter):
        E = E - (M - E + e * sin(E)) / (e * cos(E) - 1)
        err = abs(M - (E - e * sin(E)))
        numIter += 1

    if numIter == maxIter:
        raise ValueError("Failed to converge.")

    return E
