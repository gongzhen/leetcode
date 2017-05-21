import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution1 {

  public List<List<String>> findLadders(String beginWord, String endWord, List<String> wordList) {
  	// task 1 find beginWord's matched word in wordList
  	List<List<String>> res = new ArrayList<List<String>>();
  	List<String> list = new ArrayList<String>();
  	for(int i  = 0; i < beginWord.toCharArray().length; i++) {
  		for(int j = 0; j < 26; j++) {
  			char replacedChar = (char)('a' + j);
  			// replaced char with each index.
  			String replacedWord = beginWord.substring(0, i) + replacedChar + beginWord.substring(i + 1);
  			// System.out.println(replacedWord);
  			// task 2: find if the wordList contains beginWord's matched word  
  			if(searchWordFromList(wordList, replacedWord) == true) {
  				list.add(replacedWord);
  			}
  		}
  	}
  	printList(list);
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

	private void printList(List<String> list) {
		for(String s: list) {
			System.out.println(s);
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
    Solution1 obj = new Solution1();
    obj.findLadders(beginWord, endWord, wordList);

  }

}
