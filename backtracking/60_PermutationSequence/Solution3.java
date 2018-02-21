import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution3 {

   public String getPermutation(int n, int k) {
        List<String> res = new ArrayList<String>();
        StringBuilder sb = new StringBuilder();
        boolean[] visited = new boolean[n + 1];
        dfs(res, n, 1, sb, visited);
        if(res.size() <= k) {
            return "";
        }
        return res.get(k - 1);
    }
    
    private void dfs(List<String> res, int n, int idx, StringBuilder sb, boolean[] visited) {

        if(sb.length() == n) {
            res.add(sb.toString());
            return;
        }
        
        for(int i = 1; i <= n; i++) {
            if(visited[i] == false) {
                sb.append(i);
                visited[i] = true;
                dfs(res, n, idx + 1, sb, visited);
                sb.setLength(sb.length() - 1);                
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
		Solution3 obj = new Solution3();		
		// System.out.println(obj.getPermutation(3, 1));
  //       System.out.println(obj.getPermutation(3, 2));
  //       System.out.println(obj.getPermutation(3, 3));
  //       System.out.println(obj.getPermutation(3, 6));
  //       System.out.println(obj.getPermutation(9, 171669));
        System.out.println(obj.getPermutation(10, 171669));
	}

}
