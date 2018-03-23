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

public class Solution1 {

   public int smallestDistancePair(int[] nums, int k) {
        if(nums.length == 0) {
            return 0;
        }
        
        PriorityQueue<Integer> pq = new PriorityQueue<Integer>(k, new Comparator<Integer>(){
            public int compare(Integer a, Integer b) {
                printString("a:" + a + ", b:" + b + "=> compare:" + a.compareTo(b));
                return b.compareTo(a);            
            }
        });

        pq.offer(4);
        pq.offer(2);
        pq.offer(1);
        
        // pq.offer(3);

        while(!pq.isEmpty()) {
            Integer top = pq.poll();
            printString("top:" + top);
        }

        return 1;
        
        // for(int i = 0; i < nums.length; i++) {
        //     for(int j = i + 1; j < nums.length; j++) {
        //         int d = Math.abs(nums[i] - nums[j]);
        //         pq.offer(d);
        //         if(pq.size() > k) {
        //             pq.poll();
        //         }
        //     }
        // }
        
        // int num = -1;
        // while(!pq.isEmpty()) {
        //     if(k == pq.size()) {
        //         num = pq.poll();    
        //         break;
        //     }
        //     num = pq.poll();
        //     k--;
        // }
        // return num;
    }

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

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
		int[] list = new int[]{1, 1, 3, 5, 8};
        obj.smallestDistancePair(list, 1);
        // System.out.println(obj.smallestDistancePair(list, 1));
        // System.out.println(obj.smallestDistancePair(list, 2));
        // System.out.println(obj.smallestDistancePair(list, 3));
        // System.out.println(obj.smallestDistancePair(list, 4));
        // System.out.println(obj.smallestDistancePair(list, 5));
        // System.out.println(obj.smallestDistancePair(list, 6));
        // System.out.println(obj.smallestDistancePair(list, 8));
        // System.out.println(obj.smallestDistancePair(list, 9));
	}

}
