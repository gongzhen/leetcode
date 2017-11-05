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
// private void enterKey() {
//     System.out.println("Press \"ENTER\" to continue...");
//     Scanner scanner = new Scanner(System.in);
//     scanner.nextLine();      
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
// private void printStack(Stack<Integer> stack) {
//     Interator<Integer> iter = stack.iterator();
//     while(iter.hasNext()) {
//         printString("" + iter.next());
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

public class LFUCache {

    private static class Node {

        int key;
        int value;
        int freq;
        Iterator<Integer> itr;

        public Node(int key, int value, int freq, Iterator<Integer> itr) {
            this.key = key;
            this.value = value;
            this.freq = freq;
            this.itr = itr;
        }
    }

    private int capacity;
    private int minFreq;
    private Map<Integer, Node> map;
    private Map<Integer, List<Integer>> listMap;

    public LFUCache(int capacity) {
        this.capacity = capacity;
        this.minFreq = 0;
        this.map = new HashMap<Integer, Node>();
        this.listMap = new HashMap<Integer, List<Integer>>();
    }
    
    public int get(int key) {
        if(map.containsKey(key) == false) {
            return -1;
        }

        Node node = map.get(key);
        touch(node);
        return node.value;
    }
    
    public void put(int key, int value) {
        if(this.capacity == 0) {
            return;
        }

        if(this.map.containsKey(key) == true) {
            Node node = this.map.get(key);
            node.value = value;
            touch(node);
            return;
        }

        if(this.capacity == this.map.size()) {
            List<Integer> list = this.listMap.get(minFreq);
            int keyRemoved = list.get(list.size() - 1);
            printString("keyRemoved:" + keyRemoved);
            list.remove(list.size() - 1);
            this.map.remove(keyRemoved);
        }

        final int freq = 1;
        this.minFreq = freq;
        if(this.listMap.containsKey(freq) == true) {
            this.listMap.get(freq).add(0, key);
        } else {
            List<Integer> newList = new ArrayList<Integer>();
            newList.add(key);
            this.listMap.put(freq, newList);
        }

        // printString("node.key:" + key + ", itr:" + this.listMap.get(freq).iterator());
        this.map.put(key, new Node(key, value, freq, this.listMap.get(freq).iterator()));        
    }

    private void touch(Node node) {
        if(node == null) {
            return;
        }

        final int prevFreq = node.freq;
        final int freq = ++(node.freq);
        printString("193: node key:" + node.key + ", node.value:" + node.value);

        List<Integer> list = this.listMap.get(prevFreq);
        Iterator<Integer> it = list.iterator();
        while(it.hasNext()) {  
            int key = it.next();
            printString("198 key:" + key);
            if(key == node.key) {
                it.remove();
            }
        }
        // printLine();
        // printListMap(this.listMap);
        if(list.isEmpty() == true && prevFreq == minFreq) {
            this.listMap.remove(prevFreq);
            this.minFreq++;
        }

        if(this.listMap.containsKey(freq)) {
            this.listMap.get(freq).add(0, node.key);
        } else {
            List<Integer> newList = new ArrayList<Integer>();
            newList.add(node.key);
            this.listMap.put(freq, newList);
        }
        node.itr = this.listMap.get(freq).iterator();        
    }


    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    }    

    public void printMap() {
        printMap(this.map);
    }

    private void printMap(Map<Integer, Node> map) {
        for(int key : map.keySet()) {
            Node node = map.get(key);
            printString("237 key:" + node.key + ",value:" + node.value + ", freq:" + node.freq);
            printString("238 itr: " + node.itr);
        }
    }  

    public void printListMap() {
        printListMap(this.listMap);
    }

    private void printListMap(Map<Integer, List<Integer>> map) {
        for(int freq : map.keySet()) {
            List<Integer> list = map.get(freq);
            printString("249 freq: " + freq);
            printList(list);
        }
    }
    private void printList(List<Integer> list) {
        for(int s: list) {
            printString("key:" + s);
        }
        printLine();
    }   

	public static void main(String[] args) {
        LFUCache obj = new LFUCache(2);
        obj.put(1, 2);
        // map:(1: 2)
        // listMap(1: [1]);        
        obj.put(3, 4);
        // map:(1: 2, 3: 4)
        // listMap(1: [3, 1]);                
        obj.put(5, 6);
        // map:(3: 4, 5: 6)
        // listMap(1: [5, 3]);                
        obj.printLine();
        obj.printMap();
        obj.printLine();
        obj.printListMap();
        obj.printLine();
        obj.get(3);
        obj.printLine();
        obj.printListMap();
	}

}
