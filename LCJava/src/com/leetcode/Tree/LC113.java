package com.leetcode.Tree;

import com.leetcode.Helper.*;

import java.util.ArrayList;
import java.util.List;


public class LC113 {

    public List<List<Integer>> pathSum(TreeNode root, int sum) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        List<Integer> list = new ArrayList<Integer>();
        dfs(res, list, root, sum);
        return res;
    }

    private void dfs(List<List<Integer>> res, List<Integer> list, TreeNode node, int sum) {
        if(node == null) {
            return;
        }

        list.add(node.val);
        if(node.left == null && node.right == null && sum == node.val) {
            res.add(new ArrayList<Integer>(list));
            list.remove(list.size() - 1);
            return;
        }

        dfs(res, list, node.left, sum - node.val);
        dfs(res, list, node.right, sum - node.val);
        list.remove(list.size() - 1);
    }

    public static void main(String[] args) {

    }
}
