import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;


// private void printList(List<String> list) {
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


public class Solution1 {

    static class TreeNode {
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

    public int findClosestLeaf(TreeNode root, int k) {
        Map<TreeNode, List<TreeNode>> graph = new HashMap<TreeNode, List<TreeNode>>();
        dfs(graph, root, null);   
        printMap(graph);

        Queue<TreeNode> queue = new LinkedList<TreeNode>();
        Set<TreeNode> seen = new HashSet<TreeNode>();

        for (TreeNode node: graph.keySet()) {
            if (node != null && node.val == k) {
                queue.add(node);
                seen.add(node);
            }
        }
        printLine();
        printString("print queue:");        
        printQueue(queue) ;
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll();
            if (node != null) {
                if (graph.get(node).size() <= 1)
                    return node.val;
                for (TreeNode nei: graph.get(node)) {
                    if (!seen.contains(nei)) {
                        seen.add(nei);
                        queue.add(nei);
                    }
                }
            }
        }
        return -1;  
    }

    private TreeNode createTree() {
        //       5
        //    2      7
        //  1   3      10
        TreeNode node1 = new TreeNode(1);
        TreeNode node2 = new TreeNode(2);
        TreeNode node3 = new TreeNode(3);
        TreeNode node4 = new TreeNode(4);
        TreeNode node5 = new TreeNode(5);
        TreeNode node6 = new TreeNode(6);

        node1.left = node2;
        node1.right = node3;
        node2.left = node4;
        node4.left = node5;
        node5.left = node6;
        return node1;
    }

    public void dfs(Map<TreeNode, List<TreeNode>> graph, TreeNode node, TreeNode parent) {
        if (node != null) {
            if (!graph.containsKey(node)) {
                graph.put(node, new LinkedList<TreeNode>());
            }
            if (parent != null && !graph.containsKey(parent)) {
                graph.put(parent, new LinkedList<TreeNode>());
            }
            if( parent != null) {
                graph.get(node).add(parent);
                graph.get(parent).add(node);
            }
            dfs(graph, node.left, node);
            dfs(graph, node.right, node);
        }
    }        

    private void printMap(Map<TreeNode, List<TreeNode>> map) {
        for(TreeNode node:map.keySet()) {
            printStringWithoutNewLine(node.val + "[");  
            for(TreeNode value: map.get(node)) {
                printStringWithoutNewLine(value.val + ",");
            }
            printStringWithoutNewLine("]\n");  
        }
    }

    private void printQueue(Queue<TreeNode> list) {
        for(TreeNode s: list) {
            System.out.println(s.val + ",");
        }
    }     

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    }  

    private void printStringWithoutNewLine(String arg) {
        System.out.print(arg + ","); 
    }       

	private void printList(int[] list, int length) {
		for(int i = 0; i < length; i ++ ){
			System.out.println(list[i]);
		}
	}    

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
        TreeNode root = obj.createTree();
		System.out.println(obj.findClosestLeaf(root, 2));
	}

}
