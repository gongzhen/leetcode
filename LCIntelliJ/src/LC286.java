public class LC286 {

    public void wallsAndGates(int[][] rooms) {

        int m = rooms.length;
        int n = rooms[0].length;

        for(int i = 0; i < m; i++) {
            for(int j = 0; j < n; j++) {
                if(rooms[i][j] == 0) {
                    // dfs(rooms, m, n, i, j);
                    dfs_2(rooms, m, n, i, j, 0);
                }
            }
        }
    }

    private void dfs_2(int[][] rooms, int m, int n, int x, int y, int d) {
        if(x < 0 || y < 0 || x >= m || y >= n || rooms[x][y] < d) {
            return;
        }

        rooms[x][y] = d;
        for(int[] list: ArrayUtils.dir) {
            int _x = x + list[0];
            int _y = y + list[1];
            dfs_2(rooms, m, n, _x, _y, d + 1);
        }
    }

    private void dfs(int[][] rooms, int m, int n, int x, int y) {
        if(x < 0 || y < 0 || x >= m || y >= n) {
            return;
        }

        if(x > 0 && rooms[x-1][y] > (rooms[x][y] + 1)) {
            rooms[x - 1][y] = rooms[x][y] + 1;
            dfs(rooms, m, n, x - 1, y);
        }
        if(y > 0 && rooms[x][y-1] > (rooms[x][y] + 1)) {
            rooms[x][y-1] = rooms[x][y] + 1;
            dfs(rooms, m, n, x, y-1);
        }
        if(x + 1 < m && rooms[x+1][y] > (rooms[x][y] + 1)) {
            rooms[x + 1][y] = rooms[x][y] + 1;
            dfs(rooms, m, n, x + 1, y);
        }
        if(y + 1 < n && rooms[x][y+1] > (rooms[x][y] + 1)) {
            rooms[x][y+1] = rooms[x][y] + 1;
            dfs(rooms, m, n, x, y+1);
        }
    }

    public static void main(String[] args) {
        int INF = Integer.MAX_VALUE;
        int[][] rooms = new int[][] {{INF, -1, 0, INF}, {INF, INF, INF, -1}, {INF, -1, INF, -1}, {0, -1, INF, INF}};
        LC286 obj = new LC286();
        obj.wallsAndGates(rooms);
        PrintUtils.printMatrixInt(rooms);
        /**
         * [0][0]3, [0][1]-1, [0][2]0, [0][3]1,
         * [1][0]2, [1][1]2, [1][2]1, [1][3]-1,
         * [2][0]1, [2][1]-1, [2][2]2, [2][3]-1,
         * [3][0]0, [3][1]-1, [3][2]3, [3][3]4,
         * */
    }
}
