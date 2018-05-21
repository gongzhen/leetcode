import java.io.PrintStream;

public class LC348 {

    private static class TicTacToe {

        char[][] board;
        /** Initialize your data structure here. */
        public TicTacToe(int n) {
            board = new char[n][n];
            for(int i = 0; i < n; i++) {
                for(int j = 0; j < n; j++) {
                    board[i][j] = ' ';
                }
            }
        }

        /** Player {player} makes a move at ({row}, {col}).
         @param row The row of the board.
         @param col The column of the board.
         @param player The player, can be either 1 or 2.
         @return The current winning condition, can be either:
         0: No one wins.
         1: Player 1 wins.
         2: Player 2 wins. */
        public int move(int row, int col, int player) {
            if(player == 1) {
                board[row][col] = 'X';
            } else if (player == 2) {
                board[row][col] = 'O';
            }
            int m = board.length;
            char c = checkRow(m);
            int res = player(c);
            if(res != 0 ) {
                return res;
            }

            c = checkCol(m);
            res = player(c);

            if(res != 0) {
                return res;
            }


            c = checkDiagonal(m);
            res = player(c);
            if(res != 0) {
                return res;
            }
            return 0;
        }

        public int player(char c) {
            if(c == 'X') {
                return 1;
            } else if(c == 'O') {
                return 2;
            }
            return 0;
        }

        public char checkRow(int m) {
            for(int i = 0; i < m; i++) {
                if(board[i][0] == 'X' || board[i][0] == 'O') {
                    int j = m - 1;
                    char c = board[i][0];
                    while(j >= 0 && c == board[i][j]) {
                        j--;
                    }
                    if(j < 0) {
                        return c;
                    }
                    continue;
                }
            }
            return ' ';
        }

        public char checkCol(int m) {
            for(int i = 0; i < m; i++) {
                if(board[0][i] == 'X' || board[0][i] == 'O') {
                    int j = m - 1;
                    char c = board[0][i];
                    while(j >= 0 && c == board[j][i]) {
                        j--;
                    }
                    if(j < 0 ) {
                        return c;
                    }
                    continue;
                }
            }
            return ' ';
        }

        public char checkDiagonal(int m) {
            char c = board[0][0];
            int i = 0;
            while( i < m && c == board[i][i]) {
                i++;
            }
            if(i == m ) {
                return c;
            }


            i = 0;
            c = board[0][m - 1];

            while( i < m && c == board[i][m - i - 1]) {
                i++;
            }
            if(i == m ) {
                return c;
            }

            return ' ';
        }
    }

    private static class TicTacToe2 {
        private int[] rows;
        private int[] cols;
        private int diagonal;
        private int antiDiagonal;

        /** Initialize your data structure here. */
        public TicTacToe2(int n) {
            rows = new int[n];
            cols = new int[n];
        }

        public int move(int row, int col, int player) {
            int toAdd = player == 1 ? 1 : -1;

            rows[row] += toAdd;
            cols[col] += toAdd;
            if (row == col) {
                diagonal += toAdd;
            }

            if (col == (cols.length - row - 1)) {
                antiDiagonal += toAdd;
            }

            int size = rows.length;
            if (Math.abs(rows[row]) == size
                    || Math.abs(cols[col]) == size
                    || Math.abs(diagonal) == size
                    || Math.abs(antiDiagonal) == size) {
                return player;
            }

            return 0;
        }
    }

    /**
     * Your TicTacToe object will be instantiated and called as such:
     * TicTacToe obj = new TicTacToe(n);
     * int param_1 = obj.move(row,col,player);
     */

    private static class TicTacToe3 {
        int[] rows;
        int[] cols;
        int diagonal;
        int antiDiagonal;
        /** Initialize your data structure here. */
        public TicTacToe3(int n) {
            rows = new int[n];
            cols = new int[n];
            diagonal = 0;
            antiDiagonal = 0;
        }

        /** Player {player} makes a move at ({row}, {col}).
         @param row The row of the board.
         @param col The column of the board.
         @param player The player, can be either 1 or 2.
         @return The current winning condition, can be either:
         0: No one wins.
         1: Player 1 wins.
         2: Player 2 wins. */
        public int move(int row, int col, int player) {
            int sum = player == 1 ? 1 : -1;
            rows[row] += sum;
            cols[col] += sum;

            if(row == col) {
                diagonal += sum;
            }
            if(row == (rows.length - col - 1)) {
                antiDiagonal += sum;
            }
            if(Math.abs(rows[row]) == rows.length || Math.abs(cols[col]) == rows.length || Math.abs(diagonal) == rows.length || Math.abs(antiDiagonal) == rows.length) {
                return player;
            }
            return 0;
        }
    }

    public static void main(String[] args) {
//        TicTacToe obj = new TicTacToe(3);
//        obj.move(0, 1, 2);
//        obj.move(2, 1, 2);
//        PrintUtils.printString("res:" + obj.move(1, 1, 2));

        TicTacToe obj = new TicTacToe(5);
        // [3,0,2],
        // [2,3,1],
        // [4,1,2],
        // [0,2,1],
        // [0,4,2],
        // [2,1,1],
        // [0,0,2],
        // [2,0,1],
        // [1,0,2],
        // [2,2,1],
        // [0,1,2],
        // [1,2,1],
        // [3,2,2],
        // [4,0,1],
        // [2,4,2],
        // [0,3,1],
        // [4,4,2],[1,4,1],[3,3,2],[4,2,1],[4,3,2],[1,3,1],[3,4,2],[3,1,1],[1,1,2]
        obj.move(3, 0, 2);
        obj.move(2, 3, 1);
        obj.move(4, 1, 2);
        obj.move(0, 2, 1);
        obj.move(0, 4, 2);
        obj.move(2, 1, 1);
        obj.move(0, 0, 2);
        obj.move(2, 0, 1);
        obj.move(1, 0, 2);
        obj.move(2, 2, 1);
        obj.move(0, 1, 2);
        obj.move(1, 2, 1);
        obj.move(3, 2, 2);
        obj.move(4, 0, 1);
        obj.move(2, 4, 2);
        obj.move(0, 3, 1);
        PrintUtils.printString("res:" + obj.move(4, 4, 2));
        PrintUtils.printMatrixChar(obj.board);

        TicTacToe2 obj2 = new TicTacToe2(3);
        /// [0,0,1],[0,2,2],[2,2,1],[1,1,2],[2,0,1],[1,0,2],[2,1,1]
        obj2.move(0,0, 1);
        obj2.move(0,2, 2);
        obj2.move(2,2, 1);
        obj2.move(1,1, 2);
        obj2.move(2,0, 1);
        obj2.move(1,0, 2);
        obj2.move(2,1, 1);

        TicTacToe3 obj3 = new TicTacToe3(3);
        /// [0,0,1],[0,2,2],[2,2,1],[1,1,2],[2,0,1],[1,0,2],[2,1,1]
        obj3.move(0,0, 1);
        obj3.move(0,2, 2);
        obj3.move(2,2, 1);
        obj3.move(1,1, 2);
        obj3.move(2,0, 1);
        obj3.move(1,0, 2);
        obj3.move(2,1, 1);
    }
}
