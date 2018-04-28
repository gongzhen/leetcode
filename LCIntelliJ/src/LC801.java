import java.util.Arrays;

public class LC801 {

    public int minSwap(int[] A, int[] B) {
        if(A.length == 0 || B.length == 0) {
            return 0;
        }

        int[] dp1 = new int[A.length];
        Arrays.fill(dp1, Integer.MAX_VALUE);
        int[] dp2 = new int[A.length];
        Arrays.fill(dp2, Integer.MAX_VALUE);

        dp1[0] = 0;
        dp2[0] = 1;
        for(int i = 1; i < A.length; i++) {
            if(A[i] > A[i-1] && B[i] > B[i-1]) {
                dp1[i] = dp1[i - 1];
                dp2[i] = dp2[i - 1] + 1;
            }
            if(B[i] > A[i-1] && A[i] > B[i-1]) {
                dp1[i] = Math.min(dp1[i], dp2[i - 1]);
                dp2[i] = Math.min(dp2[i], dp1[i - 1] + 1);
            }
        }
        return Math.min(dp1[A.length - 1], dp2[A.length - 1]);
    }

    public static void main(String[] args) {
        LC801 obj = new LC801();
        int[] A = new int[]{1, 3};
        int[] B = new int[]{1, 2};
        obj.minSwap(A, B);
    }
}
