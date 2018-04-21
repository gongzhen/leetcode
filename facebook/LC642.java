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

public class LC642 {

	public Trie trie;
	public HashMap<String, Integer> map;
	public String currentWord;

	private static class Node {
		public String sentence;
		public int times;
		public Node(String st, int t) {
			sentence = st;
			times = t;
		}
	}

	public LC642(String[] sentences, int[] times) {
		initLC642_1(sentences, times);
	}

	private void initLC642_1(String[] sentences, int[] times) {
		map = new HashMap<String, Integer>();
		currentWord = "";
		for(int i = 0; i < sentences.length && i < times.length; i++) {
			map.put(sentences[i], times[i]);
		}		
	}

	public List<String> input(char c) {
		printString("c:" + c);
		List<String> res = new ArrayList<String>();
		if(c == '#') {
			map.put(currentWord, map.getOrDefault(currentWord, 0) + 1);
			currentWord = "";
		} else {
			List<Node> list = new ArrayList<Node>();
			currentWord += c;
			for(String key : map.keySet()) {
				if(key.indexOf(currentWord) == 0) {
					list.add(new Node(key, map.get(key)));
				}
			}
			Collections.sort(list, new Comparator<Node>(){
				public int compare(Node a, Node b) {
					if(a.times == b.times) {
						return a.sentence.compareTo(b.sentence);
					}
					return Integer.compare(a.times, b.times);
				}
			});		

			for(int i = 0; i < Math.min(3, list.size()); i++) {
				res.add(map.get(list.get(i).key));
			}
		}
		return res;
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

	private void printList(List<String> list) {
		for(String s: list) {
			System.out.println(s);
		}
	}   

	private void printString(String arg) {
	    System.out.println(arg); 
	}	 

	public static void main(String[] args) {
		int[] timesArray = new int[]{5, 3, 2, 2};
		String[] sentences	 = new String[]{"i love you", "island", "ironman", "i love leetcode"};
		LC642 obj = new LC642(sentences, timesArray);
		List<String> res = obj.input('i');
		obj.printList(res);
	}

}
