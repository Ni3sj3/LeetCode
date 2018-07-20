public class Solution {
    public int MissingNumber(int[] nums) {
        int n = nums.Count();
        
        int cap = (int)Math.Floor(n*(n+1)/2.0);
        
        for (int i = 0; i < n; i++){
            cap -= nums[i];
        }
        
        return cap;
    }
}