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

class UndirectedGraphNode {
    int label;
    List<UndirectedGraphNode> neighbors;
    UndirectedGraphNode(int x) {
        label = x;
        neighbors = new ArrayList<UndirectedGraphNode>();
    }
}

public class Solution2 {

    public UndirectedGraphNode cloneGraph(UndirectedGraphNode node) {
        if(node == null) {
            return null;
        }
        Queue<UndirectedGraphNode> queue = new LinkedList<UndirectedGraphNode>();
        UndirectedGraphNode clone = new UndirectedGraphNode(node.label);        
        queue.offer(node);

        HashMap<Integer, UndirectedGraphNode> map = new HashMap<Integer, UndirectedGraphNode>();
        map.put(clone.label, clone);
        printString("line 123 clone:" + clone.label);
        while(queue.isEmpty() != true ) {
            UndirectedGraphNode root = queue.poll(); /// root is from original node.
            printString("line 126 pop original node:" + root.label);
            List<UndirectedGraphNode> neighbors = root.neighbors;
            for(UndirectedGraphNode n : neighbors) {
                printString("line 129 original neighbor node:" + n.label);
                if(!map.containsKey(n.label)) {
                    printString("line 129 neighbor node:" + n.label);
                    map.put(n.label, new UndirectedGraphNode(n.label));
                    printString("line 133 map add copy node:" + n.label);
                    queue.offer(n);
                }
                printString("line 136 printMap:");
                printMap(map);
                map.get(root.label).neighbors.add(map.get(n.label));
            }
        }
        return clone;
    }

    private UndirectedGraphNode createGraph() {
        UndirectedGraphNode node0 = new UndirectedGraphNode(0);
        UndirectedGraphNode node1 = new UndirectedGraphNode(1);
        UndirectedGraphNode node2 = new UndirectedGraphNode(2);
        node0.neighbors.add(node1);
        node0.neighbors.add(node2);
        node1.neighbors.add(node2);
        node2.neighbors.add(node2);
        return node0;
    }

    private void printGraph(UndirectedGraphNode node) {
        if (node == null) {
            return;
        }
        printString("lead node:" + node.label);
        for(UndirectedGraphNode n : node.neighbors) {
            printGraph(n);
            printString("node:" + n.label);
        }
    }

    private void printMap(HashMap<Integer, UndirectedGraphNode> map) {
        for(int key:map.keySet()) {
            UndirectedGraphNode node = map.get(key);
            printString("key:" + node.label + ",value:" + node.label);
        }
    }


    private void printLine() {
    	System.out.println("---------------------"); 
	}

    public void printString(String arg) {
        System.out.println(arg); 
    }    

	private void printList(int[] list, int length) {
		for(int i = 0; i < length; i ++ ){
			System.out.println(list[i]);
		}
	} 

	public static void main(String[] args) {
		Solution2 obj = new Solution2();
		UndirectedGraphNode node = obj.createGraph();
        UndirectedGraphNode clone = obj.cloneGraph(node);
        obj.printString("clone:" + clone.label);
	}

}
