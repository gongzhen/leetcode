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
// private void printArray(int[] list) {
//     for(int n: list) {
//         System.out.println(n);
//     }
// } 


class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode(int x) { val = x; }
}

public class Solution1 {

    public int pathSum(TreeNode root, int sum) {
        if(root == null)
            return 0;
        return findPath(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum);
    }
    
    public int findPath(TreeNode root, int sum){
        int res = 0;
        if(root == null)
            return res;
        if(sum == root.val)
            res++;
        res += findPath(root.left, sum - root.val);
        res += findPath(root.right, sum - root.val);
        return res;
    }

    private TreeNode createTree() {
        //       5
        //    2      7
        //  1   3      10
        TreeNode node10 = new TreeNode(10);
        TreeNode node5 = new TreeNode(5);
        TreeNode node3= new TreeNode(3);
        TreeNode node31 = new TreeNode(3);
        TreeNode node51 = new TreeNode(5);
        TreeNode nodeN2 = new TreeNode(-2);
        TreeNode node2 = new TreeNode(2);
        TreeNode node1 = new TreeNode(1); 
        TreeNode nodeN3 = new TreeNode(-3);
        TreeNode node11 = new TreeNode(11);

        node10.left = node5;
        node10.right = nodeN3;
        node5.left = node3;
        node5.right = node2;
        node3.left = node31;
        node3.right = nodeN2;
        nodeN3.right = node11; 
        return node10;
    }   

    private void printTree(TreeNode root) {
        if(root == null) { return ; }
        Queue<TreeNode> queue = new LinkedList<TreeNode>();
        queue.offer(root);
        while(!queue.isEmpty()) {
            int size = queue.size();
            for(int i = 0; i < size; i++) {
                TreeNode node = queue.poll();                
                if(node.left != null) {
                    queue.offer(node.left);
                }
                if(node.right != null) {
                    queue.offer(node.right);
                }                
                printStringWithoutNewLine("" + node.val);
            }
            printLine();
        }
    }      

    private void printStringWithoutNewLine(String arg) {
        System.out.print(arg + ","); 
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
        obj.printTree(root);
        obj.printLine();
		System.out.println(obj.pathSum(root, 8));
	}

}
