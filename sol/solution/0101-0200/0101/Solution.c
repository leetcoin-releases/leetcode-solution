/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */
bool isMirror(struct TreeNode* t1, struct TreeNode* t2) {
    if (!t1 && !t2) return true; if (!t1 || !t2) return false;
    return t1->val == t2->val && isMirror(t1->left, t2->right) && isMirror(t1->right, t2->left);
}
bool isSymmetric(struct TreeNode* root) {
    return isMirror(root, root);
}
