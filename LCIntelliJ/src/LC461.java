public class LC461 {

    public int hammingDistance(int x, int y) {
        PrintUtils.printString("res:" + (x ^ y));
        return Integer.bitCount(x ^ y);
    }

    public int hammingDistance_1(int x, int y) {
        int xor = x ^ y, count = 0;
        for (int i=0;i<32;i++) {
            count += (xor >> i) & 1;
        }
        return count;
    }

    public static void main(String[] args) {
        LC461 obj = new LC461();
        obj.hammingDistance(2,4);
    }
}
