public class Solution {
    public int TitleToNumber(string s) {
        if (s == null)
            return 0;
            
        int n = s.Length;
        int sum = 0;
        int factor = 1;
        
        for(int i = 0; i < n; i++)
        {
            char curChar = s[n-i-1];
            int charVal = Convert.ToInt32(curChar) - Convert.ToInt32('A') + 1;
            sum += charVal * factor;
            factor *= 26;
        }
        
        return sum;
    }
}