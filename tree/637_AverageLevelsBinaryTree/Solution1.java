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


class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode(int x) { val = x; }
}

class Node {
    double sum;
    int count;

    Node(double sum, int count) {
        this.sum = sum;
        this.count = count;
    }
}

public class Solution1 {

    public List<Double> averageOfLevels(TreeNode root) {
        List<Node> list = new ArrayList<Node>();
        int level = 0;
        dfs(root, level, list);
        List<Double> result = new ArrayList<>();
        for(Node _node : list) {
            printString(_node.sum + ", " + _node.count);
            result.add((_node.sum / _node.count));
        }
        return result;
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
        node5.right = node7;
        node7.right = node10; 
        return node5;
    }    
    
    private void dfs(TreeNode node, int level, List<Node> list) {
        if(node == null) {
            return;            
        }


        if(level == list.size()) {
            printString("line 141:" + (double)node.val);            
            Node _node = new Node((double)node.val, 1);
            printString(_node.sum + "=>" + _node.count);
            list.add(_node);
        } else {
            list.get(level).sum += node.val;
            list.get(level).count += 1;            
        }
        dfs(node.left, level + 1, list);
        dfs(node.right, level + 1, list);
    }
    
    private void printTree(TreeNode root) {
        if(root == null) { return ; }
        Queue<TreeNode> queue = new LinkedList<TreeNode>();
        queue.offer(root);
        while(!queue.isEmpty()) {
            int size = queue.size();
            for(int i = 0; i < size; i++) {
                TreeNode node = queue.poll();                
                if(node.left != null) {
                    queue.offer(node.left);
                }
                if(node.right != null) {
                    queue.offer(node.right);
                }                
                printStringWithoutNewLine("" + node.val);
            }
            printLine();
        }
    }  

    private void printStringWithoutNewLine(String arg) {
        System.out.print(arg + ","); 
    }        

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
		Solution1 obj = new Solution1();
        TreeNode root = obj.createTree();
        obj.printTree(root);
		System.out.println(obj.averageOfLevels(root));
	}

}
