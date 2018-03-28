import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution1 {

    public List<List<Integer>> zigzagLevelOrder(TreeNode root) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        if(root == null) {
            return res;
        }
        Queue<TreeNode> pq = new LinkedList<TreeNode>();
        pq.offer(root);
        boolean isLeft = true;

        while(!pq.isEmpty()) {
            int size = pq.size();
            List<Integer> list = new ArrayList<Integer>();
            for(int i = 0; i < size; i++) {
                TreeNode top = pq.poll();
                if(isLeft == true) {
                    list.add(top.val);
                } else {
                    list.add(0, top.val);
                }

                if(top.left != null) {
                    pq.offer(top.left);
                }
                if(top.right != null) {
                    pq.offer(top.right);
                }
            }
            isLeft = !isLeft;
            res.add(list);
        }
        return res;
    }


    public static void main(String[] args) {
        Solution1 obj = new Solution1();
    }

}
