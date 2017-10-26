import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;


// private void printList(List<String> list) {
//  for(String s: list) {
//      System.out.println(s);
//  }
// }
// private void printQueue(Queue<String> list) {
//  for(String s: list) {
//      System.out.println(s);
//  }
// } 
// private void printListOfList(List<List<Integer>> listOflist) {
//  for(List<Integer> list: listOflist){
//      for(int n : list) {
//          System.out.print(n + ", ");
//      }
//      System.out.println();
//  }
// }
// private void printMatrix(int[][] matrix) {
//     for(int[] s: matrix) {
//         for(int n: s) {
//             System.out.print(n + ",");
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
// private void printLine() {
//     System.out.println("---------------------"); 
// }  
// 
// private void printMap(HashMap<TreeNode, Integer> map) {
//     for(TreeNode node:map.keySet()) {
//         Integer value = map.get(node);
//         printString("key:" + node.val + ",value:" + value);
//     }
// }
// private void printStringWithoutNewLine(String arg) {
//     System.out.print(arg + ","); 
// } 
// private void printArray(int[] list) {
//     for(int n: list) {
//         System.out.println(n);
//     }
// } 
// private void printTree(TreeNode root) {
//     if(root == null) { return ; }
//     Queue<TreeNode> queue = new LinkedList<TreeNode>();
//     queue.offer(root);
//     while(!queue.isEmpty()) {
//         int size = queue.size();
//         for(int i = 0; i < size; i++) {
//             TreeNode node = queue.poll();                
//             if(node.left != null) {
//                 queue.offer(node.left);
//             }
//             if(node.right != null) {
//                 queue.offer(node.right);
//             }                
//             printStringWithoutNewLine("" + node.val);
//         }
//         printLine();
//     }
// } 

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode(int x) { val = x; }
}

public class Solution1 {

    public int findTilt(TreeNode root) {
        int[] sum = new int[1];
        sum[0] = 0;
        dfsTilt(root, sum);
        return sum[0];
    }

    public int dfsTilt(TreeNode node, int[] sum) {
        if(node == null) {
            return 0;
        }
        int left = dfsTilt(node.left, sum);
        int right = dfsTilt(node.right, sum);
        sum[0] = Math.abs(left - right);
        return sum[0] + node.val;
    }

    public int sumTree(TreeNode root) {
        int[] sum = new int[1];
        sum[0] = 0;        
        // if(root == null) {
        //     return 0;
        // }
        // sum[0] += root.val;
        // sum[0] += dfs(root.left, sum);
        // sum[0] += dfs(root.right, sum);
        dfs(root, sum);
        return sum[0];
    }	

    private int dfs(TreeNode node, int[] sum) {
        if(node == null) {
            return 0;
        }
        int left = dfs(node.left, sum);
        int right = dfs(node.right, sum);
        sum[0] += left + right + node.val;
        printString("sum:" + sum[0]);
        return left + right;
    }

    private TreeNode createTree() {
        //       5
        //    2      7
        //  1   3      10
        TreeNode node5 = new TreeNode(5);
        TreeNode node2 = new TreeNode(2);
        TreeNode node3 = new TreeNode(3);
        TreeNode node1 = new TreeNode(1);
        TreeNode node7 = new TreeNode(7);
        TreeNode node10 = new TreeNode(10);

        node5.left = node2;
        node5.right = node7;
        // node2.left = node1;
        // node2.right = node3;
        // node5.right = node7;
        // node7.right = node10; 
        return node5;
    }    

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    }    

	private void printList(int[] list, int length) {
		for(int i = 0; i < length; i ++ ){
			System.out.println(list[i]);
		}
	}    

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		TreeNode root = obj.createTree();
		System.out.println(obj.findTilt(root));
	}

}
