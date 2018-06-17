package com.leetcode.Tree;

import com.leetcode.Helper.*;

public class LC117 {

    private static class Solution1 {
        public void connect(TreeLinkNode root) {
            if(root == null) {
                return;
            }

            TreeLinkNode prev = null;
            TreeLinkNode head = null;
            TreeLinkNode current = root;

            while(current != null) {
                while(current != null) {
                    if(current.left != null) {
                        if(prev != null) {
                            prev.next = current.left;
                        } else {
                            head = current.left;
                        }
                        prev = current.left;
                    }

                    if(current.right != null) {
                        if(prev != null) {
                            prev.next = current.right;
                        } else {
                            head = current.right;
                        }
                        prev = current.right;
                    }
                    current = current.next;
                }
                current = head;
                head = null;
                prev = null;
            }
        }
    }

    private static class Solution2 {
        public void connect(TreeLinkNode root) {

        }
    }

    public static void main(String[] args) {

    }
}
