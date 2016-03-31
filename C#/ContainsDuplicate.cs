public class Solution {
    public bool ContainsDuplicate(int[] nums) {
        Dictionary<int,bool> uniqueNums = new Dictionary<int,bool>();
        for(int i = 0; i < nums.Count(); i++){
            if (uniqueNums.ContainsKey(nums[i])){
                return uniqueNums[nums[i]];
            }
            else{
                uniqueNums.Add(nums[i],true);
            }
        }
        return false;
    }
}