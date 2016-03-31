using Newtonsoft.Json.Linq;
public class Solution {
    public int[] SingleNumber(int[] nums) {
        Dictionary<int,bool> uniqueNums = new Dictionary<int,bool>();
        for (int i = 0; i < nums.Count(); i++)
        {
            if(uniqueNums.ContainsKey(nums[i]))
            {
                uniqueNums.Remove(nums[i]);
            }
            else
            {
                uniqueNums.Add(nums[i],true);
            }
        }
        int[] returnArray = new int[2];
        int j = 0;
        foreach (KeyValuePair<int,bool> p in uniqueNums) {returnArray[j++]=p.Key;}
        return returnArray;
    }
}