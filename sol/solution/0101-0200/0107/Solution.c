/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */
/**
 * Return an array of arrays of size *returnSize.
 * The sizes of the arrays are returned as *returnColumnSizes array.
 * Note: Both returned array and *columnSizes array must be malloced, assume caller calls free().
 */
struct TreeNode* tabqu[2000];
int fr, en;
void initQueue() {
    fr = en = 0;
}
void BFS(struct TreeNode* root, int* returnSize, int** tempSizes, int* capacity) {
    initQueue();
    tabqu[en++] = root;
    int i = 0, level = 0;
    while (i < en) {
        int levelSize = en - i;
        int j;
        struct TreeNode* node;
        for (j = 0; j < levelSize; j++) {
            node = tabqu[i++];
            if (node->left)
                tabqu[en++] = node->left;
            if (node->right)
                tabqu[en++] = node->right;
        }
        if (level >= *capacity) {
            *capacity *= 2;
            *tempSizes = (int*)realloc(*tempSizes, *capacity * sizeof(int));
        }
        (*tempSizes)[level] = levelSize;
        level++;
    }
    *returnSize = level;
}
int** levelOrderBottom(struct TreeNode* root, int* returnSize, int** returnColumnSizes) {
    if (!root) {
        *returnColumnSizes = NULL;
        *returnSize = 0;
        return NULL;
    }
    int capacity = 16;
    int* tempSizes = (int*)malloc(capacity * sizeof(int));
    BFS(root, returnSize, &tempSizes, &capacity);
    int n = *returnSize;
    size_t size = n * sizeof(int*) + n * sizeof(int);
    void* block = malloc(size);
    int** result = (int**)block;
    (*returnColumnSizes) = (int*)((char*)block + n * sizeof(int*));
    int i, j;
    for (i = 0; i < n; i++) {
        int levelSize = tempSizes[i], level = n - 1 - i;
        result[level] = (int*)malloc(levelSize * sizeof(int));
        (*returnColumnSizes)[level] = levelSize;
        struct TreeNode* node;
        for (j = 0; j < levelSize; j++) {
            node = tabqu[fr++];
            result[level][j] = node->val;
        }
    }
    free(tempSizes);
    return result;
}