public class Solution {
    public int MaxProfit(int[] prices) {
        //buy at local min, sell at local max
        int n = prices.Count();
        
        if (n == 0) 
            return 0;
        
        int profit = 0;
        int saveValue = prices[0];
        bool ableToBuy = true;
            
        for (int i = 0; i < n; i++)
        {
            if(prices[i] < saveValue && !ableToBuy)
            {
                  profit += saveValue;
                  ableToBuy = true;
            }
            if(prices[i] > saveValue && ableToBuy)
            {
                profit -= saveValue;
                ableToBuy = false;
            }
            if(n == i+1 && !ableToBuy)
            {
                profit += prices[i];
            }
            saveValue = prices[i];
            
        }
        return profit;
    }
}