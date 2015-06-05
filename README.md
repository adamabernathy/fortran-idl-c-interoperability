# ISO C/C++ & Fortran Interoperability Examples
This is a collection of code examples that show how to incorporate Fortran 9x/2003 code into C/C++ and Exelis IDL.

## What’s in here?
You will need the entire repository for all the demos to work. The common folder contains the ‘convert_units_lib.f03’ which is the Fortran module containing the functions that will be shared via “C” binding.

### Build scripts
Each folder has a build script. These are essentially make files, but simplified for academic purposes.

### fortran
Since the core of this program is written in Fortran 2003, this example is more extensive and uses the entire ‘convert_units_lib.f03’ module.

### cpp_call_fortran
The example here demonstrates how to call a Fortran function that has been “C bounded” from C/C++.

### idl_call_fortran
The example here demonstrates how to call a Fortran function that has been “C bounded” from IDL. 

## Further work
Add examples for passing structures and complex arrays. 

## Compiler notes
All the code has been written and compiled with GNU Fortran (GCC) 4.8.2, and G++ Apple LLVM version 6.1.0 (clang-602.0.53) (based on LLVM 3.6.0svn). IDL versions 8.2 and 8.2.3 have been tested with this code.

## Licence
This code is licensed under Attribution-NonCommercial 4.0 International (CC BY-NC 4.0). The build scripts are public domain and “hold harmless”. See license in the scripts.
