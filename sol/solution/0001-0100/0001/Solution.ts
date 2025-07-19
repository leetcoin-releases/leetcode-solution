function twoSum(nums: number[], target: number): number[] {
    const hashMap = {};
    for(let i = 0 ; i < nums.length; i++){
        if(target-nums[i] in hashMap){
            return [hashMap[target-nums[i]],i];
        }
        hashMap[nums[i]]=i;
    }
    return [-1,-1];
};