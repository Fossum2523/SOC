#ifndef _MATMUL_H
#define _MATMUL_H

#define SIZEM 4
	int A[SIZEM*SIZEM] = {0, 1, 2, 3,
			0, 1, 2, 3,
			0, 1, 2, 3,
			0, 1, 2, 3,
	};
	int B[SIZEM*SIZEM] = {1, 2, 3, 4,
		5, 6, 7, 8,
		9, 10, 11, 12,
		13, 14, 15, 16,
	};
	int result[SIZEM*SIZEM];
#endif
