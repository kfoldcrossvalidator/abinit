# Copyright (C) 2010-2011 ABINIT group (Yann Pouillon)
# This file is distributed under the terms of the
# GNU General Public License, see ~abinit/COPYING
# or http://www.gnu.org/copyleft/gpl.txt .
# For the initials of contributors, see ~abinit/doc/developers/contributors.txt .
# 
# The purpose of this script is to create a new module
# ${module_name}.F90, from the embedded template, 
# where "${module_name}" is the argument of the script.
# Suppose that one is in a source directory, and that
# Utility/template.F90 is accessible as ../Utilities/template.F90

if [ $# -lt 1 ]
then
	echo "Usage: mkmodule module_name [routine_name]"
	exit 1
fi

module_name="${1}"
routine_name="${2}"
test "${routine_name}" = "" && routine_name="dummy_routine"
this_year=`date '+%Y'`

echo -n "mkmodule: creating ${module_name}.F90..."

cat > ${module_name}.F90 <<EOF
!{\src2tex{textfont=tt}}
!!****m* ABINIT/${module_name}
!! NAME
!!  ${module_name}
!!
!! FUNCTION
!!  FIXME: add description.
!!
!! COPYRIGHT
!!  Copyright (C) ${this_year} ABINIT group (FIXME: add author)
!!  This file is distributed under the terms of the
!!  GNU General Public License, see ~abinit/COPYING
!!  or http://www.gnu.org/copyleft/gpl.txt .
!!
!! NOTES
!!
!! PARENTS
!!  Will be filled automatically by the parent script
!!
!! CHILDREN
!!  Will be filled automatically by the parent script
!!
!! SOURCE

#if defined HAVE_CONFIG_H
#include "config.h"
#endif

module ${module_name}
    
 use defs_basis

 implicit none

! *************************************************************************

contains 
!!***

!!****f* ABINIT/${module_name}/${routine_name}
!! NAME
!!  ${routine_name}
!!
!! FUNCTION
!!  FIXME: add description.
!!
!! COPYRIGHT
!!  Copyright (C) ${this_year} ABINIT group (FIXME: add author)
!!  This file is distributed under the terms of the
!!  GNU General Public License, see ~abinit/COPYING
!!  or http://www.gnu.org/copyleft/gpl.txt .
!!
!! INPUTS
!!  argin(sizein)=description
!!
!! OUTPUT
!!  argout(sizeout)=description
!!
!! SIDE EFFECTS
!!
!! NOTES
!!
!! PARENTS
!!  Will be filled automatically by the parent script
!!
!! CHILDREN
!!  Will be filled automatically by the parent script
!!
!! SOURCE

subroutine ${routine_name}(argin,argout,option,sizein,sizeout)
    
 use defs_basis

 implicit none

!Arguments ------------------------------------
 integer , intent(in)  :: option,sizein,sizeout
 integer , intent(in)  :: argin(sizein)
 integer , intent(out) :: argout(sizeout)
 real(dp), intent(out) ::                        ! to be filled, if needed

!Local variables-------------------------------
 integer ::                                      ! to be filled, if needed
 real(dp) ::                                     ! to be filled, if needed
!character(len=500) :: message                   ! to be uncommented, if needed
 
! *************************************************************************
 
!DEBUG
!write (std_out,*) ' ${routine_name} : enter'
!ENDDEBUG

!DEBUG                                           ! to be uncommented, if needed
! if(option/=1 .and. option/=2 )then
!  write(message,'(a,a,a,a,a,a,i6)') ch10,&
!&  ' ${routine_name}: BUG -',ch10,&
!&  '  The argument option should be 1 or 2,',ch10,&
!&  '  however, option=',option
!  call wrtout(std_out,message,'COLL')
!  call leave_new('COLL')
! endif
! if(sizein<1)then
!  write(message,'(a,a,a,a,a,a,i6)') ch10,&
!&  ' ${routine_name}: BUG -',ch10,&
!&  '  The argument sizein should be a positive number,',ch10,&
!&  '  however, sizein=',sizein
!  call wrtout(std_out,message,'COLL')
!  call leave_new('COLL')
! endif
!ENDDEBUG


!DEBUG
!write (std_out,*) ' ${routine_name} : exit'
!stop
!ENDDEBUG

end subroutine ${routine_name}
!!***

end module ${module_name}
!!***
EOF

echo "done."

