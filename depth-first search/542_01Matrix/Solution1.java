import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution2 {

    public int[][] updateMatrix(int[][] matrix) {
    	for(int i = 0; i < matrix.length; i++) {
    		for(int j = 0; j < matrix[0].length; j++) {
    			if(matrix[i][j] == 1 && surroundByOne(matrix, i, j)) {
    				// all adjacent cells are 1.
    				matrix[i][j] = 10000;
    			}
    		}
    	}


        return matrix;
    }

    public boolean surroundByOne(int[][] matrix, int i, int j) {
    	int[][] direction = new int[][]{{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    	for(int[] d: direction) {
    		int newRow = i + d[0];
    		int newCol = j + d[1];
    		if(newRow < 0 || newRow >= matrix.length || newCol < 0 || newCol >= matrix[0].length) {
    			continue;
    		}
    		// one adjacent cell is 0
    		if(matrix[newRow][newCol] == 0) {
    			return false;
    		}
    	}
    	// all adjacent cells are 1
    	return true;
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
		Solution1 obj = new Solution1();
		int[][] res = obj.updateMatrix(new int[][]{
			{0, 0, 0},
			{0, 1, 0},
			{1, 1, 1},
		});

	}

}
