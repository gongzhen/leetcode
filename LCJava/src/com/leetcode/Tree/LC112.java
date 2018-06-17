package com.leetcode.Tree;

import com.leetcode.Helper.*;


public class LC112 {

    public boolean hasPathSum(TreeNode root, int sum) {

//        return dfs(root, sum);
        if(root == null) {
            return false;
        } else if (root.left == null && root.right == null && sum == root.val) {
            return true;
        }
        return hasPathSum(root.left, sum - root.val) || hasPathSum(root.right, sum - root.val);
    }

//    public boolean dfs(TreeNode node, int sum) {
//        if(node == null) {
//            // if(sum == 0) {
//            //     return true;
//            // } else {
//            //     return false;
//            // }
//            return false;
//        }
//
//        if(sum == node.val) {
//            if(node.left == null && node.right == null) {
//                return true;
//            } else {
//                return false;
//            }
//        }
//        return dfs(node.left, sum - node.val) || dfs(node.right, sum - node.val);
//    }


    public static void main(String[] args) {
        LC112 obj = new LC112();
        // res:[1, 2, 3, 5, 7, 10]
        PrintUtils.printString("res:" + obj.hasPathSum(TreeUtils.LC112createTree(), -5));
    }
}
