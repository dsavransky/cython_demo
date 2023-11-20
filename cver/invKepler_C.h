/*=================================================================
* invKepler_C   Invert Kepler's time equation for elliptical orbits
*               using Newton-Raphson iteration.
* 
* invKepler_C(M, e, E)
*   M       double  Mean anomaly (rad)
*   e       double  eccentricity
*   E       double  output - eccentric anomaly (rad)
*=================================================================*/

int invKepler_C(double M, double e, double* Eout);

