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

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode(int x) { val = x; }
}

public class Solution1 {

    public int rob(TreeNode root) {
        return robSub(root, new HashMap<TreeNode, Integer>());
    }

    private TreeNode createTree() {
        //       5
        //    2      7
        //  1   3      10
        TreeNode node3 = new TreeNode(3);
        TreeNode node4 = new TreeNode(4);
        TreeNode node5 = new TreeNode(5);
        TreeNode node1 = new TreeNode(1);
        TreeNode node2 = new TreeNode(2);
        TreeNode node6 = new TreeNode(6);

        node3.left = node4;
        node3.right = node5;
        node4.left = node1;
        node4.right = node2;
        node5.right = node6;
        printTree(node3);
        return node3;
    }   

    private int robSub(TreeNode root, Map<TreeNode, Integer> map) {
        if (root == null) {
            return 0;   
        }
        if (map.containsKey(root)) { 
            printString("line84:" + root.val);
            return map.get(root);
        }
        
        int val = 0;
        printString("line89:" + root.val);
        if (root.left != null) { 
            printString("line91:val;" + val);
            val += robSub(root.left.left, map) + robSub(root.left.right, map);
            printString("line93:val:" + val);
            printLine();
        }
        
        if (root.right != null) { 
            printString("line98:val:" + val);
            val += robSub(root.right.left, map) + robSub(root.right.right, map);
            printString("line100:val:" + val);
            printLine();
        }
        
        val = Math.max(val + root.val, robSub(root.left, map) + robSub(root.right, map));
        printString("line105:" + val);
        map.put(root, val);
        printString("line107:printMap");
        printMap(map);
        printLine();
        return val;
    }  

    private void printMap(Map<TreeNode, Integer> map) {
        for(TreeNode node:map.keySet()) {
            Integer value = map.get(node);
            printString("key:" + node.val + ",value:" + value);
        }
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

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    }    

    private void printStringWithoutNewLine(String arg) {
        System.out.print(arg + ","); 
    }      

	private void printList(int[] list, int length) {
		for(int i = 0; i < length; i ++ ){
			System.out.println(list[i]);
		}
	}    

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
        TreeNode root = obj.createTree();
		System.out.println(obj.rob(root));
	}

}
