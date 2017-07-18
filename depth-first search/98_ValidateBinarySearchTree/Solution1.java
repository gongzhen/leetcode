import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

// class TreeNode {
//  int val;
//  TreeNode left;
//  TreeNode right;
//  TreeNode(int x) { val = x; }
// }
// private TreeNode createTree() {
//  //       5
//  //    2      7
//  //  1   3      10
//  TreeNode node5 = new TreeNode(5);
//  TreeNode node2 = new TreeNode(2);
//  TreeNode node1 = new TreeNode(1);
//  TreeNode node7 = new TreeNode(7);
//  TreeNode node10 = new TreeNode(10);

//  node5.left = node2;
//  node5.right = node7;
//  node2.left = node1;
//  node2.right = node3;
//  node5.right = node7;
//  node7.right = node10; 
//  return node5;
// }
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
    TreeNode prev = null;
    public boolean isValidBST(TreeNode root) {
        if(root == null) { 
            printLine();
            return true;
        }
        printString("line 93 : root:" + root.val);
        if(prev != null) {printString("line 94 : prev:" + prev.val);}
        else {printString("line 95 : prev: null");}

        if(!isValidBST(root.left)) {
            return false;
        }

        printString("line 101 : root:" + root.val);
        if(prev != null) {printString("line 102 : prev:" + prev.val);}
        else {printString("line 102 : prev: null");} 

        if(prev != null && prev.val >= root.val) { printString("line 109 : prev:" + prev.val + " root.val:" + root.val);        
            return false;
        }
        prev = root;

        printString("line 110 : root:" + root.val);
        if(prev != null) {printString("line 111 : prev:" + prev.val);}
        else {printString("line 112 : prev: null");} 
        
        if(root.right != null) {printString("line 115 : root's right:" + root.right.val);}
        else {printString("line 115 : root " + root.val +" right is null.");}      

        printString("line 117 : dfs: root.right");printLine();
        boolean result = isValidBST(root.right);
        printString("line 119 : result:" + result);
        return result;
    }

    private TreeNode createTree() {
        //       5
        //    2      7
        //  1   3      10
        TreeNode node10 = new TreeNode(10);
        TreeNode node13 = new TreeNode(13);
        TreeNode node3 = new TreeNode(3);
        TreeNode node7 = new TreeNode(7);
        TreeNode node15 = new TreeNode(15);
        TreeNode node6 = new TreeNode(6);
        // TreeNode node10 = new TreeNode(10);

        node10.right = node13;
        // node10.right = node3;
        // node5.right = node7;
        // node10.right = node15;
        node13.right = node15;
        // node2.right = node3;
        // node5.right = node7;
        // node7.right = node10; 
        return node10;
    }      

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
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

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
        TreeNode root = obj.createTree();
		System.out.println(obj.isValidBST(root));
	}

}
