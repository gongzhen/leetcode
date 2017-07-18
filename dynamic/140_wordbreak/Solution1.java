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
// private void printMatrix(int[][] matrix) {
//     for(int[] s: matrix) {
//         for(int n: s) {
//             System.out.print(n + ",'");
//         }
//     }
//     System.out.println();
// }  

public class Solution1 {

    public List<String> wordBreak(String s, List<String> wordDict) {
        int[][] dp = new int[s.length()][s.length() + 1];
        for (int i = 0; i < dp.length; i++) {
            for(int j = 0; j < dp[i].length; j++) {
                dp[i][j] = 0;
            }
        }

        for (int i = 1; i <= s.length(); i++) {
            for(int j = 0; j < s.length() - i + 1 ; j++) {
                // System.out.println("j:" + j + ", i:" + i);
                if(listContainsWord(wordDict, s.substring(j, j + i)) == true) {
                    dp[j][i] = 1;
                    continue;
                }

                for (int k = 1; k < i && k < s.length() - j; k++) {
                    if(dp[j][k] != 0 && dp[j + k][i - k] != 0) {
                        dp[j][i] = 2;
                        break;
                    }
                }
            }
        }


        return null;
    }

    private void printMatrix(int[][] matrix) {
        for(int[] s: matrix) {
            for(int n: s) {
                System.out.print(n + ",");
            }
            System.out.println();            
        }

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
		list.add("cat");
		list.add("cats");
        list.add("and");
        list.add("sand");
        list.add("dog");
        obj.wordBreak("catsanddog", list);
	}

}
