import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution2 {

    public String getPermutation(int n, int k) {
    	boolean[] visited = new boolean[n + 1];
    	StringBuilder sb = new StringBuilder();
    	List<Integer> list = new ArrayList<Integer>();
    	List<List<Integer>> listOflist = new ArrayList<List<Integer>>();
    	int pos = 1;
    	backtrack(n, k, visited, pos, list, listOflist);
        
        if (k > listOflist.size()) {
            return "";
        }
        list = listOflist.get(k - 1);
        for(int m : list) {
            sb.append(m);
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
		Solution2 obj = new Solution2();		
		System.out.println(obj.getPermutation(9, 171669));
        System.out.println(obj.getPermutation(10, 171669));
	}

}
