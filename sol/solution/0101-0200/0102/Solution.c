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
int** levelOrder(struct TreeNode* root, int* returnSize, int** returnColumnSizes) {
    if (!root) {
        *returnSize = 0;
        *returnColumnSizes = NULL;
        return NULL;
    }
    struct TreeNode* queue[2000];
    int front = 0, rear = 0;
    queue[rear++] = root;
    int** res = (int**)malloc(2000 * sizeof(int*));
    int* colSizes = (int*)malloc(2000 * sizeof(int));
    int level = 0;
    while (front < rear) {
        int count = rear - front;
        res[level] = (int*)malloc(count * sizeof(int));
        colSizes[level] = count;
        for (int i = 0; i < count; ++i) {
            struct TreeNode* node = queue[front++];
            res[level][i] = node->val;
            if (node->left) queue[rear++] = node->left;
            if (node->right) queue[rear++] = node->right;
        }
        level++;
    }
    *returnSize = level;
    *returnColumnSizes = colSizes;
    return res;
}