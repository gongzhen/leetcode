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

public class LC25 {

    public ListNode createList() {
        ListNode node1 = new ListNode(1);
        ListNode node2 = new ListNode(2);
        // ListNode node3 = new ListNode(3);
        // ListNode node4 = new ListNode(4);
        // ListNode node5 = new ListNode(5);
        // ListNode node6 = new ListNode(6);
        // ListNode node7 = new ListNode(7);
        node1.next = node2;
        // node2.next = node3;
        // node3.next = node4;
        // node4.next = node5;
        // node5.next = node6;
        // node6.next = node7;
        return node1;
    }

    public ListNode reverseKGroup(ListNode head, int k) {
        
        if(head == null) {
            return null;
        }
        
        int len = 0;
        ListNode ptr = head;
        while(ptr != null) {
            ptr = ptr.next;
            len++;
        }

        ListNode current = head;
        ListNode prev = null; 
        ListNode last = null;   
        ptr = null;
        /// 1->2->3->4->5 
        /// <-1<-2(prev)  3(current)->4->5
        /// <-1(ptr)<-2(prev)  3(current)->4->5        
        /// 2(prev)->1(ptr)->  3(current)->4->5  
        /// 2(prev)->1(ptr)->  <-3<-4(prev) 5(current)  
        // printString("len: " + len);
        for(int j = len; j >= k; j = j - k) {
            if(j < k) {
                break;
            }
            for(int i = 0; i < k; i++) { /// reverse each k group
                ListNode next = current.next;
                current.next = prev;
                prev = current;
                current = next;
            }
            ptr = prev;
            if(j == len) {
                head = prev;
                printString("line 213 head.val:" + head.val);                
            } 
            int n = 0;               
            printList(prev);
            if(last != null) {
                last.next = prev;
            }
            while(n < k && prev != null && prev.next != null) {             
                prev = prev.next; 
                last = prev;               
                n++;
            }
            prev.next = current; 
            prev = null;
            printList(head);
        }
        printString("head.val:" + head.val);
        printList(head);
        return head;
    }

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    }    

	private void printList(ListNode node) {
        ListNode ptr = node;
        printStringWithoutNewLine("[ ");
        while(ptr != null) {
            printStringWithoutNewLine(ptr.val + ", ");
            ptr = ptr.next;
        }
        printStringWithoutNewLine("]\n");
	}    

    private void printStringWithoutNewLine(String arg) {
        System.out.print(arg + ","); 
    } 


	public static void main(String[] args) {
		LC25 obj = new LC25();
        ListNode root = obj.createList();
        // obj.reverseKGroup(root, 2);
        // obj.reverseKGroup(root, 3);
        // obj.reverseKGroup(root, 8);
        obj.reverseKGroup(root, 1);
	}

}
