class WordDictionary {
    public TrieNode root;
    /** Initialize your data structure here. */
    public WordDictionary() {
        root = new TrieNode();
    }

    /** Adds a word into the data structure. */
    public void addWord(String word) {
        if(root == null) return;
        TrieNode ptr = root;
        for(char c : word.toCharArray()) {
            if(ptr.children[c - 'a'] == null) {
                ptr.children[c - 'a'] = new TrieNode();
            }
            ptr = ptr.children[c - 'a'];
        }
        ptr.isWord = true;
    }

    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    public boolean search(String word) {
        /// insert -> bad
        /// search -> b..
        if(root == null) return false;

        TrieNode ptr = root;
        return dfs(ptr, word, 0);
    }

    private boolean dfs(TrieNode node, String word, int pos) {
        if(node == null) return false;

        if(pos == word.length()) return node.isWord == true;

        char c = word.charAt(pos);

        if(c == '.') {
            for(char i = 'a'; i <= 'z'; i++) {
                if(node.children[i - 'a'] != null) {
                    node = node.children[i - 'a'];
                    if(dfs(node, word, pos + 1) == true) {
                        return true;
                    }
                }
            }
        } else {
            if(node.children[c - 'a'] != null) {
                node = node.children[c - 'a'];
                if(dfs(node, word, pos + 1) == true) {
                    return true;
                }
            }
        }
        return false;
    }
}

public class LC211 {

    public static void main(String[] args) {
        WordDictionary obj = new WordDictionary();
        obj.addWord("bad");
        obj.addWord("dad");
        obj.addWord("mad");

        PrintUtils.printString("res:" + obj.search("pad"));
        PrintUtils.printString("res:" + obj.search("bad"));
        PrintUtils.printString("res:" + obj.search(".ad"));
        PrintUtils.printString("res:" + obj.search("b.."));
    }

}
