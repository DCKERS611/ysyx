#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

int main () 
{
	int fd = open("data.txt",O_RDONLY);
	if (fd == -1) 
	{
		perror("open");
		return 1;
	}

	printf("fd = %d\n" , fd);
	if (close(fd) == -1)
	{
	perror("close");
	return 1;
	}

	return 0;
}
