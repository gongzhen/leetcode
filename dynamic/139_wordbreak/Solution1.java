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
// private void printMatrix(Boolean[][] matrix) {
// 	for(boolean[] s: matrix) {
// 		for(boolean n: s) {
// 			System.out.println(n + ",'");
// 		}
// 		System.out.println();
// 	}
// }

public class Solution1 {

    public boolean wordBreak(String s, List<String> wordDict) {
    	boolean[] dp = new boolean[s.length() + 1];
    	dp[0] = true;
    	for(int i = 1; i <= s.length(); i++) {
    		for (int j = 0; j < i; j++) {
    			System.out.println("j: " + j + ",i: " + i);
    			if (dp[j] == true && listContainsWord(wordDict, s.substring(j, i))) {
    				dp[i] = true;
    				break;
    			}
    		}
    	}
    	return dp[dp.length - 1];
    }

    private boolean listContainsWord(List<String> wordDict, String s) {
    	System.out.println(s);
    	for (String word : wordDict) {
    		if (s.equals(word)) {
    			return true;
    		}
    	}
    	return false;
    }

	public static void main(String[] args) {
		Solution1 obj = new Solution1();	
		List<String> list = new ArrayList<String>();
		list.add("leet");
		list.add("code");
		System.out.println(obj.wordBreak("leetcode", list));
	}

}
