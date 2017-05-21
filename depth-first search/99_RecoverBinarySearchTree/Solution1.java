import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

class TreeNode {
	int val;
	TreeNode left;
	TreeNode right;
	TreeNode(int x) { val = x; }
}

public class Solution1 {

	public int[] recoverArray(int[] root) {

		int first = 0;
		int second = 0;
		boolean twoPair = false;
		for (int i = 0; i < root.length; i++) {
			if (i > 0 && root[i] < root[i-1]) {
				if(twoPair == false) {
					first = i - 1;
					second = i;
					twoPair = true;
				} else {
					second = i;
				}				
			}
		}

		swap(root, first, second);
		
		return root;
	}	

	private void swap(int[] array, int i, int j) {
		int temp = array[i];
		array[i] = array[j];
		array[j] = temp;
	}

    public void recoverTree(TreeNode root) {
        if(root == null) {
        	return;
        }

        dfs(root);
    }

    private void dfs(TreeNode root) {
    	if(root == null) {
    		return;
    	}
    	if(root.left != null) {
    		dfs()
    	}
    }

    private void createTree() {
    	//       5
    	//    2      7
    	//  1   3      10
    	TreeNode node5 = new TreeNode(5);
    	TreeNode node2 = new TreeNode(2);
    	TreeNode node1 = new TreeNode(1);
    	TreeNode node7 = new TreeNode(7);
    	TreeNode node10 = new TreeNode(10);

    	node5.left = node2;
    	node5.right = node7;
    	node2.left = node1;
    	node2.right = node3;
    	node5.right = node7;
    	node7.right = node10; 
    	return node5;
    }

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		int[] res = obj.recoverArray(new int[]{1,2,4,3,5,6});
		for(int n: res) {
			System.out.print(n + ",");
		}
		System.out.println();
		TreeNode root = createTree();



	}

}
