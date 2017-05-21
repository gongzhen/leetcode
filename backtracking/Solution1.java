import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

// class TreeNode {
// 	int val;
// 	TreeNode left;
// 	TreeNode right;
// 	TreeNode(int x) { val = x; }
// }
// private void createTree() {
// 	//       5
// 	//    2      7
// 	//  1   3      10
// 	TreeNode node5 = new TreeNode(5);
// 	TreeNode node2 = new TreeNode(2);
// 	TreeNode node1 = new TreeNode(1);
// 	TreeNode node7 = new TreeNode(7);
// 	TreeNode node10 = new TreeNode(10);

// 	node5.left = node2;
// 	node5.right = node7;
// 	node2.left = node1;
// 	node2.right = node3;
// 	node5.right = node7;
// 	node7.right = node10; 
// 	return node5;
// }


public class Solution1 {

    public List<String> restoreIpAddresses(String s) {
    	List<String> res = new ArrayList<String>();
    	String ip = "";
    	backtrack(s, res, 0, ip, 0);
    	return res;
    }	

    private void backtrack(String s, List<String> res, int start, String ip, int count) {
    	if(count > 4) {
    		// count will stop iteration.
    		return;
    	}

    	if(count == 4 && start == s.length()) {
    		res.add(ip);
    	}
		// System.out.println("start:" + start);
   		System.out.println("ip:" + ip);
    	for (int i = 1; i < 4; i++) {
    		if(start + i > s.length()) {    			
    			break;
    		}
    		String substr = s.substring(start, start + i);
    		// if(i == 3 && Integer.parseInt(substr) >= 256) {}
    		backtrack(s, res, start + i, ip + substr, count+1);
    	}
    }

	private void printList(List<String> list) {
		for(String s: list) {
			System.out.println(s);
		}
	}

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		List<String> res = obj.restoreIpAddresses("25525511135");
		// obj.printList(res);
	}

}
