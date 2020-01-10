! From trove/accuracy.f90
module accuracy
  implicit none
  public

  integer, parameter :: ik          = selected_int_kind(8)       ! "Normal" integers. This must map on
  integer, parameter :: hik         = selected_int_kind(16)      ! "Pointer" integers - sufficient to store
  integer, parameter :: rk          = selected_real_kind(12,25)  ! "Normal" reals and complex (complexi? :-)
  integer, parameter :: inp         = 5                          ! Input I/O channel
  integer, parameter :: out         = 6                          ! Output I/O channel

end module accuracy
