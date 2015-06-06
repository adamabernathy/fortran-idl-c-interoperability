#!/bin/sh

#
#  This script builds the sharable library for use with IDL.
#

#  Delete the old library
rm -f convert_units_idl.so

#  Check files
gfortran -c -std=f2003 -fcheck=all convert_units_lib.f03

#  Build ouputs
gfortran -c convert_units_lib.f03

#  Link
gcc -shared -fPIC convert_units_lib.o -o convert_units_idl.so

#  Clean up
rm -f convert_units_lib.o


#  All done!