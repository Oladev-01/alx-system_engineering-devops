#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

/**
 * infinite_while - function that runs an infinite loop with 1 second sleep
 *
 * Return: 0 (This line will never be reached)
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - creates 5 zombie processes
 *
 * Return: 0 on success
 */
int main(void)
{
	pid_t pid;
	int i;

	for (i = 0; i < 5; i++)
	{
		pid = fork();
		if (pid > 0)
		{
			/* Parent process */
			printf("Zombie process created, PID: %d\n", pid);
		}
		else if (pid == 0)
		{
			/* Child process exits immediately to become a zombie */
			exit(0);
		}
		else
		{
			/* Fork failed */
			perror("fork");
			return (1);
		}
	}

	/* Infinite loop to keep the parent process alive */
	infinite_while();

	return (0);
}
