import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution1 {

    public void solveSudoku(char[][] board) {
        // task 1 for each row, get all the permutations
        backtrack(board);
    }

    private boolean backtrack(char[][] board) {
        for(int i = 0; i < board.length; i++) {
        	for(int j = 0; j < board[i].length; j++) {
        		if(board[i][j] == '.') {                
                    for(char c = '1'; c <='9'; c++) {                                           
                        if(valid(board, i, j, c) == true) {
                            board[i][j] = c;
                            if(backtrack(board) == true) {
                                // System.out.println("----------------------------");
                                // printMatrix(board);
                                // System.out.println("----------------------------");
                                return true;
                            } else {
                                board[i][j] = '.';
                            }
                        }
                    }                    
                    return false;
        		}
        	}
        } 
        return true;   	
    }

    private boolean valid(char[][] board, int row, int col, char c) {
    	for(int i = 0; i < 9; i++) {
    		if(board[i][col] == c && i != row) {
    			return false;
    		}
    		if(board[row][i] == c && i != col) {
    			return false;
    		}
    		// System.out.print("[" + (3 * (row / 3) + i / 3) + "][" + (3 * (col / 3) + i % 3) + "]");
    		// if(board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] == c && (3 * (row / 3) + i / 3 ) != row && (3 * (col / 3) + i % 3) != col) {
    		// 	return false;
    		// }    		
    	}

    	int rowBlock = row / 3 * 3;
    	int colBlock = row / 3 * 3;
    	for(int i = rowBlock; i < rowBlock + 3; i++) {
    		for(int j = colBlock; j < colBlock + 3; j++) {
    			System.out.print("[" + i+ "][" + j + "]");
    			if(board[i][j] == c && (i != row || j != col)) {
    				return false;
    			}
    		}
    	}
    	System.out.println("----------------------------");
    	return true;
    }

    private void printMatrix(char[][] matrix) {
        for(char[] list: matrix) {
            for(char c : list) {
                System.out.print(c + ", ");
            }
            System.out.println();
        }
    }

	public static void main(String[] args) {
		Solution1 obj = new Solution1();		
		char[][] board = new char[][]{
            // check each spot, if is ".", then pass
			{'5', '3', '.', '.', '7', '.', '.', '.', '.'},
			{'6', '.', '.', '1', '9', '5', '.', '.', '.'},
			{'.', '9', '8', '.', '.', '.', '.', '6', '.'},
			{'8', '.', '.', '.', '6', '.', '.', '.', '3'},
			{'4', '.', '.', '8', '.', '3', '.', '.', '1'},
			{'7', '.', '.', '.', '2', '.', '.', '.', '6'},
			{'.', '6', '.', '.', '.', '.', '2', '8', '.'},
			{'.', '.', '.', '4', '1', '9', '.', '.', '5'},
			{'.', '.', '.', '.', '8', '.', '.', '7', '9'},
		};
        obj.solveSudoku(board);
	}

}
