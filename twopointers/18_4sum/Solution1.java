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

    public List<List<Integer>> fourSum(int[] nums, int target) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        for(int i = 0; i < nums.length; i++) {
            int ThreeSum = target - nums[i];
            for(int j = i + 1; j < nums.length; j++) {
                int twoSum = ThreeSum - nums[j];
                for(int k = j + 1; k < nums.length; k++) {
                    int oneSum = twoSum - nums[k];
                    for(int n = k + 1; n < nums.length; n++) {
                        if (oneSum == nums[n]) {
                            List<Integer> list = new ArrayList<Integer>();
                            list.add(nums[i]);
                            list.add(nums[j]);
                            list.add(nums[k]);
                            list.add(nums[n]);
                            res.add(list);
                        }
                    }
                }
            }
        }
        return res;
    }	

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printList(List<String> list) {
     for(String s: list) {
         System.out.print(s + ",");
     }
     System.out.println();
    }      

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		int[] list = new int[]{1, 0, -1, 0, -2, 2};
        // [-3,-2,-1,0,0,1,2,3]
        // output: [[-3,-2,2,3],[-3,-1,1,3],[-3,0,0,3],[-3,0,1,2],[-3,0,1,2],[-2,-1,0,3],[-2,-1,0,3],[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
        // The list has to be sorted first.
		System.out.println(obj.fourSum(list, 0));
	}

}
