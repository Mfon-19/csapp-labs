#include <stdio.h>
#include <string.h>

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer start, size_t len) {
	for(int i = 0; i < len; i++){
		printf(" %.2x", start[i]);
	}
	printf("\n");
}

void show_int(int x) {
	show_bytes((byte_pointer) &x, sizeof(int));
}

void show_float(float x) {
	show_bytes((byte_pointer) &x, sizeof(float));
}

void show_pointer(void *x) {
	show_bytes((byte_pointer) &x, sizeof(void *));
}

void test_show_bytes(int val) {
	int ival = val;
	float fval = (float) val;
	void *pval = &ival;
	show_int(ival);
	show_float(fval);
	show_pointer(pval);
}

int uadd_ok(unsigned x, unsigned y) {
	// overflow iff x + y < x or x + y < y
	short result = x + y;
	return result > x && result > y;
}

int tadd_ok(int x, int y) {
	// overflow iff x + y > sum(x + y) or x + y < sum(x + y)
	// i can store the sum in a larger word size, maybe long
	// and then truncate to int, or maybe just unsigned int
	unsigned int total = x + y;
	int trunc = (int) total;
	printf("unsigned total is = %u\n", total);
	printf("truncated total is = %d\n", trunc);
	return (int)trunc == (unsigned int)total;
}

int div16(int x) {
	return x >> 16; 
}

int main() {
	int a = 2000000000;
	int b = 2000000000;
	printf("%d", tadd_ok(a, b));
	return 0;
}
