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
    function isSymmetric($root) {
        return $this->isMirror($root, $root);
    }
    function isMirror($t1, $t2) {
        if (!$t1 && !$t2) return true; if (!$t1 || !$t2) return false;
        return $t1->val == $t2->val && $this->isMirror($t1->left, $t2->right) && $this->isMirror($t1->right, $t2->left);
    }
}
