#include <stdio.h>

int main() {
	int my_num;
	printf("How big will the loop be?\n");
	scanf("%d", &my_num);
	int i;
	for (i = 0; i < my_num; i++) {
		printf("%d\n", i);
	}
	printf("%d", my_num);
}

