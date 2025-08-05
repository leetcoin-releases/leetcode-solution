/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */
function removeElements(head: ListNode | null, val: number): ListNode | null {
    const dummy = new ListNode(0, head);
    let curr: ListNode | null = dummy;
    while (curr && curr.next) {
        if (curr.next.val === val)
            curr.next = curr.next.next;
        else
            curr = curr.next;
    }
    return dummy.next;
}
