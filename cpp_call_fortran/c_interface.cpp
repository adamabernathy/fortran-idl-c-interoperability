/*
 * --------------------------------------------------------------------
 * Converts length from meters to inches.
 * Usage:   ./convert
 *
 * 2015 Adam C. Abernathy, adamabernathy@gmail.com
 * This software is licensed under Attribution-NonCommercial 4.0 
 * International (CC BY-NC 4.0).
 * --------------------------------------------------------------------
*/


// Header and compiler options
   #include <stdio.h>
   #include <stdlib.h>
   #include <iostream>

/*
 * The external call is a bit different here, since we have to define
 * some interoperability information.
 *
 *         Define C/C++ library/DLL/interop code
 *         |         2 leading underscores indicating module
 *         |         | module name
 *         |         | |                 'MOD'
 *         |         | |                 |   function/sub-routine name
 *         v         v v                 v   v
*/
   extern "C" double __convert_units_lib_MOD_convert_m_in(double *);

// Onward ...
   int main(){
   
// If you want to get a value to convert from the user, here is where
// you should get the nbargs & nargs values. Since this is an academic
// example, we will just keep it simple.
   
      printf("C++ and Fortran playing together!\n");

      double meters = 10.0;   // The meters we'll convert to in.
      double inches = 0.0;

// Call the Fortran function from the convert_units_lib module.
      inches = __convert_units_lib_MOD_convert_m_in(&meters);

      printf("%3.2f [m] = %3.2f [in]\n", meters, inches);

      return 0;

   }  // End main()