import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution1 {

    public int countArrangement(int N) {
        boolean[] visited = new boolean[N];
        int[] result = new int[]{0};
        int pos = 0;
        // List<Integer> list = new ArrayList<Integer>();
        // List<List<Integer>> res = new ArrayList<List<Integer>>();
        // dfs(N, pos, visited, list, res);
        dfs(N, pos, visited, result);
        return result[0];
    }

    private void dfs(int N, int pos, boolean[] visited, int[] result) {
        if(pos >= N) {
            result[0]++;
            return;
        }
        
        for(int i = 0; i < N; i++) {   
            if(visited[i] == false && ((i + 1) % (pos  + 1)== 0 || (pos + 1) % (i + 1) == 0)) {                
                visited[i] = true;
                dfs(N, pos + 1, visited, result);
                visited[i] = false;
            }
        }
    }  

	// private void printListOfList(List<List<Integer>> listOflist) {
	// 	for(List<Integer> list: listOflist){
	// 		for(int n : list) {
	// 			System.out.print(n + ", ");
	// 		}
	// 		System.out.println();
	// 	}
	// }

	// private void printList(List<Integer> list) {
	// 	for(int s: list) {
	// 		System.out.println(s);
	// 	}
	// }	

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		System.out.println(obj.countArrangement(1));
	}

}
