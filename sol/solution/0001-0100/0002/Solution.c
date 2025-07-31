/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2) {
    struct ListNode *head = NULL, *tail = NULL; int carry = 0;
    while (l1 || l2 || carry) {
        struct ListNode *n = malloc(sizeof(*n)); int sum = carry;
        if (l1) {
            sum += l1->val; l1 = l1->next;
        }
        if (l2) {
            sum += l2->val; l2 = l2->next;
        }
        n->val = sum % 10; n->next = NULL; carry = sum / 10;
        if (tail)
            tail->next = n;
        else
            head = n;
        tail = n;
    }
    return head;
}