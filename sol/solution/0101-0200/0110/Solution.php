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
     * @param TreeNode $root
     * @return Boolean
     */
    function isBalanced($root) {
        return $this->check($root) !== -1;
    }
    function check($node) {
        if (!$node) return 0;
        $left = $this->check($node->left);
        if ($left === -1) return -1;
        $right = $this->check($node->right);
        if ($right === -1) return -1;
        if (abs($left - $right) > 1) return -1;
        return max($left, $right) + 1;
    }
}