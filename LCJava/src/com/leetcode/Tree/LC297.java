package com.leetcode.Tree;

import com.leetcode.Helper.PrintUtils;
import com.leetcode.Helper.TreeNode;
import com.leetcode.Helper.TreeUtils;

import java.util.LinkedList;
import java.util.Queue;

public class LC297 {

    // Encodes a tree to a single string.
    public String serialize(TreeNode root) {
        if(root == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        Queue<TreeNode> queue = new LinkedList<>();
        sb.append(root.val).append(",");
        queue.offer(root);
        while(!queue.isEmpty()) {
            TreeNode node = queue.poll();
            if(node.left != null) {
                queue.offer(node.left);
                sb.append(node.left.val).append(",");
            } else {
                sb.append("#").append(",");
            }

            if(node.right != null) {
                queue.offer(node.right);
                sb.append(node.right.val).append(",");
            } else {
                sb.append("#").append(",");
            }
        }

        // sb:3,2,7,1,5,#,10,#,#,#,#,#,#,
        return sb.toString();
    }

    // Decodes your encoded data to tree.
    public TreeNode deserialize(String data) {
        if(data == null || data.isEmpty() == true) {
            return null;
        }

        String[] array = data.split(",");
        int rootNumber = Integer.parseInt(array[0]);
        TreeNode root = new TreeNode(rootNumber);
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);

        int idx = 1;
        while(!queue.isEmpty()) {
            TreeNode node = queue.poll();
            if (idx < array.length && array[idx].equals("#") == false) {
                TreeNode left = new TreeNode(Integer.parseInt(array[idx]));
                queue.offer(left);
                node.left = left;
            }
            ++idx;
            if (idx < array.length && array[idx].equals("#") == false) {
                TreeNode right = new TreeNode(Integer.parseInt(array[idx]));
                queue.offer(right);
                node.right = right;
            }
            ++idx;
        }
        return root;
    }

    public static void main(String[] args) {
        LC297 obj = new LC297();
        TreeNode root = TreeUtils.createTree();
        String str = obj.serialize(root);
        PrintUtils.printString("str:" + str);
        TreeUtils.printTreeByLevel(root);
    }

}
