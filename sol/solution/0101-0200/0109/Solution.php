/**
 * Definition for a singly-linked list.
 * class ListNode {
 *     public $val = 0;
 *     public $next = null;
 *     function __construct($val = 0, $next = null) {
 *         $this->val = $val;
 *         $this->next = $next;
 *     }
 * }
 */
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
     * @param ListNode $head
     * @return TreeNode
     */
    function sortedListToBST($head) {
        if (!$head) return null;
        if (!$head->next) return new TreeNode($head->val);
        $slow = $fast = $head;
        $prev = null;
        while ($fast && $fast->next) {
            $prev = $slow;
            $slow = $slow->next;
            $fast = $fast->next->next;
        }
        if ($prev) $prev->next = null;
        $root = new TreeNode($slow->val);
        $root->left = $this->sortedListToBST($head === $slow ? null : $head);
        $root->right = $this->sortedListToBST($slow->next);
        return $root;
    }
}