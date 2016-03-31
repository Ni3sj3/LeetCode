public class Solution {
    public bool IsPowerOfTwo(int n) {
        
        while(n % 2 == 0 && n > 1)
            n /= 2;
            
        return n == 1;
    }   
}