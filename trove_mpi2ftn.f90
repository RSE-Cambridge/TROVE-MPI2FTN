program trove_convert
  use accuracy
  use mpi2ftn_routines

  implicit none

  character(3)  :: slice_arg
  integer       :: ncommands, arglength
  integer(ik)   :: nslices

  ncommands = command_argument_count()
  if (ncommands .eq. 0) then

    call convert_matelem

  else if (ncommands .eq. 1) then

    call get_command_argument(1, value=slice_arg, length=arglength)

    if (arglength .gt. 3) then
      error stop "Invalid argument length"
    end if

    read(slice_arg, *) nslices
    write(out,*) "Number of extF slices:", nslices

    call convert_matelem(nslices)

  else

      error stop "Invalid number of arguments, exiting..."

  end if

end program
