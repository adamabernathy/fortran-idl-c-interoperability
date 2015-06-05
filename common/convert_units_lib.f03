!234567-----------------------------------------------------------------73------|

! ---------------------------------------------------------------------
!  This module contains functions to convert common units.
!
!  2015 Adam C. Abernathy, adamabernathy@gmail.com
!  This software is licensed under Attribution-NonCommercial 4.0 
!  International (CC BY-NC 4.0).
! ---------------------------------------------------------------------

      module convert_units_lib
      
      use :: iso_c_binding ! for C/C++ interoperability 
      real(c_double), bind(c) :: inches, meters
             
      public convert_m_in
      public convert_in_m
      public convert_f_c
      
      contains

! ---------------------------------------------------------------------
!  Convert meters to inches
!
!  This function has been updated to operate with the ISO C/C++ interop
!  standards. This should have no interference with native Fortran
!  compiling. For class protection reasons, and for example purposes
!  the function name is *not* bounded, and will require an explicit
!  call from the C/C++ interface.
! --------------------------------------------------------------------- 
      
      pure real(kind=c_double) function convert_m_in(meters) &
     &   result(inches)
      
         real, parameter :: in_per_m = 39.370079
      
         real(c_double), intent(in) :: meters
         
         inches = meters * in_per_m
            
      end function convert_m_in     


! ---------------------------------------------------------------------
!  Convert inches to meters
!
!  This function is *not* C/C++ compatible, since it has not been
!  "C bounded"
! --------------------------------------------------------------------- 
      pure function convert_in_m(inches) result(meters)
      
         real, parameter :: m_per_in = 0.025400000
      
         real, intent(in) :: inches
         
         meters = inches * m_per_in
            
      end function convert_in_m     
      

! ---------------------------------------------------------------------

      end module convert_units_lib