public class LC190 {

    public int reverseBits(int n) {
        int result = 0;
        for (int i = 0; i < 32; i++) {
            result += n & 1;
            PrintUtils.printBinaryString(n);
            n >>>= 1;   // CATCH: must do unsigned shift
            PrintUtils.printBinaryString(n);
            if (i < 31) {
                // CATCH: for last digit, don't shift!
                result <<= 1;
            }

        }
        return result;
    }

    public static void main(String[] args) {
        LC190 obj = new LC190();
        obj.reverseBits(4);
    }
}
