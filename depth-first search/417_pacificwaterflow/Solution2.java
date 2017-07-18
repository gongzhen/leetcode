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
// private void createTree() {
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
//    System.out.println(s);
//  }
// }
// private void printQueue(Queue<String> list) {
//  for(String s: list) {
//    System.out.println(s);
//  }
// } 
// private void printListOfList(List<List<Integer>> listOflist) {
//  for(List<Integer> list: listOflist){
//    for(int n : list) {
//      System.out.print(n + ", ");
//    }
//    System.out.println();
//  }
// }
// private void printMatrix(int[][] matrix) {
//     for(int[] s: matrix) {
//         for(int n: s) {
//             System.out.print(n + ",'");
//         }
//         System.out.println();            
//     }
// }  
//  private void scannerIn() {
//    Scanner scanner = new Scanner(System.in);
//    scanner.nextLine();
// }

public class Solution2 {

  int[][] direction = new int[][]{{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
  
  private void dfs(int x, int y, int[][] matrix, boolean[][] visited) {

      visited[x][y] = true;

      for(int[] dir: direction) {
          int nx = x + dir[0];
          int ny = y + dir[1];

          if(nx >= 0 && ny >= 0 && nx < matrix.length && ny < matrix[nx].length ) {
              if(visited[nx][ny] == false && matrix[x][y] <= matrix[nx][ny]) {
                  dfs(nx, ny, matrix, visited);
              }
          }
      }
  }

  public List<int[]> pacificAtlantic(int[][] matrix) {
      List<int[]> res = new ArrayList<int []>();
      if(matrix == null || matrix.length == 0) {
          return res;
      }
      
      if(matrix[0].length == 0) {
          return res;
      }
      int n = matrix.length;
      int m = matrix[0].length;
      boolean[][] PC = new boolean[n][m];
      boolean[][] AC = new boolean[n][m];
      // check PC and AC from top to down direction.
      for(int i = 0; i < n; i++) {
        if( i == 0) {
          /// PC first row is all true
          Arrays.fill(PC[i], true);
        }
        if(i == n - 1) {
          /// AC last row is all true
          Arrays.fill(AC[i], true);
        }

        PC[i][0] = true;
        AC[i][m - 1] = true;
      }

      for(int i = 0; i < n; i++) {
        /// PC first column
        dfs(i, 0, matrix, PC);
        /// AC last colmn.
        dfs(n - 1 - i, m - 1, matrix, AC);
      }

      for(int i = 0; i < m; i++) {
        /// PC first row
        dfs(0, i, matrix, PC);
        /// AC last row
        dfs(n - 1, m - 1 - i, matrix, AC);
      }          
      
      for(int i = 0; i < n; i++) {
          for(int j = 0; j < m; j++) {
              if(PC[i][j] && AC[i][j]) {
                  res.add(new int[]{i, j});
              }
          }
      }
      return res;
  }

  private void printString(String arg) {
      System.out.println(arg); 
  }  

  private void scannerIn() {
    System.out.println("---------------------"); 
    Scanner scanner = new Scanner(System.in);
    scanner.nextLine();
  }  

  private void printMatrix(boolean[][] matrix) {
      for(boolean[] s: matrix) {
          for(boolean n: s) {
              System.out.print(n + ",");
          }
          System.out.println();            
      }
  }  

  private void printline() {
      System.out.println("---------------------"); 
  }    

  public static void main(String[] args) {
    int[][] matrix = new int[][]{
      {1, 2, 2, 3, 5},
        {3, 2, 3, 4, 4},
        {2, 4, 5, 3, 1},
        {6, 7, 1, 4, 5},
        {5, 1, 1, 2, 4}
    };

    Solution2 obj = new Solution2();
    obj.pacificAtlantic(matrix);
  }

}
