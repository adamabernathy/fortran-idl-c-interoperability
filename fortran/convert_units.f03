!234567-----------------------------------------------------------------73------|

! ---------------------------------------------------------------------
!  Converts length from meters to inches and back again.
!  Usage:   ./convert --meters 45.0
!           ./convert --inches 1700.0
!
!  Only pass one option when running the program.
!
!  2015 Adam C. Abernathy, adamabernathy@gmail.com
!  This software is licensed under Attribution-NonCommercial 4.0 
!  International (CC BY-NC 4.0).
! ---------------------------------------------------------------------
      
      program convert_units

      use convert_units_lib, only : convert_m_in, convert_in_m
      
      implicit none
                  
      integer :: narg,cptArg              !  Init arguments
                  
!  'meters' needs to be configured for real(8) since the
!  C/C++ interoperability is defined as a c_double. Yeah it's overkill
!  for this case, but the C & Fortran interoperability is what it is. 
      real(8) :: meters
      real(4) :: inches                   ! not part of the c_binding
      
      character(len=20), parameter :: fmt_len = "(f10.4, a, f10.4, a)"
      character(len=20) :: input_value              
      
      logical :: convert_meters = .FALSE. !  Set as default
      logical :: convert_inches = .FALSE.

! ---------------------------------------------------------------------
!     Check if arguments are found
! ---------------------------------------------------------------------
      narg = command_argument_count()
      if ( narg > 0 ) then

!  Loop across options
      do cptArg=1,narg
      call get_command_argument(cptArg,input_value)
      
      select case(adjustl(input_value))

!  Known arguments
      case( "--meters" )
         convert_meters = .TRUE. ! change logical value
  
      case( "--inches" )
         convert_inches = .TRUE.
  
      case default
                  
!  Check for 'meters'
      if( convert_meters )then
         input_value = adjustl(input_value)
         read(input_value,*) meters ! convert string to REAL
         convert_meters = .TRUE.  
  
!  Check for 'inches'
      else if( convert_inches )then
         input_value = adjustl(input_value)
         read(input_value,*) inches ! convert string to REAL
         
         !print *, inches
         convert_inches = .TRUE.  
      endif 
      
      end select  !  End case select for options
      end do      !  End do loop, look for options.
      endif       !  End IF/THEN ( nargs > 0 )


! ---------------------------------------------------------------------
!  At this point we know what arguments were passed ...    
! ---------------------------------------------------------------------      
      
!  Convert meters to inches
      if ( convert_meters ) then
         inches = convert_m_in(meters)
         print fmt_len, meters, " [m] = ", inches, " [in]" 
      
!  Convert inches to meters
      elseif ( convert_inches ) then
         meters = convert_in_m(inches)
         print fmt_len, inches, " [in] = ", meters, " [m]" 
      
      else
         print *, "Please use an option"
         print *, "--meters   converts meters to inches"
         print *, "--inches   converts inches to meters"
      
      endif
      

!  All done.
      end program convert_units