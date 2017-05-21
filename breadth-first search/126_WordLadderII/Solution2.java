import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution2 {

    public List<List<String>> findLadders(String beginWord, String endWord, List<String> wordList) {
      	// task 1 find beginWord's matched word in wordList
      	List<List<String>> res = new ArrayList<List<String>>();        
        Queue<String> queue = new LinkedList<String>();        
        Set<String> set = new HashSet<String>();
        List<String> list = new ArrayList<String>();
        queue.offer(beginWord);
        set.add(beginWord);
        while(queue.isEmpty() != true) {
            if(list.size() == wordList.size()) {
                res.add(list);
            }
            String popedWord = queue.poll();
            for(int i  = 0; i < popedWord.toCharArray().length; i++) {
                for(int j = 0; j < 26; j++) {
                    char replacedChar = (char)('a' + j);
                    // replaced char with each index.
                    String replacedWord = popedWord.substring(0, i) + replacedChar + popedWord.substring(i + 1);
                    if(set.contains(replacedWord)) {
                        continue;
                    }
                    // System.out.println(replacedWord);
                    // task 2: find if the wordList contains beginWord's matched word  
                    if(searchWordFromList(wordList, replacedWord) == true) {                      
                        queue.offer(replacedWord);
                        set.add(replacedWord);
                        list.add(replacedWord);
                    }
                }      
            }
            // System.out.println(popedWord);
            // printQueue(queue);
        }
        printListOfList(res);
      	return res;
      }

    private boolean searchWordFromList(List<String> wordList, String targetWord) {
      	for(String word: wordList) {
      		if(word.equals(targetWord)) {
      			return true;
      		}
      	}
      	return false;
      }

    private void printQueue(Queue<String> list) {
    	for(String s: list) {
    		System.out.println(s);
    	}
    }  

    private void printListOfList(List<List<String>> listOfList) {
        for(List<String> list: listOfList ) {
            for(String word : list) {
                System.out.print(word + ", ");
            }
            System.out.println();
        }
    }

  public static void main(String[] args) {
  	String beginWord = "hit";
	String endWord = "cog";
	String[] wordArray = new String[]{"hot","dot","dog","lot","log","cog"};
	List<String> wordList = new ArrayList<String>();
	for(String word: wordArray) {
		wordList.add(word);
	}
    Solution2 obj = new Solution2();
    obj.findLadders(beginWord, endWord, wordList);

  }

}
