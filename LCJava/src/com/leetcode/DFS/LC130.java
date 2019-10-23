package com.leetcode.DFS;

import com.leetcode.Helper.PrintUtils;

public class LC130 {

    public void solve(char[][] board) {
        int row = board.length;
        if (row == 0) {
            return;
        }
        int col = board[0].length;
        boolean[][] visited = new boolean[row][col];
        // first col
        for(int i = 0; i < row; i++) {
            if (board[i][0] == 'O') {
                // turn all 0 to *
                dfs(board, row, col, i, 0, visited);
            }
            if (board[i][col-1] == 'O') {
                dfs(board, row, col, i, col - 1, visited);
            }
        }

        // first row
        for(int i = 0; i < col; i++) {
            if (board[0][i] == 'O') {
                // turn all 0 to *
                dfs(board, row, col, 0, i, visited);
            }
            if (board[row - 1][i] == 'O') {
                dfs(board, row, col, row - 1, i, visited);
            }
        }

        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                if (board[i][j] == 'O') {
                    board[i][j] = 'X';
                }
                if (board[i][j] == '*') {
                    board[i][j] = 'O';
                }
            }
        }
    }

    private int[][] direction = new int[][] {{1, 0}, {-1, 0}, {0, 1}, {0, -1}}; // four direction

    private void dfs(char[][] board, int row, int col, int x, int y, boolean[][]visited) {
        if (x < 0 || x >= row || y < 0 || y >= col || visited[x][y] == true || board[x][y] == 'X') {
            return;
        }
        if (board[x][y] == 'O') {
            board[x][y] = '*';
        }
        visited[x][y] = true;
        for (int[]dir : direction) {
            int xx = x + dir[0];
            int yy = y + dir[1];
            dfs(board, row, col, xx, yy, visited);
        }
    }

    public static void main(String[] args) {
        char[][] board = new char[][] {
                {'X','X','X','X'},
                {'X','O','O','X'},
                {'X','X','O','X'},
                {'X','O','X','X'}
        };
        LC130 obj = new LC130();
        obj.solve(board);
        PrintUtils.printMatrixChar(board);
    }
}
