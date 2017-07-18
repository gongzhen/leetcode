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
//  private void scannerIn() {
//    Scanner scanner = new Scanner(System.in);
//    scanner.nextLine();
// }
// private void printString(String arg) {
//     System.out.println(arg); 
// }


public class Solution1 {

    public boolean makesquare(int[] nums) {
        if(nums.length == 0) {
            return false;
        }
        
        int sum = 0;
        for(int n: nums) {
            sum += n;
        }
        if(sum % 4 != 0) {
            return false;
        }
        printString("target:" + sum / 4);
        return dfs(nums, new int[4], sum / 4, 0);
    }	

    private boolean dfs(int[] nums, int[] subsums, int target, int index) {
        printString("line:85- dfs"); 
        if(index == nums.length) {
            if(subsums[0] == target && subsums[1] == target && subsums[2] == target) {
                return true;
            }
            return false;
        }
        
        for(int i = 0; i < 4; i++) {            
            printString("line:94- i:" + i + ", + index:[" + index + "]");  
            if(subsums[i] + nums[index] <= target) {
                subsums[i] += nums[index];
                printString("line:97-subsums[" + i + "]:" + subsums[i]);                
                if (dfs(nums, subsums, target, index + 1) == true) {
                    printString("line:99- i:" + i + ", + index:[" + index + "] return true."); 
                    scannerIn();
                    return true;
                }
                subsums[i] -= nums[index];
                // printString("line:98-[" + i + "]:" + subsums[i]);                                
                printLine();
            }
            printString("line:107- i:" + i + ", + index:[" + index + "] is skipped.");  
            scannerIn();
        }
        return false;
    }    

    private void printString(String arg) {
    	System.out.println(arg); 
	}

    private void printLine() {
        System.out.println("---------------------"); 
    }  

    private void scannerIn() {
       Scanner scanner = new Scanner(System.in);
       scanner.nextLine();
    }

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		// int[] list = new int[]{1, 1, 2, 2, 2};
        int[] list = new int[]{5,5,5,5,4,4,4,4,3,3,3,3};
        // int[] list = new int[]{3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1};
		System.out.println(obj.makesquare(list));
	}

}
