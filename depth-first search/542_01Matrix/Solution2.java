import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution2 {

    public int[][] updateMatrix(int[][] matrix) {
        int maxNumber = Integer.MAX_VALUE;
    	int[][] dist = new int[][]{
            {maxNumber, maxNumber, maxNumber},
            {maxNumber, maxNumber, maxNumber},
            {maxNumber, maxNumber, maxNumber}
        };

        for(int i = 0; i < matrix.length; i++) {
    		for(int j = 0; j < matrix[0].length; j++) {
                // if matrix i, j is 0, then dist i j will be 0.
                if(matrix[i][j] == 0) {
                    dist[i][j] = 0;
                } else {
                    // if matrix i, j is 1, then dist will calculate the distance
                    // from all the cell to this i, j and update the minimum distance.
                    for(int k = 0; k < matrix.length; k++) {
                        for(int l = 0; l < matrix[0].length; l++) {
                            if(matrix[k][l] == 0) {
                                int dist_01 = Math.abs(k - i) + Math.abs(l - j);
                                dist[i][j] = Math.min(dist[i][j], Math.abs(k - i) + Math.abs(l - j));                                
                            }
                        }
                    }
                }
    		}
    	}
        return matrix;
    }


    private void printMatrix(int[][] matrix) {
    	for(int[] list: matrix) {
    		for(int n: list) {
    			System.out.print(n + ",");
    		}
    		System.out.println();
    	}
    }

	public static void main(String[] args) {
		Solution2 obj = new Solution2();
		int[][] res = obj.updateMatrix(new int[][]{
			{0, 0, 0},
			{0, 1, 0},
			{1, 1, 1},
		});

	}

}
