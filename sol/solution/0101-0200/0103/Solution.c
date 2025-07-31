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
int** zigzagLevelOrder(struct TreeNode* root, int* returnSize, int** returnColumnSizes) {
    if (!root) {
        *returnSize = 0;
        *returnColumnSizes = NULL;
        return NULL;
    }
    int** result = (int**)malloc(sizeof(int*) * 2000);
    int* colSizes = (int*)malloc(sizeof(int) * 2000);
    struct TreeNode* queue[2000];
    int front = 0, rear = 0;
    queue[rear++] = root;
    int level = 0;
    int resIdx = 0;
    while (front < rear) {
        int levelSize = rear - front;
        colSizes[resIdx] = levelSize;
        result[resIdx] = (int*)malloc(sizeof(int) * levelSize);
        for (int i = 0; i < levelSize; ++i) {
            struct TreeNode* node = queue[front++];
            int idx = (level % 2 == 0) ? i : (levelSize - 1 - i);
            result[resIdx][idx] = node->val;
            if (node->left) queue[rear++] = node->left;
            if (node->right) queue[rear++] = node->right;
        }
        ++resIdx;
        ++level;
    }
    *returnSize = resIdx;
    *returnColumnSizes = colSizes;
    return result;
}