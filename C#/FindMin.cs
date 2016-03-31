public class Solution {
    public int FindMin(int[] nums) {
        int n = nums.Count();
        
        int saveNum = nums[0];
        
        for (int i = 0; i < n; i++){
            if (nums[i] < saveNum)
                saveNum = nums[i];
        }
        
        return saveNum;
        
    }
}