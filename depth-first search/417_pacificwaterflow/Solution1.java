import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution1 {

  int dx[] = {0,0,-1,1};
  int dy[] = {1,-1,0,0};     

  private void dfs(int[][] matrix, boolean[][] visited, int x, int y) {
    visited[x][y] = true;
    for(int i = 0; i < 4; i++) {
      int x1 = x + dx[i];
      int y1 = y + dy[i];
      if(x1 >= 0 && y1 >= 0 && x1 < matrix.length && y1 < matrix[0].length ) {
        if(visited[x1][y1] == false && matrix[x][y] <= matrix[x1][y1]) {
          System.out.println(visited[x1][y1]);
          dfs(matrix, visited, x1, y1);
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
    int m = matrix.length;
    int n = matrix[0].length;
    boolean[][] PC = new boolean[m][n];
    boolean[][] AC = new boolean[m][n];
    // check PC and AC from top to down direction.
    for(int i = 0; i < n; i++) {
      dfs(matrix, PC, i, 0);
      // dfs(matrix, AC, i, m - 1);
    }
    /*
    // check PC and AC from left to right direction.
    for(int i = 0; i < m; i++) {
      dfs(matrix, PC,0, i);
      dfs(matrix, AC, n - 1, i);
    }

    for(int i = 0; i < m; i++) {
      for(int j = 0; j < n; j++) {
        if(PC[i][j] && AC[i][j]) {
          res.add(new int[]{i, j});
        }
      }
    }
    */
    return res;
  }	

  public static void main(String[] args) {
    int[][] matrix = new int[][]{
      {1, 2, 2, 3, 5},
        {3, 2, 3, 4, 4},
        {2, 4, 5, 3, 1},
        {6, 7, 1, 4, 5},
        {5, 1, 1, 2, 4}
    };

    for(int[] arr: matrix) {
      for(int n : arr) {
        System.out.print(n + ", ");
      }
      System.out.println();
    }

    Solution1 obj = new Solution1();
    obj.pacificAtlantic(matrix);
  }

}
