import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution1 {

    public List<List<Integer>> findSubsequences(int[] nums) {
        Set<List<Integer>> resSet = new HashSet<List<Integer>>();
        List<Integer> list = new ArrayList<Integer>();
        dfs(resSet, list, 0, nums);
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        for(List<Integer> listInSet : resSet) {
            res.add(listInSet);
        }
        return res;
    }
    
    private void dfs(Set<List<Integer>> resSet, List<Integer> list, int index, int[] nums) {
		if(list.size()  > 1) {
   //          System.out.println("index:" + index);
			// printList(list);
			resSet.add(new ArrayList<Integer>(list));
		}               
        for(int i = index; i < nums.length; i++) {
        	if(list.size() == 0 ||  list.get(list.size() - 1) <= nums[i] ) {
                list.add(nums[i]);
                dfs(resSet, list, i + 1, nums);
                list.remove(list.size() - 1);           
        	}
        }
    }

    private void printList(List<Integer> list) {
    	for(int n : list) {
    		System.out.print(n + ",");
    	}
    	System.out.println();
    }

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		// int[] nums = new int[]{1,2,3,4,5,6,7,8,9,10,1,1,1,1,1};
		List<List<Integer>> res = obj.findSubsequences(nums);
		for(List<Integer> list: res) {
			for(int n: list) {
				System.out.print(n + ",");
			}
			System.out.println();
		}
	}

}
