/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     public $val = null;
 *     public $left = null;
 *     public $right = null;
 *     function __construct($val = 0, $left = null, $right = null) {
 *         $this->val = $val;
 *         $this->left = $left;
 *         $this->right = $right;
 *     }
 * }
 */
class Solution {
    private $postIndex;
    private $inMap;
    /**
     * @param Integer[] $inorder
     * @param Integer[] $postorder
     * @return TreeNode
     */
    function buildTree($inorder, $postorder) {
        $this->inMap = [];
        foreach ($inorder as $i => $val) {
            $this->inMap[$val] = $i;
        }
        $this->postIndex = count($postorder) - 1;
        return $this->buildTreeHelper($inorder, $postorder, 0, count($inorder) - 1);
    }
    private function buildTreeHelper($inorder, $postorder, $inStart, $inEnd) {
        if ($inStart > $inEnd) return null;
        $root = new TreeNode($postorder[$this->postIndex--]);
        $inIndex = $this->inMap[$root->val];
        $root->right = $this->buildTreeHelper($inorder, $postorder, $inIndex + 1, $inEnd);
        $root->left = $this->buildTreeHelper($inorder, $postorder, $inStart, $inIndex - 1);
        return $root;
    }
}