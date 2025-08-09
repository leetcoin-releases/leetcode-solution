typedef struct {
    int *prefix;
} NumArray;
NumArray *numArrayCreate(int *nums, int numsSize) {
    NumArray *obj = malloc(sizeof(*obj));
    obj->prefix = malloc(sizeof(int) * numsSize);
    obj->prefix[0] = nums[0];
    for (int i = 1; i < numsSize; i++)
        obj->prefix[i] = obj->prefix[i - 1] + nums[i];
    return obj;
}
int numArraySumRange(NumArray *obj, int left, int right) {
    if (left == 0)
        return obj->prefix[right];
    return obj->prefix[right] - obj->prefix[left - 1];
}
void numArrayFree(NumArray *obj) {
    if (obj)
        free(obj->prefix);
    free(obj);
}
/**
 * Your NumArray struct will be instantiated and called as such:
 * NumArray* obj = numArrayCreate(nums, numsSize);
 * int param_1 = numArraySumRange(obj, left, right);
 * numArrayFree(obj);
*/