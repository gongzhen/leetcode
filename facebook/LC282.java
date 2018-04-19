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

public class LC282 {

    public List<String> addOperators_2(String num, int target) {
        List<String> res = new ArrayList<String>();
        if(num.length() == 0) {
            return res;
        }
        String s = "";
        String ops = "+-*";
        char[] op = ops.toCharArray();
        dfs_2(res, num, s, target, 0, op); 
        printList(res);
        return res;
    }   

    private void dfs_2(List<String> res, String num, String str, int target, int pos, char[] op) {
        if(pos == num.length()) {
            printString("175 " + str);
            res.add(str);
            return;
        }
        
        for(int j = 0; j < op.length; j++) {
            if(pos == 0) {
                /// printString("182 " + (str + num.charAt(pos) + op[j]));
                dfs_2(res, num, str + num.charAt(pos) + op[j], target, pos + 1, op);
            } else {
                printString("185 " + (str + num.charAt(pos) + op[j]));
                dfs_2(res, num, str + num.charAt(pos) + op[j], target, pos + 1, op);
            }            
        }            
    }     

    public List<String> addOperators(String num, int target) {
        List<String> res = new ArrayList<String>();
        
        dfs(res, num, "", 0, target, 0, 0);
        printList(res);
        return res;
    }
    
    private void dfs(List<String> res, String num, String str, int pos, int target, long sum, long prev) {
        if(pos == num.length() && sum == target) {
            res.add(str);
            return;
        }
        
        for(int i = pos; i < num.length(); i++) {
            if( num.charAt(i) == '0') {
                printString("i:" + i + "= 0" );
            }
            if( i != pos && num.charAt(pos) == '0') { /// error:charAt(i) should be pos. 1 * 05 is not right.
                continue;
            }
            String subStr = num.substring(pos, i+1);
            printString("subStr:" + subStr);
            long n = Long.parseLong(subStr);
            if(pos == 0) {
                dfs(res, num, subStr, i + 1, target, sum + n, n);   
            } else {
                dfs(res, num, str + "+" + subStr, i + 1, target, sum + n, n);
                dfs(res, num, str + "-" + subStr, i + 1, target, sum - n, -n);
                dfs(res, num, str + "*" + subStr, i + 1, target, sum - prev + prev * n, prev * n);
            }                        
        }
    }

    private void printList(List<String> list) {
        printStringWithoutNewLine("[");
        for(String s: list) {
            printStringWithoutNewLine(s + ", ");
        }
        printStringWithoutNewLine("]");        
    }   

    private void printStringWithoutNewLine(String arg) {
        System.out.print(arg + ","); 
    }     

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    } 

	public static void main(String[] args) {
		LC282 obj = new LC282();
		// obj.addOperators("105", 5);
        obj.addOperators_2("105", 5);
	}

}
