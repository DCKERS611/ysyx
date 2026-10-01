#include <unistd.h>
#include <stdio.h>

int main ()
{
	const char message[] = "Hello,Linux!\n";
	ssize_t written = write(STDOUT_FILENO,message , sizeof(message) - 1);
	if (written == -1) {
	perror("write");
	return 1;
	}

	return 0;
}

