public class Solution {
    public int SingleNumber(int[] nums) {
        Dictionary<int, bool> counts = new Dictionary<int,bool>();
        for (int i = 0; i < nums.Count(); i++)
        {
            if (counts.ContainsKey(nums[i]))
            {
                counts[nums[i]] = true;
            }
            else
            {
                counts.Add(nums[i], false);
            }
        }
        
        for (int j = 0; j < nums.Count(); j++)
        {
            if(counts[nums[j]] == false)
            {
                return nums[j];
            }
        }
        
        return -1;
     }
}