import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

// class TreeNode {
//  int val;
//  TreeNode left;
//  TreeNode right;
//  TreeNode(int x) { val = x; }
// }
// private TreeNode createTree() {
//  //       5
//  //    2      7
//  //  1   3      10
//  TreeNode node5 = new TreeNode(5);
//  TreeNode node2 = new TreeNode(2);
//  TreeNode node1 = new TreeNode(1);
//  TreeNode node7 = new TreeNode(7);
//  TreeNode node10 = new TreeNode(10);

//  node5.left = node2;
//  node5.right = node7;
//  node2.left = node1;
//  node2.right = node3;
//  node5.right = node7;
//  node7.right = node10; 
//  return node5;
// }
// private void printList(List<String> list) {
//  for(String s: list) {
//      System.out.println(s);
//  }
// }
// private void printQueue(Queue<String> list) {
//  for(String s: list) {
//      System.out.println(s);
//  }
// } 
// private void printListOfList(List<List<Integer>> listOflist) {
//  for(List<Integer> list: listOflist){
//      for(int n : list) {
//          System.out.print(n + ", ");
//      }
//      System.out.println();
//  }
// }
// private void printMatrix(int[][] matrix) {
//     for(int[] s: matrix) {
//         for(int n: s) {
//             System.out.print(n + ",");
//         }
//         System.out.println();            
//     }
// }  
//  private void scannerIn() {
//    Scanner scanner = new Scanner(System.in);
//    scanner.nextLine();
// }
// private void printString(String arg) {
//     System.out.println(arg); 
// }
// private void printLine() {
//     System.out.println("---------------------"); 
// }  
// 
// private void printMap(HashMap<TreeNode, Integer> map) {
//     for(TreeNode node:map.keySet()) {
//         Integer value = map.get(node);
//         printString("key:" + node.val + ",value:" + value);
//     }
// }
// private void printStringWithoutNewLine(String arg) {
//     System.out.print(arg + ","); 
// } 
// private void printArray(int[] list) {
//     for(int n: list) {
//         System.out.println(n);
//     }
// } 
// private void printTree(TreeNode root) {
//     if(root == null) { return ; }
//     Queue<TreeNode> queue = new LinkedList<TreeNode>();
//     queue.offer(root);
//     while(!queue.isEmpty()) {
//         int size = queue.size();
//         for(int i = 0; i < size; i++) {
//             TreeNode node = queue.poll();                
//             if(node.left != null) {
//                 queue.offer(node.left);
//             }
//             if(node.right != null) {
//                 queue.offer(node.right);
//             }                
//             printStringWithoutNewLine("" + node.val);
//         }
//         printLine();
//     }
// } 

public class Solution1 {

    private static class Pair {
        double diff;
        int val;
        public Pair(double diff, int val) {
            this.diff = diff;
            this.val = val;
        }
    }
    
    public List<Integer> closestKValuesPQ(TreeNode root, double target, int k) {
        PriorityQueue<Pair> pq = new PriorityQueue<Pair>(k, new Comparator<Pair>(){
            public int compare(Pair a, Pair b) {
                return Double.compare(b.diff, a.diff);
            }
        });
        inorderPQ(root, target, k, pq);
        List<Integer> res = new ArrayList<Integer>();
        while(!pq.isEmpty()) {
            res.add(pq.poll().val);
        }
        return res;
    }
    
    private void inorderPQ(TreeNode node, double target, int k, PriorityQueue<Pair> pq) {
        if(node == null) {
            return;
        }
        
        inorder(node.left, target, k, pq);
        pq.offer(new Pair(Math.abs(node.val - target) , node.val));
        if(pq.size() > k) {
            pq.poll();
        }
        inorder(node.right, target, k, pq);
    }    

    public List<Integer> closestKValues(TreeNode root, double target, int k) {
        List<Integer> list = new ArrayList<Integer>();
        inorder(root, list);
        int[] nums = new int[list.size()];
        int idx = 0;
        for(int n : list) {
            nums[idx++] = n;
        }
        double diff = Double.MAX_VALUE;
        int minIdx = -1;
        for(int i = 0; i < nums.length; i++) {
            if(Math.abs(nums[i] - target) < diff) {
                diff = Math.abs(nums[i] - target);
                minIdx = i;
            }
        }
        
        List<Integer> res = new ArrayList<Integer>();
        int left = minIdx - 1;
        int right = minIdx + 1;
        res.add(nums[minIdx]);
        //// make sure k - 1 not k as the right bound.
        for(int i = 0; i < k - 1; i++) {
            if(left >= 0 && right < nums.length) {
                if(Math.abs(nums[left] - target) < Math.abs(nums[right] - target)) {
                    res.add(nums[left]);
                    
                    left--;
                } else {
                    res.add(nums[right]);
                    
                    right++;                    
                }
            } else if (left >= 0) {
                res.add(nums[left]);
                left--;
            } else if (right < nums.length){
                res.add(nums[right]);
                right++;                    
            }
        }
        return res;
    }
    
    private void inorder(TreeNode node, List<Integer> list) {
        if(node == null) {
            return;
        }
        inorder(node.left, list);
        list.add(node.val);
        inorder(node.right, list);
    }

    private void printStack(Stack<Integer> stack) {
        printString("stack[:");
        Iterator<Integer> iter = stack.iterator();
        while(iter.hasNext()) {
            printString("" + iter.next());
        }
        printString("]stack");
    }

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    }    

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
	}

}
