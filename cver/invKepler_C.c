#include <math.h>
#include <stdio.h>
#include <string.h>

/*=================================================================
* invKepler_C   Invert Kepler's time equation for elliptical orbits
*               using Newton-Raphson iteration.
* 
* invKepler_C(M, e, E)
*   M       double  Mean anomaly (rad)
*   e       double  eccentricity
*   E       double  output - eccentric anomaly (rad)
*=================================================================*/

int invKepler_C(double M, double e, double* Eout){

    /*initialize E*/
    double E =  M / (1 - e);
    if (e*E*E > 6*(1 - e)){
        E = pow(6*M/e, 1.0/3.0);
    }

    /*set up iteration*/ 
    double tolerance = 1e-15;
    int numIter = 0;
    int maxIter = 100;
    double err = 1.0;

    /* iterate */
    while ((err > tolerance) && (numIter < maxIter)) {
        E = E - (M - E + e*sin(E))/(e*cos(E)-1);
            err = fabs(M - (E - e*sin(E)));
            numIter += 1;
    }

    *Eout = E;
    
    return numIter;

}

