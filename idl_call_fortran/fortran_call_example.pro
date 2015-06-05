;
;  Fortran code call example.
;  
;  This example will convert meters to inches.
;
;  Requires: convert_units_lib.so, see convert_units_lib.f03 and
;  build.sh for compiler details.
;
;  2015 Adam C. Abernathy, adamabernathy@gmail.com
;  This software is licensed under Attribution-NonCommercial 4.0 
;  International (CC BY-NC 4.0).
; ---------------------------------------------------------------------

   pro fortran_call_example
   
   meters = 10.0  ; This is what we will convert

;  We want to call 'convert_m_in' from the F2003 module. Provided
;  everything is compiled correctly, we will be able to access it as
;  such. Note: We need to have /auto_glue and /f_value to bind the 
;  variables and to ensure the correct data typs are passed.

   inches = call_external('convert_units_lib.so','convert_m_in', $
      meters, /auto_glue, /f_value, /unload)
   
;  Simply print the results.
   print, string(meters, format = '(f8.3)') + ' meters to ' + $
      string(inches, format = '(f8.3)') + ' inches'
   
;  All done!
   end