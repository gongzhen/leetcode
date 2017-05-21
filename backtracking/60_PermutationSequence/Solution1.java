import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution1 {

	// Time Limit Exceeded 
    public String getPermutation(int n, int k) {
    	boolean[] visited = new boolean[n + 1];
    	StringBuilder sb = new StringBuilder();
    	List<Integer> list = new ArrayList<Integer>();
    	List<List<Integer>> listOflist = new ArrayList<List<Integer>>();
    	int pos = 1;
    	backtrack(n, k, visited, pos, list, listOflist);
    	
    	int count = 0;
    	for(List<Integer> wordList: listOflist) {
    		count++;
    		if(count == k) {
    			for(int m : wordList) {
    				sb.append(m);
    			}
    		}
    	}

    	return sb.toString();
    }

    private void backtrack(int n, int k, boolean[] visited, int pos, List<Integer> list, List<List<Integer>> listOflist) {
    	if(pos > n) {
    		listOflist.add(new ArrayList<>(list));
    		return;
    	}

    	for(int i = 1; i <= n; i++) {
    		if(visited[i] == false) {
    			list.add(i);
    			visited[i] = true;
    			backtrack(n, k, visited, pos + 1, list, listOflist);
    			list.remove(list.size() - 1);
    			visited[i] = false;
    		}
    	}
    }

	private void printListOfList(List<List<Integer>> listOflist) {
		for(List<Integer> list: listOflist){
			for(int n : list) {
				System.out.print(n + ", ");
			}
			System.out.println();
		}
	}  

	public static void main(String[] args) {
		Solution1 obj = new Solution1();		
		System.out.println(obj.getPermutation(3, 6));
	}

}
