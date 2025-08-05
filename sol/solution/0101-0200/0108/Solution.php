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
     * @param Integer[] $nums
     * @return TreeNode
     */
    function sortedArrayToBST($nums) {
        return $this->buildBST($nums, 0, count($nums) - 1);
    }
    private function buildBST($nums, $left, $right) {
        if ($left > $right) return null;
        $mid = $left + intdiv($right - $left, 2);
        $root = new TreeNode($nums[$mid]);
        $root->left = $this->buildBST($nums, $left, $mid - 1);
        $root->right = $this->buildBST($nums, $mid + 1, $right);
        return $root;
    }
}