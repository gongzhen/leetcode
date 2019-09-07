package com.leetcode.Tree;

import com.leetcode.Helper.*;

import java.util.ArrayList;
import java.util.List;


public class LC113 {

    public List<List<Integer>> pathSum(TreeNode root, int sum) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        List<Integer> list = new ArrayList<Integer>();
//        dfs(res, list, root, sum);
        dfs(root, sum, res, list);
        return res;
    }

//    private void dfs(List<List<Integer>> res, List<Integer> list, TreeNode node, int sum) {
//        if(node == null) {
//            return;
//        }
//
//        list.add(node.val);
//        if(node.left == null && node.right == null && sum == node.val) {
//            res.add(new ArrayList<Integer>(list));
//            list.remove(list.size() - 1);
//            return;
//        }
//
//        dfs(res, list, node.left, sum - node.val);
//        dfs(res, list, node.right, sum - node.val);
//        list.remove(list.size() - 1);
//    }

    private void dfs(TreeNode node, int sum, List<List<Integer>> res, List<Integer> list) {
        if (node == null) {
            return;
        }
        if(node.left == null && node.right == null) {
            if (node.val == sum) {
                list.add(node.val);
                res.add(new ArrayList<Integer>(list));
                list.remove(list.size() - 1);
            }
            return;
        }

        list.add(node.val);
        dfs(node.left, sum - node.val, res, list);
        dfs(node.right, sum - node.val, res, list);
        list.remove(list.size() - 1);
    }

    public static void main(String[] args) {
        LC113 obj = new LC113();
        TreeNode root = TreeUtils.LC113createTree();
        List<List<Integer>> res = obj.pathSum(root, 22);
        PrintUtils.printListOfListInteger(res);
    }
}
