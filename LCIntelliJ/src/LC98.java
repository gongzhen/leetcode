import jdk.nashorn.api.tree.Tree;

public class LC98 {

    public boolean isValidBST(TreeNode root) {
        return dfs(root, null, null);
    }

    private boolean dfs(TreeNode node, TreeNode left, TreeNode right) {
        if(node == null) return true;

        if(left != null && left.val >= node.val) {
            return false;
        }

        if(right != null && right.val <= node.val) {
            return false;
        }

        return dfs(node.left, left, node) && dfs(node.right, node, right);
    }



    public static void main(String[] args) {
        LC98 obj = new LC98();
        TreeNode root = TreeUtils.createBSTTree();
        PrintUtils.printString("res:" + obj.isValidBST(root));
    }
}
