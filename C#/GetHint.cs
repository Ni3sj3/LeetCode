public class Solution {
    public string GetHint(string secret, string guess) {
            int bullCnt = 0;
            int cowCnt = 0;

            char[] secretC = secret.ToCharArray();
            char[] guessC = guess.ToCharArray();
            
            for (int i = 0; i < secret.Length; i++)
            {
                if (secretC[i] == guess [i])
                {
                    secretC[i] = ' ';
                    guessC[i] = ' ' ;
                    bullCnt++;
                }
            }
            
            for (int j = 0; j < secret.Length; j++)
            {
                if (guessC[j] != ' ')
                {
                    for (int k = 0; k < secret.Length; k++)
                    {
                        if (secretC[k] == guessC[j])
                        {
                            secretC[k] = ' ';
                            guessC[j] = ' ';
                            cowCnt++;
                        }
                    }
                }
            }

            return Convert.ToString(bullCnt) + "A" + Convert.ToString(cowCnt) + "B";
            
    }
}