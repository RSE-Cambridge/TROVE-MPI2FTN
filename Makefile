all:
	mpiicc -c mmap_util.c
	mpiifort -c accuracy.f90
	mpiifort -c mpi2ftn_routines.f90
	mpiifort -o trove_mpi2ftn.x trove_mpi2ftn.f90 mpi2ftn_routines.o accuracy.o mmap_util.o

clean:
	rm trove_mpi2ftn.x *.o *.mod
