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

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode(int x) { val = x; }
} 

public class LC637 {

    private static class Node {
        double sum;
        int count;
        public Node(double sum, int count) {
            this.sum = sum;
            this.count = count;
        }
    }
    
    public List<Double> averageOfLevels(TreeNode root) {
        List<Node> nodes = new ArrayList<Node>();
        dfs(root, nodes, 0);
        
        
        List<Double> res = new ArrayList<Double>();
        for(Node node : nodes) {
            res.add(node.sum / node.count);
        }
        return res;
    }
    
    private void dfs(TreeNode node, List<Node> nodes, int level) {
        if(node == null) {
            return;
        }
        
        if(nodes.size() == level) {
            nodes.add(new Node(0.0, 0));
        }
        
        nodes.get(level).sum = nodes.get(level).sum + node.val;
        nodes.get(level).count = nodes.get(level).count + 1;
        
        dfs(node.left, nodes, level + 1);
        dfs(node.right, nodes, level + 1);
    }	

    public List<Double> averageOfLevelsBFS(TreeNode root) {
        
        List<Double> res = new ArrayList<Double>();
        if(root == null) {
            return res;
        }
        
        Queue<Double> queue = new LinkedList<Double>();
        List<Double> res = new ArrayList<Double>();
        queue.offer(root);
        while(!queue.isEmpty()) {
            int size = queue.size();            
            double sum = 0.0;
            for(int i = 0; i < size; i++) {
                TreeNode node = queue.poll();
                sum += node.val;
                if(node.left  != null) {
                    queue.offer(node.left);
                }
                if(node.right  != null) {
                    queue.offer(node.right);
                }                
            }
            res.add(sum / size);
        }
        return res;
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
		LC637 obj = new LC637();
	}

}
