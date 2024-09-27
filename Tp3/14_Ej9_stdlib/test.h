/*Exits a program with ret value*/
int exit(int ret);
/*Reads from a file descriptor(fd) some bytes(count) and leave it on buff*/
int read(unsigned int fd,char* buff,unsigned int count);
/*Writes in a file descriptor(fd), buff*/
int write(const char* buff, unsigned int fd,unsigned int count);
/*obteins a file descriptor for a file*/
int open(const char* filename);
/*ends with a file descriptor for a files*/
int close(unsigned int fd);