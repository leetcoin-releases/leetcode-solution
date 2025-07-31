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
    function zigzagLevelOrder($root) {
        $res = [];
        if (!$root) return $res;
        $queue = [$root];
        $leftToRight = true;
        while (!empty($queue)) {
            $level = [];
            $size = count($queue);
            for ($i = 0; $i < $size; $i++) {
                $node = array_shift($queue);
                if ($leftToRight) {
                    $level[] = $node->val;
                } else {
                    array_unshift($level, $node->val);
                }
                if ($node->left) $queue[] = $node->left;
                if ($node->right) $queue[] = $node->right;
            }
            $res[] = $level;
            $leftToRight = !$leftToRight;
        }
        return $res;
    }
}