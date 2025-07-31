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
    /**
     * @param Integer[] $preorder
     * @param Integer[] $inorder
     * @return TreeNode
     */
    private $map;
    private $idx = 0;
    function buildTree($preorder, $inorder) {
        $this->map = array_flip($inorder);
        return $this->helper($preorder, 0, count($inorder) - 1);
    }
    function helper(&$preorder, $left, $right) {
        if ($left > $right) return null;
        $val = $preorder[$this->idx++];
        $node = new TreeNode($val);
        $node->left = $this->helper($preorder, $left, $this->map[$val] - 1);
        $node->right = $this->helper($preorder, $this->map[$val] + 1, $right);
        return $node;
    }
}
