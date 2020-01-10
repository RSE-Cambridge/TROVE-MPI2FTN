/*
 * mmap_util.c
 *
 * Simple MMAP support routines to interface to fortran
 *
 */
#include <stdlib.h>
#include <stdio.h>
#include <sys/mman.h>  // mmap
#include <sys/types.h> // file ops
#include <sys/stat.h>  // file ops
#include <fcntl.h>     // file ops
#include <unistd.h>    // close

/* Use stat to get the size (in bytes) of the file to be mmapped. */
int64_t get_mmapped_file_length(char *filename)
{
	struct stat file_stat;

	if(stat(filename, &file_stat)) return -1;

	return file_stat.st_size;
}

/* Assumes a 0-terminated input string. */
void *mmap_file_rdonly(char *filename)
{
	int fd;
	struct stat file_stat;
	void *mapped_mem;

	fd = open(filename, O_RDONLY);
	if (fd == -1) {
		perror("open");
		return NULL;
	}

	fstat(fd, &file_stat);

	mapped_mem = mmap(NULL, file_stat.st_size, PROT_READ, MAP_PRIVATE|MAP_NORESERVE, fd, 0);

	if (mapped_mem == MAP_FAILED) {
		perror("mmap");
		return NULL;
	}

	close(fd);

	return mapped_mem;
}
