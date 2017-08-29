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

public class Solution2 {

    // http://www.cnblogs.com/yrbbest/p/4491674.html
    public int numIslands(char[][] grid) {
        if(grid == null || grid.length == 0 || grid[0].length == 0) {
            return 0;
        }
        int m = grid.length;
        int n = grid[0].length;
        int count = 0;
        for(int i = 0; i < m; i++) {
            for(int j = 0; j < n; j++) {
                if(grid[i][j] == '1') {                    
                    bfs(grid, i, j);
                    count++;                                        
                }
            }
        }
        return count;
    }

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

    private void bfs(char[][] matrix, int i, int j) {
        int m = matrix.length;
        int n = matrix[0].length;
        Queue<int[]> queue = new LinkedList<int[]>();
        queue.offer(new int[]{i, j});
        while(!queue.isEmpty()) {      
            int[] xAndY = queue.poll();
            int x = xAndY[0];
            int y = xAndY[1];
            if(matrix[x][y] == '0') {
                continue;
            }
            matrix[x][y] = '0';
            if(x - 1 > 0 && matrix[x - 1][y] == '1') {
                queue.offer(new int[]{x - 1, y});
            }
            if(x + 1 < m && matrix[x + 1][y] == '1') {
                queue.offer(new int[]{x + 1, y});         
            }
            if(y - 1 > 0 && matrix[x][y - 1] == '1') {
                queue.offer(new int[]{x, y - 1});         
            }
            if(y + 1 < n && matrix[x][y + 1] == '1') {
                queue.offer(new int[]{x, y + 1});        
            } 
        }   
    }

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printQueue(Queue<int[]> list) {
        for(int[] s: list) {
            printString("[" + s[0] + ", " + s[1] + "],");
        }
    }     

    private void printString(String arg) {
        System.out.println(arg); 
    }    

    private void printList(List<int[]> list) {
        for(int[] array: list) {
            printString("[" + array[0] + "][" + array[1] + "]");
        }
    }  

    private void printMatrix(char[][] matrix) {
        for(char[] s: matrix) {
            for(char n: s) {
                System.out.print(n + ",");
            }
            System.out.println();            
        }
    }       

	public static void main(String[] args) {
		Solution2 obj = new Solution2();
		char[][] matrix = new char[][]{{'1','1','1','1','0'},{'1','1','0','0','0'},{'0','0','1','0','0'},{'0','0','0','1','1'}};
		obj.printMatrix(matrix);
        System.out.println(obj.numIslands(matrix));
	}

}
