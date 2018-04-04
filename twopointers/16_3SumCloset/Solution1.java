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

    public int minDiff = Integer.MAX_VALUE;
    public int threeSumClosest(int[] nums, int target) {
        Arrays.sort(nums);
        int find = 0;
        for(int i = 0; i < nums.length; i++) {
            if(i > 0 && nums[i] == nums[i - 1]) {
                continue;
            }
            find = target - nums[i];
            twoSum(nums, i + 1, nums.length - 1, find);
        }     
        return minDiff + target;        
    }
    
    ///-3, -1, -1, 0, 1, 1, 2, 4,
    private void twoSum(int[] nums, int i, int j, int target) {
        while(i < j) {
            
            int diff = nums[i] + nums[j] - target;
            if(Math.abs(minDiff) > Math.abs(diff)) {
                minDiff = diff;
            }
            
            if(diff == 0) {
                break;
            } else if (diff > 0) {
                j--;
            } else {
                i++;
            }
        }
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
		int[] list = new int[]{1, 0, 3, 2, 5, 2};
        obj.threeSumClosest(list, 3);
	}

}
