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
    function addTwoNumbers($l1, $l2) {
        $dummy = new ListNode(0);
        $curr = $dummy;
        $carry = 0;
        while ($l1 || $l2 || $carry) {
            $sum = $carry;
            if ($l1) {
                $sum += $l1->val;
                $l1 = $l1->next;
            }
            if ($l2) {
                $sum += $l2->val;
                $l2 = $l2->next;
            }
            $carry = intval($sum / 10);
            $curr->next = new ListNode($sum % 10);
            $curr = $curr->next;
        }
        return $dummy->next;
    }
}