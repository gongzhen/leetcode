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

    public List<List<Integer>> pathSum(TreeNode root, int sum) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        if(root == null) {
            return res;
        }
        
        Stack<TreeNode> stack = new Stack<TreeNode>();
        TreeNode ptr = root, prev = null;
        List<Integer> list = new ArrayList<>();
        int kSum = 0;
        while(ptr != null || !stack.isEmpty()) {
            while(ptr != null) {
                stack.push(ptr);
                kSum += ptr.val;
                list.add(ptr.val);
                ptr = ptr.left;
            }
            ptr = stack.peek();
            printList(list);            
            if(ptr.right != null ) {
                ptr = ptr.right;
                printLine();
            } else {
                if(ptr.left == null && ptr.right == null && kSum == sum) {
                    res.add(new ArrayList<Integer>(list));
                }
                prev = ptr;
                stack.pop();
                list.remove(list.size() - 1);                
                kSum -= ptr.val;
                ptr = null;
            }
            printString("after pop:");
           printList(list);   
           System.out.println("Press \"ENTER\" to continue...");
           Scanner scanner = new Scanner(System.in);
           scanner.nextLine();
        }        
        return res;
    }

    private TreeNode createTree() {
        //       5
        //    2      7
        //  1   3      10
        TreeNode node5 = new TreeNode(5);
        TreeNode node4 = new TreeNode(4);
        TreeNode node8 = new TreeNode(8);
        TreeNode node11 = new TreeNode(11);
        TreeNode node13 = new TreeNode(13);
        TreeNode node4_1 = new TreeNode(4);
        TreeNode node7 = new TreeNode(7);
        TreeNode node2 = new TreeNode(2);
        TreeNode node5_1 = new TreeNode(5);
        TreeNode node1 = new TreeNode(1);
        node5.left = node4;        
        node4.left = node11;
        node11.left = node7;
        node11.right = node2;

        node5.right = node8;
        node8.left = node13; 
        node8.right = node4_1; 
        node4_1.left = node5_1;
        node4_1.right = node1;
        return node5;
    }    

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printListOfList(List<List<Integer>> listOflist) {
        for(List<Integer> list: listOflist){
            for(int n : list) {
                System.out.print(n + ", ");
            }
            System.out.println();
        }
    }    

    private void printString(String arg) {
        System.out.println(arg); 
    }    

	private void printList(List<Integer> list) {
		for(int n : list){
			System.out.println(n);
		}
	}    

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		TreeNode root = obj.createTree();
		List<List<Integer>> res = obj.pathSum(root, 22);
        obj.printListOfList(res);
	}

}
