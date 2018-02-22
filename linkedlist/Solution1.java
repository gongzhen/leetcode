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

// class Interval {
//     int start;
//     int end;
//     Interval() { start = 0; end = 0; }
//     Interval(int s, int e) { start = s; end = e; }
// }
// private TreeNode createTree() {
//     //       5
//     //    2      7
//     //  1   3      10
//     TreeNode node5 = new TreeNode(5);
//     TreeNode node2 = new TreeNode(2);
//     TreeNode node1 = new TreeNode(1);
//     TreeNode node7 = new TreeNode(7);
//     TreeNode node3 = new TreeNode(3);
//     TreeNode node10 = new TreeNode(10);
//     node5.left = node2;
//     node5.right = node7;
//     node2.left = node1;
//     node2.right = node3;
//     node5.right = node7;
//     node7.right = node10; 
//     return node5;
// }  
// private void printList(List<String> list) {
//  for(String s: list) {
//      System.out.println(s);
//  }
// }
// private void printListMap(Map<Integer, List<Integer>> map) {
//     for(Integer key:map.keySet()) {
//         List<Integer> list = map.get(key);
//         printStringWithoutNewLine("key:" + key + "[");   
//         for(int n : list) {
//             printStringWithoutNewLine(n + ", ");    
//         }
//         printString("]");               
//     }
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
// private void printArray(int[] list) {
//     printStringWithoutNewLine("[");
//     int i = 0;
//     for(int n : list) {
//         printStringWithoutNewLine("[" + i + "]" + n + ", ");
//         i++;
//     }
//     printStringWithoutNewLine("]\n");
// }  
// private void printArray(int[] list, int s, int e) {
//     printStringWithoutNewLine("[");
//     for(int i = s; i <= e; i++) {
//         printStringWithoutNewLine("[" + i + "]" + list[i] + ", ");
//     }
//     printStringWithoutNewLine("]\n");
// } 
// private void printStringWithoutNewLine(String arg) {
//     System.out.print(arg); 
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
    int val;
    ListNode next;
    ListNode(int x) {
        val = x;
        next = null;
    }
}

public class Solution1 {

    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        if(l1 == null) {
            return l2;
        }
        if(l2 == null) {
            return l1;
        }
        int len1 = 0;
        int len2 = 0;
        ListNode p1 = l1;        
        while(p1 != null) {
            len1++;
            p1 = p1.next;
        }
        ListNode p2 = l2;
        while(p2 != null) {
            len2++;
            p2 = p2.next;
        }  
        
        if(len1 < len2) {
            return addTwoNumbers(l2, l1);
        }
        
        /// l1 >= l2;
        p1 = reverse(l1);
        printList(p1);
        p2 = reverse(l2);      
        printList(p2);
        ListNode head = new ListNode(-1);
        head.next = p1;
        int carry = 0;
        while(p2 != null) {
            int sum = p2.val + p1.val + carry;
            carry = sum / 10;
            p1.val = sum % 10;
            p1 = p1.next;
            p2 = p2.next;
        }
        
        while(p1 != null) {
            int sum = p1.val + carry;
            carry = sum / 10;
            p1.val = sum % 10;
            p1 = p1.next;
        }        
        p1 = reverse(head.next);
        printList(p1);
        return p1;
    }
    
    private ListNode reverse(ListNode node) {
        if(node == null) {
            return null;
        }
        ListNode current = node;
        ListNode prev = null;
        while(current != null) {
            ListNode next = current.next;
            current.next = prev;
            prev = current;
            current = next;
        }
        // ListNode ptr = prev;
        // while(ptr != null) {
        //     printString("" + ptr.val + ",");
        //     ptr = ptr.next;
        // }
        return prev;
    }
    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    } 

    private void printList(ListNode node) {
        if(node == null) {
            return;
        }
        ListNode p1 = node;
        while(p1 != null) {
            printStringWithoutNewLine(p1.val + ", ");
            p1 = p1.next;
        }
        printString("");
    }  

    private void printStringWithoutNewLine(String arg) {
        System.out.print(arg + ","); 
    }     

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		ListNode n1 = new ListNode(7);
        ListNode n2 = new ListNode(2);
        ListNode n3 = new ListNode(4);
        ListNode n4 = new ListNode(3);
        ListNode n5 = new ListNode(5);
        ListNode n6 = new ListNode(6);
        ListNode n7 = new ListNode(4);        
		n1.next = n2;
        n2.next = n3;
        n3.next = n4;
        n5.next = n6;
        n6.next = n7;
        obj.addTwoNumbers(n1, n5);
	}

}
