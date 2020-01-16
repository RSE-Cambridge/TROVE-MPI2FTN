# TROVE-MPI2FTN

Converts TROVE-MPI output files to old format. Currently requires intel C and
Fortran compilers. MPI compiler/library not required.

# Make and run

`make` to build Intel version, `make gnu` to build with gcc. To run, execute
`trove_mpi2ftn.x` in TROVE output directory.

# Status

This version of the code requieres system RAM to be larger than the size of a
matrix slice, since the entire slice must be read into memory before being
written to the new file. The `mmap_branch` git branch contains a version that
uses MMAP to write directly from file to file, avoiding the need to store the
entire matrix in RAM. However, this only works with GCC - the Intel compiled
code insists on buffering the entire array into memory before even starting to
write out to file.

Until autodetection has been implemented, the number of `extmatelem*.chk` files
will have to be hard-coded in `mpi2ftn_routines.f90` (search for `!extF`).

# TODO

 - Resolve Intel MMAP issues.
 - Autodetect number of `extmatelem*.chk` files
