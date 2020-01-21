all: intel

intel:
	icc -g3 -traceback -c mmap_util.c
	ifort -g3 -traceback -c accuracy.f90
	ifort -g3 -traceback -cpp -c mpi2ftn_routines.f90
	ifort -g3 -traceback -o trove_mpi2ftn.x trove_mpi2ftn.f90 mpi2ftn_routines.o accuracy.o mmap_util.o

gnu:
	gcc -g3 -c mmap_util.c
	gfortran -g3 -c accuracy.f90
	gfortran -g3 -cpp -c mpi2ftn_routines.f90
	gfortran -g3 -o trove_mpi2ftn.gnu.x trove_mpi2ftn.f90 mpi2ftn_routines.o accuracy.o mmap_util.o

clean:
	rm trove_mpi2ftn.x *.o *.mod
