public class Solution {
    public void MoveZeroes(int[] nums) {
        
        int j = 0;
        int maxedOut = nums.Count();
        
        for(int i = 0; i < maxedOut; i++)
        {
            if (nums[i] != 0)
                nums[j++] = nums[i];
            
        }
        
        for (; j < maxedOut; j++)
        {
            nums[j] = 0;   
        }
        
    }
}