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
//         System.out.println();            
//     }
// }   
//    private void printLine() {
//    	System.out.println("---------------------"); 
// }

public class Solution1 {

    public String simplifyPath(String path) {
        
    }

    private void printLine() {
    	System.out.println("---------------------"); 
	}

	private void printList(int[] list, int length) {
		for(int i = 0; i < length; i ++ ){
			System.out.println(list[i]);
		}
	}    

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
        String path = "foo/./bar"
		System.out.println(obj.simplifyPath(path));
	}

}
