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
//     for(int n: list) {
//         System.out.println(n);
//     }
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

    int partition(int arr[], int low, int high) {
        printArray(arr);
        int pivot = arr[high];        
        int i = low; // index of smaller element
        for (int j=low; j<high; j++) {
            // If current element is smaller than or
            // equal to pivot
            if (arr[j] <= pivot) {
                // swap arr[i] and arr[j]                
                if(i != j) {
                    printString("arr[" + j + "]:" + arr[j] + ", arr[" + i + "]:" + arr[i]);                    
                    int temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;                        
                }
                i++;
            }
        }

        // swap arr[i+1] and arr[high] (or pivot)
        int temp = arr[i];
        arr[i] = arr[high];
        arr[high] = temp;
        printArray(arr, low, i - 1);
        printString("pivot:" + pivot);
        printArray(arr, i + 1, high);
        printLine();
        return i;
    }

    void sort(int arr[], int low, int high) {
        if (low < high) {
            /* pi is partitioning index, arr[pi] is 
              now at right place */
            int pi = partition(arr, low, high);
 
            // Recursively sort elements before
            // partition and after partition
            sort(arr, low, pi-1);
            sort(arr, pi+1, high);
        }
    }

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

    private void printLine() {
    	System.out.println("---------------------"); 
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
            printStringWithoutNewLine(list[i] + ", ");
        }
        printStringWithoutNewLine("]\n");
    } 

    private void printStringWithoutNewLine(String arg) {
        System.out.print(arg); 
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
		int[] list = new int[]{5, 4, 3, 2, 1, 6};
        // obj.partition(list, 0, list.length - 1);
		obj.sort(list, 0, list.length - 1);
        obj.printArray(list);
	}

}
