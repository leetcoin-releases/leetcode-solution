/**
 * Return an array of arrays of size *returnSize.
 * The sizes of the arrays are returned as *returnColumnSizes array.
 * Note: Both returned array and *columnSizes array must be malloced, assume caller calls free().
 */
int cmp(const void* a, const void* b) { return *(int*)a - *(int*)b; }
int** threeSum(int* nums, int numsSize, int* returnSize, int** returnColumnSizes) {
    qsort(nums, numsSize, sizeof(int), cmp);
    int capacity = 1000, count = 0;
    int** res = malloc(capacity * sizeof(int*));
    *returnColumnSizes = malloc(capacity * sizeof(int));
    for (int i = 0; i < numsSize - 2; ++i) {
        if (i > 0 && nums[i] == nums[i - 1]) continue;
        int l = i + 1, r = numsSize - 1;
        while (l < r) {
            int sum = nums[i] + nums[l] + nums[r];
            if (sum < 0) l++;
            else if (sum > 0) r--;
            else {
                if (count == capacity) {
                    capacity *= 2;
                    res = realloc(res, capacity * sizeof(int*));
                    *returnColumnSizes = realloc(*returnColumnSizes, capacity * sizeof(int));
                }
                res[count] = malloc(3 * sizeof(int));
                res[count][0] = nums[i]; res[count][1] = nums[l]; res[count][2] = nums[r];
                (*returnColumnSizes)[count++] = 3;
                while (l < r && nums[l] == nums[l + 1]) l++;
                while (l < r && nums[r] == nums[r - 1]) r--;
                l++; r--;
            }
        }
    }
    *returnSize = count;
    return res;
}