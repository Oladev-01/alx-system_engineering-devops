#include <stdio.h>
#define PI 3.142
double circle(int r)
{
	return (PI * r * r);
}

int main()
{
	printf("this is the area of a circle with radius 5: %f\n", circle(5));
	return (0);
}
