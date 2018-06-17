package com.leetcode.Helper;

import java.util.LinkedList;
import java.util.Queue;

public class TreeUtils {

    public static void printTree(TreeNode node) {
        dfs(node);
    }

    public static void printTreeByLevel(TreeNode node) {
        if(node == null) return;
        Queue<TreeNode> pq = new LinkedList<>();
        pq.offer(node);
        while (!pq.isEmpty()) {
            int size = pq.size();
            for(int i = 0; i < size; i++) {
                TreeNode n = pq.poll();
                PrintUtils.printStringWithoutNewLine("" + n.val + ", ");
                if(n.left != null) {
                    pq.offer(n.left);
                }
                if(n.right != null) {
                    pq.offer(n.right);
                }
                PrintUtils.printString("");
            }
        }
    }

    public static void dfs(TreeNode node) {
        if(node == null) {
            return;
        }
        dfs(node.left);
        PrintUtils.printStringWithoutNewLine("" + node.val + ", ");
        dfs(node.right);
    }

    public static TreeNode createTree() {
        //       3
        //    2      7
        //  1   5       10
        TreeNode node5 = new TreeNode(5);
        TreeNode node2 = new TreeNode(2);
        TreeNode node1 = new TreeNode(1);
        TreeNode node7 = new TreeNode(7);
        TreeNode node3 = new TreeNode(3);
        TreeNode node10 = new TreeNode(10);
        node3.left = node2;
        node3.right = node7;
        node2.left = node1;
        node2.right = node5;
        node7.right = node10;
        return node3;
    }

    public static TreeNode createBSTTree() {
        //       5
        //    2      7
        //  1   3      10
        TreeNode node5 = new TreeNode(5);
        TreeNode node2 = new TreeNode(2);
        TreeNode node1 = new TreeNode(1);
        TreeNode node7 = new TreeNode(7);
        TreeNode node3 = new TreeNode(3);
        TreeNode node10 = new TreeNode(10);
        node5.left = node2;
        node5.right = node7;
        node2.left = node1;
        node2.right = node3;
        node5.right = node7;
        node7.right = node10;
        return node5;
    }

    public static TreeNode LC298createBSTTree() {
        //       5
        //    2      7
        //  1   3      10
        TreeNode node2 = new TreeNode(2);
        TreeNode node1 = new TreeNode(1);
        TreeNode node22 = new TreeNode(2);
        TreeNode node3 = new TreeNode(3);
        node2.left = null;
        node2.right = node3;
        node3.left = node22;
        node22.left = node1;
        return node2;
    }

    public static TreeNode LC112createTree() {
        //       -2
        //           -3
        TreeNode node2 = new TreeNode(-2);
        TreeNode node3 = new TreeNode(-3);
        node2.left = null;
        node2.right = node3;
        return node2;
    }

    public static TreeNode LC124createTree() {
        //       -2
        //           -3
        TreeNode node_10 = new TreeNode(-10);
        TreeNode node9 = new TreeNode(9);
        TreeNode node20 = new TreeNode(20);
        TreeNode node15 = new TreeNode(15);
        TreeNode node7 = new TreeNode(7);
        node_10.left = node9;
        node_10.right = node20;

        node20.left = node15;
        node20.right = node7;

        return node_10;
    }

    public static TreeNode LC145createTree() {
        //       -2
        //           -3
        TreeNode node1 = new TreeNode(1);
        TreeNode node2 = new TreeNode(2);
        TreeNode node3 = new TreeNode(3);
        node1.left = null;
        node1.right = node2;

        node2.left = node3;
        return node1;
    }
}
