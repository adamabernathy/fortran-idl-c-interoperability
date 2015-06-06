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
   
   meters = [10.0,25.0]  ; This is what we will convert
   inches = make_array(n_elements(meters),value = -1,/float)
   
;  We want to call 'convert_m_in' from the F2003 module. Provided
;  everything is compiled correctly, we will be able to access it as
;  such. Note: We need to have /auto_glue and /f_value to bind the 
;  variables and to ensure the correct data typs are passed.

   for i = 0, n_elements(meters) -1 do begin
      
      inches[i] = call_external('convert_units_module.so','convert_m_in', $
         meters[i], /auto_glue, /f_value, /unload)
 
;  Simply print the results.
      print, string(meters[i], format = '(f8.3)') + ' meters to ' + $
         string(inches[i], format = '(f8.3)') + ' inches'
   
   endfor
     
;  All done!
   end