typedef struct {
    int** mat;
    int row;
    int col;
} NumMatrix;
NumMatrix* numMatrixCreate(int** matrix, int n, int* c) {
    NumMatrix* new = malloc(sizeof(NumMatrix));
    new->row = n;
    new->col = c[0];
    new->mat = malloc(sizeof(int*) * n);
    for (int i = 0; i < n; i++) {
        new->mat[i] = malloc(sizeof(int) * c[0]);
    }
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < c[0]; j++) {
            int top = (i > 0) ? new->mat[i - 1][j] : 0;
            int left = (j > 0) ? new->mat[i][j - 1] : 0;
            int diag = (i > 0 && j > 0) ? new->mat[i - 1][j - 1] : 0;
            new->mat[i][j] = matrix[i][j] + top + left - diag;
        }
    }
    return new;
}
int numMatrixSumRegion(NumMatrix* obj, int row1, int col1, int row2, int col2) {
    int total = obj->mat[row2][col2];
    int top = (row1 > 0) ? obj->mat[row1 - 1][col2] : 0;
    int left = (col1 > 0) ? obj->mat[row2][col1 - 1] : 0;
    int topLeft = (row1 > 0 && col1 > 0) ? obj->mat[row1 - 1][col1 - 1] : 0;
    return total - top - left + topLeft;
}
void numMatrixFree(NumMatrix* obj) {
    for (int i = 0; i < obj->row; i++) {
        free(obj->mat[i]);
    }
    free(obj->mat);
    free(obj);
}
/**
 * Your NumMatrix struct will be instantiated and called as such:
 * NumMatrix* obj = numMatrixCreate(matrix, matrixSize, matrixColSize);
 * int param_1 = numMatrixSumRegion(obj, row1, col1, row2, col2);
 * numMatrixFree(obj);
*/