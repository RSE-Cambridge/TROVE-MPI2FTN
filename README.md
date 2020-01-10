# TROVE-MPI2FTN

Converts TROVE-MPI output files to old format. Currently requires intel C and
Fortran compilers. MPI compiler/library not required.

# Make and run

`make` to build. To run, execute `trove_mpi2ftn.x` in TROVE output directories

# Status

```
Currently implemented: 
- Convert split-file output
- Hard-coded/tested only with H2CO-1 right now
- Tested compatibility with non-MPIIO TRconvert_matel_j0_eigen (trove/tran.f90)

TODO:
- Implement non-split output (+ autodetect)
- Generalise
- Ensure compatibility with large files
- Clean up diagnostics/error checking
- Get rid of `ifport` module requirement
```
