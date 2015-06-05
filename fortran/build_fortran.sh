#!/bin/sh

#
#  This script builds the sharable library for use with IDL.
#  You can do this with a make file, but for simplicity and academic
#  purposes here's a script to compile the 'convert' program.
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

#  Delete the old program
rm -f convert

#  Build objects & modules
#  Remember to build the dependencies first.
gfortran -c -std=f2003 -fcheck=all ../common/convert_units_lib.f03
gfortran -c -std=f2003 -fcheck=all convert_units.f03

#  Link & compile
gfortran convert_units_lib.o convert_units.o -o convert

#  Clean up
rm -f *.o
rm -f *.mod

#  All done!