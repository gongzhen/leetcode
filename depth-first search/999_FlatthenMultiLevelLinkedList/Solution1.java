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
// private void printArray(int[] list) {
//     printStringWithoutNewLine("[");
//     for(int n: list) {
//         printStringWithoutNewLine(n + ", ");
//     }
//     printStringWithoutNewLine("]\n");
// } 

// private void printStringWithoutNewLine(String arg) {
//     System.out.print(arg); 
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

class ListNode {
    char val;
    ListNode next;
    ListNode down;
    ListNode(char x) {
        val = x;
        next = null;
        down = null;
    }
}

public class Solution1 {

    public ListNode flattenLinkedList(ListNode node) {
        dfs(node);
        return node;
    }

    private ListNode dfs(ListNode node) {
        if(node == null) {
            return null;
        }

        if(node.next == null && node.down == null) {
            return node;
        }

        ListNode ptr = node;
        ListNode headNext = node.next;

        if(node.down != null) {
            node.next = node.down;
            ptr = dfs(node.down);
            node.down = null;
        }

        ptr.next = headNext;
        return headNext == null ? ptr : dfs(ptr.next);
    }

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    }    

    private void printArray(int[] list) {
        printStringWithoutNewLine("[");
        int i = 0;
        for(int n : list) {
            printStringWithoutNewLine("[" + i + "]" + n + ", ");
            i++;
        }
        printStringWithoutNewLine("]\n");
    }  

    private void printArray(int[] list, int s, int e) {
        printStringWithoutNewLine("[");
        for(int i = s; i <= e; i++) {
            printStringWithoutNewLine("[" + i + "]" + list[i] + ", ");
        }
        printStringWithoutNewLine("]\n");
    } 

    private void printStringWithoutNewLine(String arg) {
        System.out.print(arg); 
    }         

	private void printList(ListNode node) {
        ListNode ptr = node;
        while(ptr != null) {
            printStringWithoutNewLine(ptr.val + ", ");
            ptr = ptr.next;
        }
        printStringWithoutNewLine("\n");
	}    

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
        ListNode n1 = new ListNode('A');
        ListNode n2 = new ListNode('B');
        ListNode n3 = new ListNode('C');
        ListNode n4 = new ListNode('D');
        ListNode n5 = new ListNode('E');
        ListNode n6 = new ListNode('F');
        ////////////////////////////////////////////////
        ListNode n7 = new ListNode('G');
        ListNode n8 = new ListNode('H');
        ListNode n9 = new ListNode('I');
        ListNode n10 = new ListNode('J');
        ////////////////////////////////////////////////
        ListNode n11 = new ListNode('K');
        ListNode n12 = new ListNode('L');
        n1.next = n2;
        n2.next = n3;
        n3.next = n4;
        n4.next = n5;
        n5.next = n6;
        n6.next = null;


        n3.down = n7;
        n7.next = n8;
        n8.next = n9;
        n9.next = n10;

        n8.down = n11;
        n11.next = n12;
        
        ListNode res = obj.flattenLinkedList(n1);
        obj.printList(res);

        // ListNode n1 = new ListNode('A');
        // ListNode n2 = new ListNode('B');
        // ListNode n3 = new ListNode('C');        
        // n1.down = n3;
        // n1.next = n2;
        // ListNode res = obj.flattenLinkedList(n1);
        // obj.printList(res);
	}

}
