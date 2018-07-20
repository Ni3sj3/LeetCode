public class Solution {
    public int AddDigits(int num) {
        int returnNum = num % 9;
        if (returnNum > 0 || num == 0) 
            return returnNum;
        else 
            return 9;
        /* a_n * 10^n + a_{n-1}*10^{n-1} + ... + a_0 
            = a_n *(9*k_n + 1) + a_{n-1}*(9*k_{n-1} + 1) + ... + a_0*(9*0 + 1)
            = (a_n + a_{n-1} + ... + a_o) + 9*(a_n*k_n + a_{n-1}*k_{n-1} + .. + a*0)
            
            */
    }
}