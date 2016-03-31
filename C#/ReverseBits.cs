public class Solution {
    public uint reverseBits(uint n) {
        uint newInt = 0;
        
        for (int i = 0; i < 31; i++){
            if (n % 2 == 1)
                newInt += 1;
            n = n >> 1;
            newInt = newInt << 1;
        }
        if (n % 2 == 1)
                newInt += 1;
        
        return newInt;
    }
}