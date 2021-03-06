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

public class LC79 {

   public boolean exist(char[][] board, String word) {
        if(board.length == 0 | board[0].length == 0) {
            return false;
        }
        
        int m = board.length;
        int n = board[0].length;
        boolean[][] visited = new boolean[m][n];
        for(int i = 0; i < m; i++) {
            for(int j = 0; j < n; j++) {
                if(word.charAt(0) == board[i][j]) {
                    if(dfs(board, visited, word, m, n, i, j, 0) == true) {
                        return true;    
                    }                    
                }
            }
        }
        return false;
    }
    
    private int[][] direction = new int[][]{{-1, 0},{1, 0},{0, 1},{0, -1}};
    private boolean dfs(char[][] board, boolean[][] visited, String word, int m, int n, int i, int j, int pos) {
        printString("i: " + i + ",j:" + j);
        if(i < 0 || j < 0 || i >= m || j >= n || pos >= word.length() ||word.charAt(pos) != board[i][j] || visited[i][j] == true) {
            return false;
        }        
        if(pos + 1 == word.length()) {
            return true;
        }
        visited[i][j] = true;
        
        boolean exist = dfs(board, visited, word, m, n, i - 1, j, pos + 1) 
            || dfs(board, visited, word, m, n, i + 1, j, pos + 1) 
            || dfs(board, visited, word, m, n, i, j - 1, pos + 1) 
            || dfs(board, visited, word, m, n, i, j + 1, pos + 1);        
        
        // boolean exist = false;
        // for(int[] list: direction) {
        //     int x = i + list[0];
        //     int y = i + list[1];
        //     exist = exist || dfs(board, visited, word, m, n, x, y, pos + 1);
        // }
        if(exist == true) {
            return true;
        }
        visited[i][j] = false;
        return false;        
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
		LC79 obj = new LC79();
		String s1 = "ABCE";
        String s2 = "SFCS";
        String s3 = "ADEE";
        char[][] matrix = new char[3][4];
        for(int i = 0; i < matrix.length; i++) {
            for(int j = 0; j < matrix[0].length; j++) {
                if(i == 0) {
                    matrix[i][j] = s1.charAt(j);
                } else if(i == 1) {
                    matrix[i][j] = s2.charAt(j);
                } else if(i == 2) {
                    matrix[i][j] = s3.charAt(j);
                }                 
            }
        }

		System.out.println(obj.exist(matrix, "ABCCED"));
	}

}
