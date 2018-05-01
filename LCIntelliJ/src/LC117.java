import java.util.LinkedList;
import java.util.Queue;

public class LC117 {

    public void connect_2(TreeLinkNode root) {
        if(root == null) {
            return;
        }

        TreeLinkNode prev = null;
        TreeLinkNode head = null;
        TreeLinkNode current = root;

        while (current != null) {

            while(current != null) {
                if(current.left != null) {
                    if(prev == null) {
                        /// starting from most left node and set head node.
                        head = current.left;
                    } else {
                        /**
                         *      4                  5(current)
                         *        6(prev)--> left
                         * */
                        prev.next = current.left;
                    }
                    prev = current.left;
                }

                if(current.right != null) {
                    if(prev == null) {
                        head = current.right;
                    } else {
                        prev.next = current.right;
                    }
                    prev = current.right;
                }
                current = current.next;
            }

            /// Finished one level traverse.
            /// head is the most left node of each level.
            current = head;
            head = null;
            prev = null;
        }

    }

    public void connect(TreeLinkNode root) {
        if(root == null) {
            return;
        }

        Queue<TreeLinkNode> pq = new LinkedList<>();
        pq.offer(root);
        while(!pq.isEmpty()) {
            int size = pq.size();
            for(int i = 0; i < size; i++) {
                TreeLinkNode top = pq.poll();
                PrintUtils.printString("top:" + top.val);
                if(i != size - 1) {
                    TreeLinkNode peek = pq.peek();
                    PrintUtils.printString("peek:" + peek.val);
                    peek.next = top;
                }

                if(top.right!= null) {
                    pq.offer(top.right);
                }
                if(top.left!= null) {
                    pq.offer(top.left);
                }
            }
        }
    }

    public static void main(String[] args) {

        TreeLinkNode node1 = new TreeLinkNode(1);
        TreeLinkNode node2 = new TreeLinkNode(2);
        TreeLinkNode node3 = new TreeLinkNode(3);
        TreeLinkNode node4 = new TreeLinkNode(4);
        TreeLinkNode node5 = new TreeLinkNode(5);
        node1.left = node2;
        node1.right = node3;
        node2.left = node4;
        node3.right = node5;

        LC117 obj = new LC117();
        obj.connect(node1);
        if(node1.next != null) {
            PrintUtils.printString("node1.next:" + node1.next);
        } else {
            PrintUtils.printString("node1.next is null");
        }
        if(node2.next != null) {
            PrintUtils.printString("node2.next:" + node2.next);
        } else {
            PrintUtils.printString("node2.next is null");
        }
        if(node3.next != null) {
            PrintUtils.printString("node3.next:" + node3.next);
        } else {
            PrintUtils.printString("node3.next is null");
        }

    }
}
