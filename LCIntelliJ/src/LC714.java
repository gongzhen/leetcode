public class LC714 {

    public int maxProfitON(int[] prices, int fee) {
        if(prices.length == 0) return 0;
        int[] buy = new int[prices.length];
        int[] sell = new int[prices.length];
        buy[0] = -prices[0];
        sell[0] = 0;

        for(int i = 1; i < prices.length; i++) {
            buy[i] = Math.max(sell[i - 1] - prices[i], Math.max(buy[i - 1], buy[i - 1] + prices[i] - fee - prices[i]));
            sell[i] = Math.max(sell[i - 1], buy[i - 1] + prices[i] - fee);
        }

        return sell[prices.length - 1];
    }

    public int maxProfitO1(int[] prices, int fee) {
        if (prices == null || prices.length == 0) {
            return 0;
        }
        int hold = -prices[0], empty = 0;
        for (int i = 1; i < prices.length; i++) {
            // on current time i
            // the max profit of hold state is either we still hold the stock we hold at the i-1 time(hold)
            // or we buy new stock(empty - prices[i])
            hold = Math.max(hold, empty - prices[i]);
            // the max profit of enpty state is eighter we still keep our hand empty(empty)
            // or we sell the stock we already hold(hold + prices[i] - fee)
            empty = Math.max(empty, hold + prices[i] - fee);
        }
        // return must be empty, because selling is better than holding one stock that has not been sold
        return empty;
    }


    public static void main(String[] args) {
        LC714 obj = new LC714();
        int[] prices = new int[]{1, 3, 2, 8, 4, 9};
        PrintUtils.printString("res:" + obj.maxProfitON(prices, 2));
        PrintUtils.printString("res:" + obj.maxProfitO1(prices, 2));
    }
}
