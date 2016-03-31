public class Solution {
    public int HammingWeight(uint n) {
        int k = 0;
        while (n > 0){
            if (n % 2 == 1)
                k++;
            n = n >> 1;}
        return k;  
    }
}