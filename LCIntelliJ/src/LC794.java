public class LC794 {

    public boolean validTicTacToe(String[] board) {
        if(board.length == 0 || board[0].length() == 0 ) {
            return false;
        }
        int m = board.length;
        int n = board[0].length();
        int x = countX(board, m, n) ;
        int o = countO(board, m, n);
        if(x == 0 && o == 1) {
            return false;
        }

        if(Math.abs(x - o) > 1) {
            return false;
        }
        if(x + o == 9) {
            return false;
        }

        int xWin = 0;
        int oWin = 0;
        for(int i = 0; i < m; i++) {
            int j = 0, k = n - 1;
            while(j < k && board[i].charAt(j) == board[i].charAt(k)) {
                j++;
                k--;
            }
            if(j == k && board[i].charAt(j) == board[i].charAt(j - 1)) {
                if(board[i].charAt(j) == 'X') {
                    xWin++;
                    if(xWin == 1 && x + o < 9) {
                        return false;
                    } else if (xWin == 1 && x + o == 9) {
                        return true;
                    }
                } else if (board[i].charAt(j) == 'O') {
                    oWin++;
                    if(oWin == 1 && x + o < 9) {
                        return false;
                    } else if (oWin == 1 && x + o == 9) {
                        return true;
                    }
                }
            }
        }

        for(int i = 0; i < n; i++) {
            int j = 0, k = m - 1;
            while(j < k && board[j].charAt(i) == board[j].charAt(i)) {
                j++;
                k--;
            }
            if(j == k && board[j].charAt(i) == board[j - 1].charAt(i)) {
                if(board[j].charAt(i) == 'X') {
                    xWin++;
                    if(xWin == 1 && x + o < 9) {
                        return false;
                    } else if (xWin == 1 && x + o == 9) {
                        return true;
                    }
                } else if (board[j].charAt(i) == 'O') {
                    oWin++;
                    if(oWin == 1 && x + o < 9) {
                        return false;
                    } else if (oWin == 1 && x + o == 9) {
                        return true;
                    }
                }
            }
        }

        if(board[0].charAt(0) == board[1].charAt(1) && board[1].charAt(1) == board[2].charAt(2)) {
            if(board[0].charAt(0) == 'X') {
                xWin++;
                if(xWin == 1 && x + o < 9) {
                    return false;
                } else if (xWin == 1 && x + o == 9) {
                    return true;
                }
            } else if(board[0].charAt(0) == 'O') {
                oWin++;
                if(oWin == 1 && x + o < 9) {
                    return false;
                } else if (oWin == 1 && x + o == 9) {
                    return true;
                }
            }
        }

        if(board[0].charAt(2) == board[1].charAt(1) && board[2].charAt(0) == board[1].charAt(1)) {
            if(board[0].charAt(2) == 'X') {
                xWin++;
                if(xWin == 1 && x + o < 9) {
                    return false;
                } else if (xWin == 1 && x + o == 9) {
                    return true;
                }
            } else if(board[0].charAt(2) == 'O') {
                oWin++;
                if(oWin == 1 && x + o < 9) {
                    return false;
                } else if (oWin == 1 && x + o == 9) {
                    return true;
                }
            }
        }
        if(xWin >= 1 && oWin >= 1) {
            return false;
        }
        return true;
    }

    private int countX(String[] board, int m, int n) {
        int countX = 0;
        for(int i = 0; i < m; i++) {
            for(int j = 0; j < n; j++) {
                if(board[i].charAt(j) == 'X') {
                    countX++;
                }
            }
        }
        return countX;
    }

    private int countO(String[] board, int m, int n) {
        int countO = 0;
        for(int i = 0; i < m; i++) {
            for(int j = 0; j < n; j++) {
                if(board[i].charAt(j) == 'O') {
                    countO++;
                }
            }
        }
        return countO;
    }

    public static void main(String[] args) {
        LC794 obj = new LC794();
//        String[] board = new String[]{"XXX","OOX","OOX"};
//        PrintUtils.printString("res:" + obj.validTicTacToe(board));

//        String[] board = new String[]{"XXX","XOO","OO "};
//        PrintUtils.printString("res:" + obj.validTicTacToe(board));

        String[] board = new String[]{"XXX","OOX","OOX"};
        PrintUtils.printString("res:" + obj.validTicTacToe(board));
    }
}
