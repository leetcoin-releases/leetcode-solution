/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
#include <stdio.h>
#include <stdlib.h>
#define HASH_SIZE 20000
typedef struct {
    int key;
    int value;
    int used;
} HashItem;
int hash(int key) {
    return abs(key) % HASH_SIZE;
}
int* twoSum(int* nums, int numsSize, int target, int* returnSize) {
    HashItem* hashTable = (HashItem*)calloc(HASH_SIZE, sizeof(HashItem));
    int* result = (int*)malloc(2 * sizeof(int));
    *returnSize = 2;
    for (int i = 0; i < numsSize; i++) {
        int complement = target - nums[i];
        int index = hash(complement);
        while (hashTable[index].used && hashTable[index].key != complement) {
            index = (index + 1) % HASH_SIZE;
        }
        if (hashTable[index].used) {
            result[0] = hashTable[index].value;
            result[1] = i;
            free(hashTable);
            return result;
        }
        index = hash(nums[i]);
        while (hashTable[index].used) {
            index = (index + 1) % HASH_SIZE;
        }
        hashTable[index].key = nums[i];
        hashTable[index].value = i;
        hashTable[index].used = 1;
    }
    free(hashTable);
    return result;
}