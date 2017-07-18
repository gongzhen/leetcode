import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

// class TreeNode {
// 	int val;
// 	TreeNode left;
// 	TreeNode right;
// 	TreeNode(int x) { val = x; }
// }
// private void createTree() {
// 	//       5
// 	//    2      7
// 	//  1   3      10
// 	TreeNode node5 = new TreeNode(5);
// 	TreeNode node2 = new TreeNode(2);
// 	TreeNode node1 = new TreeNode(1);
// 	TreeNode node7 = new TreeNode(7);
// 	TreeNode node10 = new TreeNode(10);

// 	node5.left = node2;
// 	node5.right = node7;
// 	node2.left = node1;
// 	node2.right = node3;
// 	node5.right = node7;
// 	node7.right = node10; 
// 	return node5;
// }
// private void printList(List<String> list) {
// 	for(String s: list) {
// 		System.out.println(s);
// 	}
// }
// private void printQueue(Queue<String> list) {
// 	for(String s: list) {
// 		System.out.println(s);
// 	}
// } 
// private void printListOfList(List<List<Integer>> listOflist) {
// 	for(List<Integer> list: listOflist){
// 		for(int n : list) {
// 			System.out.print(n + ", ");
// 		}
// 		System.out.println();
// 	}
// }

public class Solution1 {

	private void printMatrix(boolean[][] matrix) {
		for(boolean[] s: matrix) {
			for(boolean n: s) {
				System.out.println(n + ",'");
			}
			System.out.println();
		}
	}

    public boolean isMatch(String s, String p) {
        char[] str = s.toCharArray();
        char[] pattern = p.toCharArray();
    	
    	// s, p == ""
    	if (str.length == 0 && pattern.length == 0) {
    		return true;
    	} else if (pattern.length == 0) {
    		return false;
    	}

    	boolean firstStar = true;
    	int writeIndex = 0;
    	for (int i = 0; i < pattern.length; i++) {
    		if (firstStar == true && pattern[i] == '*') {
    			pattern[writeIndex++] = pattern[i];
    			firstStar = false;
    		} else if (pattern[i] != '*'){
    			pattern[writeIndex++] = pattern[i];
    			firstStar = true;
    		}
    	}

    	for(int i = 0; i < writeIndex; i++) {
    		System.out.print(pattern[i]);
    	}

        boolean[][] matrix = new boolean[str.length + 1][pattern.length + 1];

        if (pattern[0] == '*') {
        	matrix[0][1] = true;
        }
        
        matrix[0][0] = true;
        for (int i = 1; i < matrix.length; i++) {
            for(int j = 1; j < matrix[0].length; j++) {
                if (str[i-1] == pattern[j-1] || pattern[j-1] == '?') {
                    matrix[i][j] = matrix[i-1][j-1];
                } else if (pattern[j - 1] == '*') {
                    matrix[i][j] = matrix[i-1][j] || matrix[i][j-1];
                }
            }
        }
        return matrix[str.length][writeIndex];    	
    }	

    


	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		// System.out.println(obj.isMatch("", ""));
		// System.out.println(obj.isMatch("a", "*"));
		// System.out.println(obj.isMatch("aa", "*"));
		System.out.println(obj.isMatch("aaaa", "***a"));
		// System.out.println(obj.isMatch("ho", "**ho"));
		// obj.isMatch("aa", "aa");
		// obj.isMatch("aaa", "a");
		// obj.isMatch("aa", "*");
		// obj.isMatch("ab", "?*");
	}

}
