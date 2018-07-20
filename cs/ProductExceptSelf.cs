using Newtonsoft.Json.Linq;
using System.Collections;
public class Solution {
    public int[] ProductExceptSelf(int[] nums) {
        int n = nums.Count();
        int[] returnArray = new int[n];
        int factor = nums[0];
        
        for (int i = 1; i < n; i++){
            returnArray[i] += factor;
            factor *= nums[i];
        }
        
        factor = nums[n-1];
        
        for (int j = 2; j < n; j++){
            returnArray[n-j] *= factor;
            factor *= nums[n-j];
        }
        
        returnArray[0] = factor;
        
        return returnArray;
    }
}