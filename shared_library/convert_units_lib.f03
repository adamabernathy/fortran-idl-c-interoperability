!234567-----------------------------------------------------------------73------|

!
!  This module contains functions to convert common units.
!

      module convert_units_lib
      
      use :: iso_c_binding ! for C/C++ interop
      real(c_float), bind(c) :: inches
      
      !implicit none
      
      public convert_m_in
      public convert_in_m
      public convert_f_c
      
      contains

! ---------------------------------------------------------------------
!  Convert meters to inches
!
!  This function is C/C++ bound. 
! --------------------------------------------------------------------- 
      real(kind=c_float) function convert_m_in(meters) result(inches) &
     &   bind(c,name="convert_m_in")
     
         real, parameter :: in_per_m = 39.370079
      
         real(c_float), intent(in) :: meters
         !real, bind(C) :: inches
         
         inches = meters * in_per_m
            
      end function convert_m_in     


! ---------------------------------------------------------------------
!  Convert inches to meters
! --------------------------------------------------------------------- 
      function convert_in_m(inches) result(meters)
      
         real, parameter :: m_per_in = 0.025400000
      
         real, intent(in) :: inches
         real :: meters
         
         meters = inches * m_per_in
            
      end function convert_in_m     


! ---------------------------------------------------------------------
!  Convert temperature degrees Fahrenheit to Celsius       
! ---------------------------------------------------------------------
      function convert_f_c(df) result(dc)
      
         real, intent(in) :: df
         real             :: dc
         
         dc = (dc-32) / 1.8
      
      end function convert_f_c

! ---------------------------------------------------------------------

      end module convert_units_lib