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
//  private void printInt(int num, String argName) {
// 	System.out.println(argName + ":" + num);
// }

public class Solution1 {

    public int findDuplicate(int[] nums) {
    	if (nums == null || nums.length < 0) {
    		return -1;
    	}

    	int slow = nums[0]; // 
    	int fast = nums[nums[0]];
		printInt(fast, "fast");   
    	while(slow != fast) {
    		slow = nums[slow];
    		fast = nums[nums[fast]];
    		printInt(slow, "slow");
    		printInt(fast, "fast");    		
    	}

    	fast = 0;

    	while(fast != slow) {
    		fast = nums[fast];
    		slow = nums[slow];
    		printInt(slow, "slow");
    		printInt(fast, "fast");     		
    	}

        return slow;
    }	

    private void printInt(int num, String argName) {
    	System.out.println(argName + ":" + num);
    }

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		int[] nums = new int[]{4, 3, 3, 1, 2};
		obj.findDuplicate(nums);
	}

}
