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

public class Solution1 {

    public List<int[]> pacificAtlantic(int[][] matrix) {
        List<int[]> result = new ArrayList<int[]>();
        int m = matrix.length;
        int n = matrix[0].length;
        Queue<int[]> pQueue = new LinkedList<int[]>();
        Queue<int[]> aQueue = new LinkedList<int[]>();
        boolean[][] PC = new boolean[m][n];
        boolean[][] AT = new boolean[m][n];
        // first and last colm from 0 to n
        for(int i = 0; i < m; i++) {
            PC[i][0] = true; // PC first column
            AT[i][n - 1] = true;
            pQueue.offer(new int[]{i, 0});
            aQueue.offer(new int[]{i, n - 1});            
        }    

        // first row and last row from 0 to m
        for(int i = 0; i < n; i++) {
            PC[0][i] = true;            
            AT[m - 1][i] = true;
            pQueue.offer(new int[]{0, i});
            aQueue.offer(new int[]{m - 1, i});
        }

        bfs(matrix, pQueue, PC);
        bfs(matrix, aQueue, AT);

        printMatrix(PC);
        printLine();        
        printMatrix(AT);

        for(int i = 0; i < m; i++) {
            for(int j = 0; j < n; j ++) {
                if(PC[i][j] == true && AT[i][j] == true) {
                    result.add(new int[]{i, j});
                }
            }
        }

        printList(result);

        return result;
    }

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

    private void bfs(int[][] matrix, Queue<int[]> queue, boolean[][] visited) {
        int m = matrix.length;
        int n = matrix[0].length;
        while(!queue.isEmpty()) {
            int[] xAndY = queue.poll();
            int x = xAndY[0];
            int y = xAndY[1];
            for(int[] dir : direction) {
                int nX = x + dir[0];
                int nY = y + dir[0];
                if(nX >= 0 && nX < m && nY >= 0 && nY < n && visited[nX][nY] == false && matrix[x][y] < matrix[nX][nY]) {
                    queue.offer(new int[] {nX, nY});
                    visited[nX][nY] = true;
                }
            }
        }
    }

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    }    

    private void printList(List<int[]> list) {
        for(int[] array: list) {
            printString("[" + array[0] + "][" + array[1] + "]");
        }
    }  

    private void printMatrix(boolean[][] matrix) {
        for(boolean[] s: matrix) {
            for(boolean n: s) {
                System.out.print(n + ",");
            }
            System.out.println();            
        }
    }       

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		int[][] matrix = new int[][]{{1,2,2,3,5},{3,2,3,4,4},{2,4,5,3,1},{6,7,1,4,5},{5,1,1,2,4}};
		System.out.println(obj.pacificAtlantic(matrix));
	}

}
