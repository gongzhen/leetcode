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
// class ListNode {
//     int val;
//     ListNode next;
//     ListNode(int x) {
//         val = x;
//         next = null;
//     }
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
// private void enterKey() {
//     System.out.println("Press \"ENTER\" to continue...");
//     Scanner scanner = new Scanner(System.in);
//     scanner.nextLine();      
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

// private void printStack(Stack<Integer> stack) {
//     Interator<Integer> iter = stack.iterator();
//     while(iter.hasNext()) {
//         printString("" + iter.next());
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

public class Solution1 {

    public int trap(int[] height) {       	
      	int[] leftMost = new int[height.length];
      	leftMost[0] = 0;
       	int max = height[0];
       	for(int i = 1; i < height.length - 1; i++) {
       		leftMost[i] = max;
       		max = Math.max(max, height[i]);       		       	
       	}

       	max = height[height.length - 1];
       	int[] rightMost = new int[height.length];
       	rightMost[height.length - 1] = 0;

       	int ctrap, ttrap = 0;
       	for(int j = height.length - 2; j > 0; j--) {
       		rightMost[j] = max;

       		ctrap = Math.min(leftMost[j], rightMost[j]) - height[j];
       		printString("leftMost[j]:" + leftMost[j] + ", rightMost[j]" + rightMost[j] + ", ctrap:" + ctrap + "\n");
       		if(ctrap > 0) {
       			ttrap += ctrap;
       		}
       		max = Math.max(max, height[j]);
       	}
       	printString("height:===");
       	printArray(height);       	
       	printString("leftMost:=");
       	printArray(leftMost);       	
       	printString("rightMost:");
       	printArray(rightMost);
       	return ttrap;
    }

	private void printArray(int[] list) {
	    for(int n: list) {
	        printString("" + n + ",");
	    }
	    printLine();
	}     

    private void printLine() {
    	System.out.println("\n---------------------"); 
	}

    private void printString(String arg) {
        System.out.print(arg); 
    }    

	private void printList(int[] list, int length) {
		for(int i = 0; i < length; i ++ ){
			System.out.println(list[i]);
		}
	}    

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		int[] list = new int[]{0,1,0,2,1,0,1,3,2,1,2,1};
		System.out.println(obj.trap(list));
	}

}
