public class Solution {
    public bool IsAnagram(string s, string t) {
        if (s.Length != t.Length)
            return false;
        int[] charCnt = new int[26];
        
        for (int i = 0; i < s.Length; i++)
        {
            int charIndex = Convert.ToInt32('z')-Convert.ToInt32(s[i]);
            charCnt[charIndex]++;
            int charIndex2 = Convert.ToInt32('z')-Convert.ToInt32(t[i]);
            charCnt[charIndex2]--;
        }
        
        for(int j = 0; j < 26; j++)
        {
            if(charCnt[j]!=0){
             return false;   
            }
        }
            
        return true;
    }
}