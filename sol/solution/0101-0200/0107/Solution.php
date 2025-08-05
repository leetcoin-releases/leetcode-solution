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
     * @return Integer[][]
     */
    function levelOrderBottom($root) {
        $result = [];
        if (!$root) return $result;
        $queue = [$root];
        while (!empty($queue)) {
            $levelSize = count($queue);
            $level = [];
            for ($i = 0; $i < $levelSize; $i++) {
                $node = array_shift($queue);
                $level[] = $node->val;
                if ($node->left) $queue[] = $node->left;
                if ($node->right) $queue[] = $node->right;
            }
            $result[] = $level;
        }
        return array_reverse($result);
    }
}