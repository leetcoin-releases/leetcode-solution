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
    function levelOrder($root) {
        $res = [];
        if (!$root) return $res;
        $queue = [$root];
        while (count($queue)) {
            $sz = count($queue);
            $level = [];
            for ($i = 0; $i < $sz; $i++) {
                $node = array_shift($queue);
                $level[] = $node->val;
                if ($node->left) $queue[] = $node->left;
                if ($node->right) $queue[] = $node->right;
            }
            $res[] = $level;
        }
        return $res;
    }
}