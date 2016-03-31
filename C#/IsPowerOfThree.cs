public class Solution {
    public bool IsPowerOfThree(int n) {
        while (n % 3 == 0 && n > 1)
            n /= 3;
        return n == 1;
    }
}