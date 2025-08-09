class NumArray {
private:
   vector<int> prefixsum ;
public:
    NumArray(vector<int>& nums) {
        int sum = 0 ;
        prefixsum.resize(nums.size()) ;
        for ( int i= 0 ; i<nums.size() ;i++ ){
          sum += nums[i] ;
          prefixsum[i] = sum ;
        }
    }
    int sumRange(int left, int right) {
        if ( left == 0) return prefixsum[right] ;
        return prefixsum[right]-prefixsum[left-1] ;
    }
};
/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray* obj = new NumArray(nums);
 * int param_1 = obj->sumRange(left,right);
 */