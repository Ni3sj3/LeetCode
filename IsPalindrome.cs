public class Solution {
    public bool IsPalindrome(string s) {
        int n = s.Length;
        
        StringBuilder flipped = new StringBuilder(n);
        StringBuilder sRemoveChar = new StringBuilder(n);
        
        for (int i = 0; i < n; i++){
            if ((s[i] >= 'A' && s[i] <= 'Z') || (s[i] >= 'a' && s[i] <= 'z') || (s[i] >= '0' && s[i] <= '9') ) 
                sRemoveChar.Append(Char.ToUpper(s[i]));
            if ((s[n-i-1] >= 'A' && s[n-i-1] <= 'Z') || (s[n-i-1] >= 'a' && s[n-i-1] <= 'z') || (s[n-i-1] >= '0' && s[n-i-1] <= '9'))    
                flipped.Append(Char.ToUpper(s[n-i-1]));
        }
        
        return flipped.ToString() == sRemoveChar.ToString();
    }
}