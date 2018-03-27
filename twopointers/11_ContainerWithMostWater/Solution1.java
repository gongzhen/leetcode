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

    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        int len1 = nums1.length;
        int len2 = nums2.length;
        if((len1 + len2) / 2 == 0) {
            return (divide(nums1, 0, num2, 0, (len1  + len2)/ 2) + divide(nums1, 0, mums2, 0, (len1 + len2) / 2 + 1)) / 2;
        } 
        return divide(nums1, 0, nums2, 0, (len1 + len2) / 2);
    }

    public double divide(int[] nums1, int start1, int[] nums2, int start2, int k) {
        if(start1 >= nums1.length) {

        }
        if(start2 >= nums2.length) {

        }

        int middleA = start1 + k / 2 - 1 < nums1.length ? nums1[start1 + k / 2 - 1] : Integer.MAX_VALUE;
        int middleB = start2 + k / 2 - 1 < nums2.length ? nums2[start2 + k / 2 - 1] : Integer.MAX_VALUE;
        if(middleA < middleB) {
            return divide(nums1, start1 + k / 2, nums2, start2, k - k / 2);
        }
        return divide(nums1, start1, nums2, start2 + k / 2, k - k / 2);
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
        obj.maxArea(list);
	}

}
