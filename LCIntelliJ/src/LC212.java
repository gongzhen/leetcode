import java.util.ArrayList;
import java.util.List;

public class LC212 {

    /**
     * board:
     * [[s,e,e,n,e,w],[t,m,r,i,v,a],[o,b,s,i,b,d],[w,m,y,s,e,n],[l,t,s,n,s,a],[i,e,z,l,g,n]]
     *
     * expect output:
     * anda,anes,anesis,avener,avine,bena,bend,benda,besa,besan,bowl,daven,embow,inerm,irene,
     * myst,nane,nanes,neem,reem,reest,renew,rine,riva,rive,riven,sand,sane,sang,seen,seer,send,
     * sise,stob,stow,teil,vine,viner,vire,wadna,wave,wene,wots
     *
     *
     * my output:
     * stow,stob,seer,seen,embow,neem,wadna,wave,wene,reem,reest,renew,rine,rive,riva,inerm,irene,
     * vine,vire,avener,avine,bowl,sise,besa,bend,bena,daven,wots,myst,send,teil,sand,sane,sang,anda,anes,anesis,nane
     *
     *
     * */
    private static class TrieNode {
        public TrieNode[] children;
        public boolean isWord;
        public TrieNode() {
            this.children = new TrieNode[26];
            this.isWord = false;
        }
    }

    private static class Trie {
        public TrieNode root;
        public Trie() {
            root = new TrieNode();
        }

        public void insert(String word) {
            if(this.root == null) {
                return;
            }
            TrieNode ptr = this.root;
            for(char c : word.toCharArray()) {
                if(ptr.children[c - 'a'] == null) {
                    ptr.children[c - 'a'] = new TrieNode();
                }
                ptr = ptr.children[c - 'a'];
            }
            ptr.isWord = true;
        }

        public boolean search(String word) {
            if(this.root == null) {
                return false;
            }
            TrieNode ptr = this.root;
            for(char c : word.toCharArray()) {
                if(ptr.children[c - 'a'] != null) {
                    ptr = ptr.children[c - 'a'];
                }
                return false;
            }
            return ptr != null && ptr.isWord == true;
        }
    }

    private static int[][] dir = new int[][]{{-1, 0}, {1, 0}, {0, -1}, {0, 1}};

    private static class Solution1 {
        public List<String> findWords(char[][] board, String[] words) {
            if(board == null || board.length == 0 || board[0].length == 0) {
                return new ArrayList<String>();
            }

            Trie trie = new Trie();
            for(String word : words) {
                trie.insert(word);
            }
            int m = board.length;
            int n = board[0].length;
            List<String> res = new ArrayList<String>();
            boolean[][] visited = new boolean[m][n];
            for(int i = 0; i < m; i++) {
                for(int j = 0; j < n; j++) {
                    if(trie.root.children[board[i][j] - 'a'] != null) {
                        dfs(trie.root.children[board[i][j] - 'a'], board, i, j, m, n, visited, res, "" + board[i][j]);
                    }
                }
            }
            return res;
        }

        public void dfs(TrieNode node, char[][] board, int i, int j, int m, int n, boolean[][] visited, List<String> res, String str) {
            if(node == null) {
                return;
            }

            if(node.isWord == true) {
                res.add(str);
                node.isWord = false;
            }

            visited[i][j] = true;
            for(int[] list : dir) {
                int x = i + list[0];
                int y = j + list[1];
                if(x >= 0 && y >= 0 && x < m && y < n && visited[x][y] == false) {
                    dfs(node.children[board[x][y] - 'a'], board, x, y, m, n, visited, res, str + board[x][y]);
                }
            }
            visited[i][j] = false;
        }
    }

    private static class TrieNode1 {
        public TrieNode1[] children;
        public String str;
        public TrieNode1() {
            children = new TrieNode1[26];
            str = "";
        }
    }

    private static class Trie1 {
        public TrieNode1 root;

        public Trie1() {
            root = new TrieNode1();
        }

        public void insertWord(String word) {
            TrieNode1 p = root;
            for (int i =0; i < word.length(); i++) {
                int j = word.charAt(i) - 'a';
                if (p.children[j] == null) {
                    p.children[j] = new TrieNode1();
                }
                p = p.children[j]; // str and children are both null
            }
            p.str = word;
        }
    }

    private static class Solution2 {

        public List<String> findWords(char[][] board, String[] words) {
            List<String> res = new ArrayList<String>();
            if (words.length == 0 || board.length == 0 || board[0].length == 0) {
                return res;
            }

            Trie1 trie = new Trie1();
            boolean[][] visited = new boolean[board.length][board[0].length];

            for (String word : words) {
                trie.insertWord(word);
            }

            for (int i = 0; i < board.length; i++) {
                for (int j = 0; j < board[i].length; j++) {
                    if (trie.root.children[board[i][j] - 'a'] != null) {
                        search(board, trie.root.children[board[i][j] - 'a'], i, j, visited, res);
                    }
                }
            }

            return res;
        }

        public void search(char[][] board, TrieNode1 node, int i, int j, boolean[][] visited, List<String> res) {
            if (node!= null && node.str.length() != 0) {
                res.add(node.str);
                node.str = "";
            }

            visited[i][j] = true;
            int[][] diff = new int[][]{{-1, 0}, {1, 0}, {0, -1}, {0, 1}};

            for (int[] a : diff) {
                int nx = a[0] + i;
                int ny = a[1] + j;
                if (nx >= 0 && nx < board.length && ny >=0 && ny < board[0].length && visited[nx][ny] != true && node.children[board[nx][ny] - 'a'] != null) {
                    search(board, node.children[board[nx][ny] - 'a'], nx, ny, visited, res);
                }
            }
            visited[i][j]= false;
        }

    }

    public static void main(String[] args) {
        // [[s,e,e,n,e,w],
        //  [t,m,r,i,v,a],
        //  [o,b,s,i,b,d],
        //  [w,m,y,s,e,n],
        //  [l,t,s,n,s,a],
        //  [i,e,z,l,g,n]]
        char[][] board = new char[][]{{'s','e','e','n','e','w'},{'t','m','r','i','v','a'},{'o','b','s','i','b','d'},{'w','m','y','s','e','n'},{'l','t','s','n','s','a'},{'i','e','z','l','g','n'}};
        /// String[] words = new String[]{"viner", "riven", "nanes", "besan"};
        String[] words = new String[]{"vine", "viner"};
        Solution1 obj1 = new Solution1();
        List<String> res = obj1.findWords(board, words);
        PrintUtils.printListString(res);

        Solution2 obj2 = new Solution2();
        List<String> res2 = obj2.findWords(board, words);
        PrintUtils.printListString(res2);
    }
}
