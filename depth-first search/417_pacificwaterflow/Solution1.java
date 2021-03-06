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

public class Solution1 {

  int[][] direction = new int[][]{{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
  
  private void dfs(int[][] matrix, boolean[][] visited, int x, int y) {

      visited[x][y] = true;

      for(int[] dir: direction) {
          int nx = x + dir[0];
          int ny = y + dir[1];

          if(nx >= 0 && ny >= 0 && nx < matrix.length && ny < matrix[nx].length ) {
              if(visited[nx][ny] == false && matrix[x][y] <= matrix[nx][ny]) {
                  dfs(matrix, visited, nx, ny);
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
          /// PC first(left most) column.
          dfs(matrix, PC, i, 0);
          /// AC last(right most) clolumn.
          // printString("[" + i + "][" + 0 + "]");      
          // scannerIn();
          dfs(matrix, AC, i, m - 1);
      }



      // check PC and AC from left to right direction.
      for(int i = 0; i < m; i++) {
          /// PC first(top most) row.
          dfs(matrix, PC,0, i);
          /// AC first(bottom most) row.
          dfs(matrix, AC, n - 1, i);
      }        

      printMatrix(PC);
      printline();
      printMatrix(AC);      
      
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

    Solution1 obj = new Solution1();
    obj.pacificAtlantic(matrix);
  }

}
