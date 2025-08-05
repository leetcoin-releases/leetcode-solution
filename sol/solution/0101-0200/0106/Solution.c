/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */
struct TreeNode* newNode(int val) {
    struct TreeNode* node = (struct TreeNode*)malloc(sizeof(struct TreeNode));
    node->val = val;
    node->left = NULL;
    node->right = NULL;
    return node;
}
struct TreeNode* buildTreeHelper(int* inorder, int* postorder, int inStart, int inEnd, int* postIndex, int* inMap);struct TreeNode* buildTreeHelper(int* inorder, int* postorder, int inStart, int inEnd, int* postIndex, int* inMap) {
    if (inStart > inEnd) return NULL;
    struct TreeNode* root = newNode(postorder[(*postIndex)--]);
    int inIndex = inMap[root->val + 3000];
    root->right = buildTreeHelper(inorder, postorder, inIndex + 1, inEnd, postIndex, inMap);
    root->left = buildTreeHelper(inorder, postorder, inStart, inIndex - 1, postIndex, inMap);
    return root;
}
struct TreeNode* buildTree(int* inorder, int inorderSize, int* postorder, int postorderSize) {
    int* inMap = (int*)malloc(6001 * sizeof(int));
    for (int i = 0; i < inorderSize; i++) {
        inMap[inorder[i] + 3000] = i;
    }
    int postIndex = postorderSize - 1;
    struct TreeNode* root = buildTreeHelper(inorder, postorder, 0, inorderSize - 1, &postIndex, inMap);
    free(inMap);
    return root;
}