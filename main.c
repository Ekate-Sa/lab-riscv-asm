#include <stdio.h>

#define N 4
//#define M 4

// Task:
// Find a sum of the 2 main diag elements

void process(int n, int matrix [N][N], int *res)
{
    *res = 0;
    for (int i = 0; i < n; ++i) {
        // works for even N only
        *res += matrix[i][i];
        *res += matrix[i][n-1-i];
    }
}

int main(int argc, char** argv)
{
    int matrix[N][N];
    int result;
    
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    process(N, matrix, &result);

    printf("%d ", result);

    return 0;
}