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

public class Solution4 {

    













    public int findKthLargest(int[] nums, int k) {
        return partition(nums, k - 1, 0, nums.length - 1);
    }


    private int partition(int[] arr, int k, int left, int right){
        int pivot = arr[(left + right) / 2];
        printStringWithoutNewLine("line 150 pivot:" + pivot + "\n");        
        int orgL = left, orgR = right;
        printStringWithoutNewLine("line 152\n");
        printArray(arr, orgL, orgR);                              
        while(left <= right){
            // 从右向左找到第一个小于枢纽值的数
            while(arr[left] > pivot){
                left ++;
            }
            // 从左向右找到第一个大于枢纽值的数
            while(arr[right] < pivot){
                right --;
            }
            // 将两个数互换
            if(left <= right){                    
                exch(arr, left, right);
                printStringWithoutNewLine("line 166 exchange:\n");
                printArray(arr, left, right);                 
                left ++;
                right --;                
            }
            printStringWithoutNewLine("line 171:\n");
            printArray(arr, orgL, orgR);                 
        }
        printStringWithoutNewLine("line 174 exchange:\n");
        printArray(arr, orgL, orgR);                                            

        // 最后退出的情况应该是右指针在左指针左边一格
        // 这时如果右指针还大于等于k，说明kth在左半边
        printStringWithoutNewLine("line 179 orgL:" + orgL + ", left:" + left + ", right:" + right + ", orgR:" + orgR + ", k:" + k + "\n");
        if(orgL < right && k <= right) {
            printStringWithoutNewLine("line 180\n");
            printLine();
            return partition(arr, k, orgL, right);
        }
        // 这时如果左指针还小于等于k，说明kth在右半边
        if(left < orgR && k >= left) {
            printStringWithoutNewLine("line 187\n");
            printLine();
            return partition(arr, k, left, orgR);
        }
        return arr[k];
    
    }

    private void exch(int[] a, int i, int j) {
        final int tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
    }

    private boolean less(int v, int w) {
        return v < w;
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
		Solution4 obj = new Solution4();
		int[] list = new int[]{7, 1, 6, 4, 5, 2, 3};
        obj.printString("k:" + obj.findKthLargest(list, 7));
		// obj.quicksort(list, 0, list.length - 1);
        // obj.printArray(list);
	}

}
