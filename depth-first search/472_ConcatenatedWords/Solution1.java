import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

class TrieNode {
	public boolean isWord;
	public TrieNode[] children;
	public TrieNode(){
		this.children= new TrieNode[26];
		this.isWord = false;
	}
}

class Trie {
	public TrieNode root;
	public Trie() {
		this.root = new TrieNode();
	}

	public void addWord(String word) {
		TrieNode ptr = root;
		for(int i = 0; i < word.length(); i++) {
			int index = word.charAt(i) - 'a';
			if(ptr.children[index] == null) {
				ptr.children[index] = new TrieNode();
			}
			ptr = ptr.children[index];
		}
		ptr.isWord = true;
	}

	public boolean searchWord(String word) {
		TrieNode ptr = root;
		for(int i = 0; i < word.length(); i++) {
			int index = word.charAt(i) - 'a';
			if(ptr.children[index] == null) {
				ptr.children[index] = new TrieNode();
			}
			ptr = ptr.children[index];
		}
		return ptr.isWord;
	}
}

public class Solution1 {

	public Trie trie;

	public Solution1() {
		trie = new Trie();
	}

    public List<String> findAllConcatenatedWordsInADict(String[] words) {
        for(String word: words) {
        	if(word.length() == 0) {
        		continue;
        	}
            this.trie.addWord(word);
        }
        List<String> result = new ArrayList<String>();
        for(String word: words) {
            if(dfs(word) == true) {
                result.add(word);
            }
        }
        return result;
    }	

    private boolean dfs(String word) {
    	TrieNode ptr = this.trie.root;
    	for (int i = 0; i < word.length(); i++) {
    		int index = word.charAt(i) - 'a';
    		ptr = ptr.children[index];
    		if(ptr == null) {
    			return false;
    		}
    		String suffix = word.substring(i + 1);
    		if(ptr.isWord == true && (this.trie.searchWord(suffix) == true || dfs(suffix) == true)) {
    			return true;
    		}
    	}
    	return false;
    }

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		String[] words = new String[]{"", "cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"};
		List<String> res = obj.findAllConcatenatedWordsInADict(words);
		for(String n : res) {
			System.out.println(n);
		}
	}

}
