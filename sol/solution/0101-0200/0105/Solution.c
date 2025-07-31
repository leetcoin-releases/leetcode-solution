/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */
struct TreeNode* buildTree(int* preorder, int preorderSize, int* inorder, int inorderSize) {
    if (!preorderSize || !inorderSize)
        return NULL;
    struct TreeNode *root = malloc(sizeof(struct TreeNode));
    root->val = preorder[0];
    int leftSubtreeSize;
    for (int i = 0; i < inorderSize; ++i) {
        if (inorder[i] == preorder[0])
            leftSubtreeSize = i;
    }
    int rightSubtreeSize = inorderSize - leftSubtreeSize - 1;
    root->left = buildTree(preorder + 1, leftSubtreeSize, inorder, leftSubtreeSize);
    root->right = buildTree(preorder + leftSubtreeSize + 1, rightSubtreeSize, inorder + leftSubtreeSize + 1, rightSubtreeSize);
    return root;
}