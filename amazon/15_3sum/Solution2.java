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

public class Solution2 {

    public List<List<Integer>> threeSum(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        if(nums.length == 0) {
            return res;
        }
        
        QuickSort(nums, 0, nums.length - 1);
        
        for(int i = 0; i < nums.length; i++) {
            if(i > 0 && nums[i - 1] == nums[i]) {
                continue;
            }
            int target = -nums[i];
            twoSum(nums, i + 1, nums.length - 1, target, res);
        }
        return res;
    }
    
private void twoSum(int[] nums, int start, int end, int target, List<List<Integer>> res) {
        int i = start;
        int j = end;
        while(i < j) {
            if(nums[i] + nums[j] == target ) {
                List<Integer> list = new ArrayList<Integer>();
                list.add(nums[start - 1]);
                list.add(nums[i]);
                list.add(nums[j]);
                res.add(list);
                i++;
                j--;
                while(i < j && nums[i] == nums[i - 1]) {
                    i++;    
                }
                
                while(j > i && nums[j] == nums[j - 1]) {
                    j--;    
                }
                
            } else if (nums[i] + nums[j] < target) {
                i++;
            } else if (nums[i] + nums[j] > target) {
                j--;
            }
        }
    }
    
    private void QuickSort(int[] nums, int left, int right) {
        int i = left; int j = right;
        int pivot = nums[i + (j - i) / 2];
        while(i <= j) {
            while(nums[i] < pivot) {
                i++;
            }
            while(nums[j] > pivot) {
                j--;
            }      
            if(i <= j) {
                swap(nums, i, j);
                i++;
                j--;
            }
        }
        
        if(left < j) {
            QuickSort(nums, left, j);
        }
        if(i < right) {
            QuickSort(nums, i, right);
        }        
    }
    
    private void swap(int[] nums, int left, int right) {
        int temp = nums[left];
        nums[left]= nums[right];
        nums[right] = temp;
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
		Solution2 obj = new Solution2();
		int[] list = new int[]{-2,0,1,1,2};
		System.out.println(obj.threeSum(list));
	}

}
