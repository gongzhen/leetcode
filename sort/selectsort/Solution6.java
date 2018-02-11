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

public class Solution6 {

    public int findKthLargest(int[] nums, int k) {
        return quickSelect(nums, 0, nums.length - 1, k);
    }

    private int quickSelect(int[] nums, int lo, int hi, int k) {
        printStringWithoutNewLine("lo:" + lo + ", hi:" + hi + ", target == " + k + "\n");
        printArray(nums, lo, hi);
        int left = lo, right = hi;        
        int pivot = nums[left + (right - left) / 2];
        while(left <= right) {            
            printString("pivot:" + pivot);    
            while(left <= right && nums[left] > pivot) {
                printString("left:" + left);    
                left++;
            }            
            while(left <= right && nums[right] < pivot) {
                printString("right:" + right);  
                right--;
            }            
            if(left <= right) {
                printString("==========>149 left:" + left + " right: " + right + " are swaped.");    

                int temp = nums[left];
                nums[left] = nums[right];
                nums[right] = temp;
                left++;
                right--;
                printString("==========>156 left:" + left + ", right:" + right);
            }
            printArray(nums, lo, hi);            
            printLine();
        }
        if(lo + k - 1 <= right) {
            printString("==========>162 lo + k - 1 :" + (lo + k - 1 ) + ", right:" + right);
            return quickSelect(nums, lo, right, k);
        }        
        if(lo + k - 1 >= left) {
            printString("==========>166 lo + k - 1:" + (lo + k - 1) + ", left:" + left);
            return quickSelect(nums, left, hi, k - (left - lo));
        }

        return nums[right + 1];
    }

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

    private void printLine() {
    	System.out.println("----------------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    }    

    private void printArray(int[] list) {
        printStringWithoutNewLine("[");
        for(int n : list) {
            printStringWithoutNewLine(n + ", ");
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

	private void printList(int[] list, int length) {
		for(int i = 0; i < length; i ++ ){
			System.out.println(list[i]);
		}
	}    

	public static void main(String[] args) {
		Solution6 obj = new Solution6();
        int[] list = new int[]{4, 3, 6, 2, 1, 7, 5};
        obj.printString("k:" + obj.findKthLargest(list, 1));
		// obj.printString("k:" + obj.findKthLargestSelection(list, 7));
  //       obj.printString("k:" + obj.findKthLargestSelection(list, 3));
  //       obj.printString("k:" + obj.findKthLargestSelection(list, 4));
  //       obj.printString("k:" + obj.findKthLargestSelection(list, 5));
  //       obj.printString("k:" + obj.findKthLargestSelection(list, 6));
  //       obj.printString("k:" + obj.findKthLargestSelection(list, 7));
	}

}
