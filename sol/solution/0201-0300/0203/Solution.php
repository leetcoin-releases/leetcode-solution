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
class Solution {
    /**
     * @param ListNode $head
     * @param Integer $val
     * @return ListNode
     */
    function removeElements($head, $val) {
        $dummy = new ListNode(0);
        $dummy->next = $head;
        $curr = $dummy;
        while ($curr->next !== null) {
            if ($curr->next->val === $val) {
                $curr->next = $curr->next->next;
            } else {
                $curr = $curr->next;
            }
        }
        return $dummy->next;
    }
}
