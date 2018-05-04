import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class LC311 {

    public int[][] multiply(int[][] A, int[][] B) {
        int[][] result = new int[A.length][B[0].length];
        Map<Integer, Set<Integer>> rowInA = new HashMap<>();
        for(int i = 0; i < A.length; i++) {
            Set<Integer> set = new HashSet<>();
            for(int j = 0; j < A[0].length; j++) {
                if(A[i][j] != 0) {
                    set.add(j);
                }
            }
            rowInA.put(i, set);
        }

        Map<Integer, Set<Integer>> rowInB = new HashMap<>();
        for(int i = 0; i < B.length; i++) {
            Set<Integer> set = new HashSet<>();
            for(int j = 0; j < B[0].length; j++) {
                if(B[i][j] != 0) {
                    set.add(j);
                }
            }
            rowInB.put(i, set);
        }

        for(int i = 0; i < A.length; i++) {
            for(int j : rowInA.get(i)) {
                for(int k : rowInB.get(j)) {
                    result[i][k] += A[i][j] * B[j][k];
                }
            }
        }
        return result;
    }

    public static void main(String[] args) {
        int[][] A = new int[][]{{1, 0, 0}, {-1, 0, 3}};
        int[][] B = new int[][]{{7, 0, 0}, {0, 0, 0}, {0, 0, 1}};
        LC311 obj = new LC311();
        int[][] result = obj.multiply(A, B);
        PrintUtils.printMatrixInt(result);
    }
}
