import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

class TreeNode {
	int val;
	TreeNode left;
	TreeNode right;
	TreeNode(int x) { val = x; }
}

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


public class Solution1 {

	// Encodes a tree to a single string.
    public String serialize(TreeNode root) {
        if(root == null) {
            return "";
        }
        
        StringBuilder sb = new StringBuilder();
        Queue<TreeNode> queue = new LinkedList<TreeNode>();
        queue.offer(root);
       	sb.append(root.val + ",");
        while(!queue.isEmpty()) {
            TreeNode node = queue.poll();            
            if(node.left == null) {
            	sb.append("#,");
            } else {
            	queue.offer(node.left);
            	sb.append(node.left.val + ",");
            }
            if(node.right == null) {
            	sb.append("#,");
            } else {
            	queue.offer(node.right);
            	sb.append(node.right.val + ",");
            }
         
        }
        return sb.toString();
    }

    // Decodes your encoded data to tree.
    public TreeNode deserialize(String data) {
        if(data.length() == 0) {
            return null;
        }
        
        String[] dataArray = data.split(",");
        Queue<String> queue = new LinkedList<String>();
        for(String str: dataArray) {
            queue.offer(str);
        }
        return postOrderData(queue);
    }
    
    private TreeNode postOrderData(Queue<String> queue) {
        if(queue.isEmpty() == true) {
            return null;
        }
        
        if(queue.peek().equals("#") == true) {
            queue.poll();
            return null;
        }
        
        TreeNode node = new TreeNode(Integer.parseInt(queue.poll()));
        node.left = postOrderData(queue);
        node.right = postOrderData(queue);
        return node;
    }

	private TreeNode createTree() {
		 //       5
		 //    2      7
		 //  1   3      10		
		 TreeNode node5 = new TreeNode(5);
		 TreeNode node2 = new TreeNode(2);
		 TreeNode node1 = new TreeNode(1);
		 TreeNode node3 = new TreeNode(3);
		 TreeNode node7 = new TreeNode(7);
		 TreeNode node10 = new TreeNode(10);

		 node5.right = node7;
		 node5.left = node2;
		 node2.left = node1;
		 node2.right = node3;
		 node5.right = node7;
		 node7.right = node10; 
		 return node5;
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

    private void printLine() {
    	System.out.println("---------------------"); 
	}

	private void printStringWithoutNewLine(String arg) {
	    System.out.print(arg + ","); 
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
		String str = obj.serialize(root);
		obj.printString(str);
		TreeNode node = obj.deserialize(str);
		obj.printTree(node);
	}

}
