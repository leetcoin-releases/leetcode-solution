/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    TreeNode* buildTreeHelper(vector<int>& preorder, int prestart, int preend, vector<int>& inorder, int instart, int inend, unordered_map<int, int>& mpp) {
        if (prestart > preend || instart > inend) return nullptr;
        TreeNode* root = new TreeNode(preorder[prestart]);
        int inRootIndex = mpp[root->val];
        int numsLeft = inRootIndex - instart;
        root->left = buildTreeHelper(preorder, prestart + 1, prestart + numsLeft, inorder, instart, inRootIndex - 1, mpp);
        root->right = buildTreeHelper(preorder, prestart + numsLeft + 1, preend, inorder, inRootIndex + 1, inend, mpp);
        return root;
    }
    TreeNode* buildTree(vector<int>& preorder, vector<int>& inorder) {
        unordered_map<int, int> mpp;
        for (int i = 0; i < inorder.size(); i++) 
            mpp[inorder[i]] = i;  
        return buildTreeHelper(preorder, 0, preorder.size() - 1, inorder, 0, inorder.size() - 1, mpp);
    }
};