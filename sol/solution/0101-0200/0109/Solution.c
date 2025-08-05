/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */
typedef struct ListNode node;
typedef struct TreeNode tNode;
tNode* makeNode(int val);
tNode* split(int* arr, int maxSpace, int left, int right);
tNode avil[20000];
int avilSpace = 0;
struct TreeNode* sortedListToBST(struct ListNode* head) {
    if(! head) {
        return NULL;
    }
    int arr[20000];
    node* temp = head;
    int size = 0;
    while(temp != NULL) {
        arr[size++] = temp->val;
        temp = temp->next;
    }
    tNode* ans = split(arr, size, 0, size-1);
    return ans;
}
tNode* split(int* arr, int maxSpace, int left, int right) {
    if(left > right) {
        return NULL;
    }
    int mid = (left+right) / 2;
    tNode* ma = makeNode(arr[mid]);
    tNode* l = split(arr, maxSpace, left, mid-1);
    tNode* r = split(arr, maxSpace, mid+1, right);
    ma->left = l;
    ma->right = r;
    return ma;
}
tNode* makeNode(int val) {
    if(avilSpace >= 20000) {
        return NULL;
    }
    (avil + avilSpace)->left = NULL;
    (avil + avilSpace)->right = NULL;
    (avil + avilSpace)->val = val;
    return avil + avilSpace++;
}