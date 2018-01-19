import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;


// class ListNode {
//     int val;
//     ListNode next;
//     ListNode(int x) {
//         val = x;
//         next = null;
//     }
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


// 245. Subtree 
public class Solution1 {

    public int maxSubArrayLen_3(int[] nums, int k) {
        Map<Integer, List<Integer>> map = new HashMap<Integer, List<Integer>>();
        int sum = 0;
        for(int i = 0; i < nums.length; i++) {
            sum += nums[i];
            if(map.containsKey(sum) == false) {
                map.put(sum, new ArrayList<Integer>());
            }
            List<Integer> list = map.get(sum);
            list.add(i);
        }
        int max = 0;        
        for(Integer key: map.keySet()) {
            if(key == k) {
                List<Integer> list = map.get(key);
                max = Math.max(max, list.get(list.size() - 1) + 1);
            } else if (map.containsKey(key - k) == true) {
                List<Integer> list1 = map.get(key);
                List<Integer> list2 = map.get(key - k);
                max = Math.max(max, list1.get(list1.size() - 1) - list2.get(0));
            }
        }
        return max;
    }

    public int maxSubArrayLen_2(int[] nums, int k) {
        printArray(nums);
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        int sum = 0;
        int maxLen = 0;
        for(int i = 0; i < nums.length; i++) {
            sum += nums[i];
            printString("[" + i + "]=>" + "sum-k:" + (sum - k));
            if(sum == k) {
                maxLen = i + 1;
            }             
            else {
                if (map.containsKey(sum - k) == true) {
                    maxLen = Math.max(maxLen, i - map.get(sum - k));
                } else {
                    maxLen = Math.max(maxLen, i - i);                    
                } 
            }     
            printString("maxLen:" + maxLen);
            map.put(sum, i);
            printMap(map);
            printLine();
        }
        return maxLen;
    } 

    public int maxSubArrayLen_1(int[] nums, int k) {
        printArray(nums);
        Map<Integer, Integer> seen = new HashMap<>();
        int max = 0;
        for (int i = 0, sum = 0; i < nums.length; i++) {
            sum += nums[i];
            printString("[" + i + "]=>" + "sum-k:" + (sum - k) + ", sumsumsum:" + sum);
            if (sum == k) {
                max = i + 1; /* i+1 must be longest by now, so no need to max() */
            }
            else {
                printString("seen.getOrDefault(sum - k, i):" + seen.getOrDefault(sum - k, i));
                max = Math.max(max, i - seen.getOrDefault(sum - k, i)); /* [0,j]=sum-k, (j,i]=k */
            }
            seen.putIfAbsent(sum, i);
            printMap(seen);
            printString("maxmaxmmax==:" + max);
            printLine();
        }
        return max;
    }         

    private void printListMap(Map<Integer, List<Integer>> map) {
        for(Integer key:map.keySet()) {
            List<Integer> list = map.get(key);
            printStringWithoutNewLine("key:" + key + "[");   
            for(int n : list) {
                printStringWithoutNewLine(n + ", ");    
            }
            printString("]");               
        }
    }


    private void printMap(Map<Integer, Integer> map) {
        for(Integer key:map.keySet()) {
            Integer value = map.get(key);
            printString("sum:" + key + " , index[" + value + "]");
        }
    }

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

    private void printStringWithoutNewLine(String arg) {
        System.out.print(arg); 
    } 


	public static void main(String[] args) {
		Solution1 obj = new Solution1();
        // int[] list = new int[]{1, -1, 5, -2, 3, -3, 3};
        // System.out.println(obj.maxSubArrayLen_2(list, 3));
        int[] list = new int[]{1, 0, -1};
        System.out.println(obj.maxSubArrayLen_3(list, -1));
	}

}
