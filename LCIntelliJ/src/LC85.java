public class LC85 {


    public int maximalRectangle(char[][] matrix) {
        if(matrix == null || matrix.length == 0) {
            return 0;
        }

        int row = matrix.length;
        int col = matrix[0].length;

        int[] left = new int[col];
        int[] right = new int[col];
        int[] height = new int[col];
        int res = 0;
        for(int i = 0; i < col; i++) {
            right[i] = col;
        }

        for(int i = 0; i < row; i++) {
            int currentLeft = 0, currentRight = col;
            for(int j = 0; j < col; j++) {
                /// left
                if( matrix[i][j] == '1') {
                    /// currentLeft is the first index of value is 1.
                    /// don't replace currentLeft with j because it will be no first one.
                    left[j]  = Math.max(currentLeft, left[j]);
                } else {
                    left[j] = 0;
                    currentLeft = j + 1;
                }
            }
//            PrintUtils.printArray(left);
            for(int j = col - 1; j >= 0; j--) {
                /// right
                if( matrix[i][j] == '1') {
                    right[j]  = Math.min(currentRight, right[j]);
                } else {
                    right[j] = col;
                    currentRight = j;
                }
            }

//            PrintUtils.printArray(right);

            for(int j = 0; j < col; j++) {
                if( matrix[i][j] == '1') {
                    height[j]++;
                } else {
                    height[j] = 0;
                }
            }
            PrintUtils.printArray(height);

            for(int j = 0; j < col; j++) {
                res = Math.max(res, (right[j] - left[j]) * height[j]);
            }
        }
        return res;
    }

    public static void main(String[] args) {
        char[][] matrix = new char[][]{
                {'1','0','1','0','1'},
                {'1','0','1','1','1'},
                {'1','1','1','1','1'},
                {'1','0','0','1','0'}
        };
        LC85 obj = new LC85();
        obj.maximalRectangle(matrix);
    }
}
