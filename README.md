# TROVE-MPI2FTN

Converts TROVE-MPI output files to old format. MPI compiler/library not required.

# Make and run

`make` to build GCC version, `make intel` to build with Intel compilers. To run,
execute `trove_mpi2ftn.x` in TROVE output directory.

# Status

This code uses MMAP to enable writing out larger-than-RAM Fortran records. This
will work fine with GCC, however Intel-compiled code will try to buffer the
entire record into RAM before writing it out to disk - so in this case, enough
RAM to fit a single TROVE Matrix slice is required.

Since output between Intel- and GCC-compiled versions is bit-perfect identical,
it's recommended to build with GCC - the tool will run on any compute node *and*
run faster due to more efficient I/O.

Until autodetection has been implemented, the number of `extmatelem*.chk` files
will have to be hard-coded in `mpi2ftn_routines.f90` (search for `!extF`).

# TODO

 - Autodetect number of `extmatelem*.chk` files
