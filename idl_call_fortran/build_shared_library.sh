#!/bin/sh

#
#  This script builds the sharable library for use with IDL.
#  You can do this with a make file, but for simplicity and academic
#  purposes here's a script to build the shared library for use with
#  IDL or other applications that support C/C++ interoperability.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
#  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
#  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
#  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS 
#  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN 
#  ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
#  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
#  THE SOFTWARE.
#

#  Delete the old library
rm -f convert_units_module.so

#  Build objects
gfortran -c -std=f2003 -fcheck=all convert_units_lib.f03
gfortran -c convert_units_lib.f03

#  Create the shared (dynamic) library
gcc -shared -fPIC convert_units_lib.o -o convert_units_module.so

#  Clean up
rm -f *.o
rm -f *.mod


#  All done!