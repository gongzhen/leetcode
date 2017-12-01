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

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode(int x) { val = x; }
}

class ListNode {
    int val;
    ListNode next;
    ListNode(int x) {
        val = x;
        next = null;
    }
}

public class Solution2 {

    public int[] findFrequentTreeSum(TreeNode root) {
        HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
        dfs(root, map);     
        if(map.size() == 0) {
            return new int[]{};
        }

        printMap(map);
        int max = Integer.MIN_VALUE;
        List<Integer> list = new ArrayList<Integer>();
        for(int k: map.keySet()) {
            int v = map.get(k);                       
            if(v > max){
                max = v;
                list.clear();
                list.add(k);
            } else if (v == max ){                
                list.add(k); 
            }
        }
        printList(list);
        return new int[]{};        
    }	

    private int dfs(TreeNode node, HashMap<Integer, Integer> map) {
        if(node == null) {
            return 0;
        }

        if(node.left == null && node.right == null) {
            if(map.containsKey(node.val) == true) {
                int count = map.get(node.val);
                map.put(node.val, count + 1);
            } else {
                map.put(node.val, 1);
            }
            return node.val;
        }

        int currentSum = node.val;
        if(node.left != null) {
            currentSum += dfs(node.left, map);
        }        
        if(node.right != null) {
            currentSum += dfs(node.right, map);    
        }
        if(map.containsKey(currentSum) == true) {
            int count = map.get(currentSum);
            map.put(currentSum, count+1);
        } else {
            map.put(currentSum, 1);
        }
        return currentSum;
    }

    private void printMap(HashMap<Integer, Integer> map) {
        for(Integer key:map.keySet()) {
            Integer value = map.get(key);
            printString("key:" + key + ",value:" + value);
        }
    }    

    public TreeNode createTree() {
        //       5
        //    2      7
        //  1   3      10
        TreeNode node5 = new TreeNode(5);
        TreeNode node2 = new TreeNode(2);
        TreeNode node3 = new TreeNode(3);
        TreeNode node1 = new TreeNode(1);
        TreeNode node7 = new TreeNode(7);
        TreeNode node10 = new TreeNode(10);

        node5.left = node2;
        node5.right = node7;
        node2.left = node1;
        node2.right = node3;
        // node5.right = node7;
        node7.right = node10; 
        return node5;
    }

    public TreeNode createTree1() {
        //       5
        //    2      7
        //  1   3      10
        TreeNode node5 = new TreeNode(5);
        TreeNode node2 = new TreeNode(2);
        TreeNode node_5 = new TreeNode(-5);


        node5.left = node2;
        node5.right = node_5;
        return node5;
    }    

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    }    

    private void printList(List<Integer> list) {
        for(int s: list) {
            System.out.println(s);
        }
    }

	public static void main(String[] args) {
		Solution2 obj = new Solution2();
		TreeNode root = obj.createTree1();
		obj.findFrequentTreeSum(root);
	}

}
