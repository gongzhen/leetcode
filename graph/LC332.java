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
// private void createTree() {
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

public class LC332 {

    public List<String> findItinerary(String[][] tickets) {
        Map<String, PriorityQueue<String>> targets = new HashMap<String, PriorityQueue<String>>();
        for (String[] ticket : tickets) {
            targets.computeIfAbsent(ticket[0], k -> new PriorityQueue<String>()).add(ticket[1]);
        }
        List<String> route = new LinkedList<String>();
        Stack<String> stack = new Stack<String>();
        stack.push("JFK");
        while (!stack.empty()) {
            printString("stack.peek():" + stack.peek());
            while (targets.containsKey(stack.peek()) && !targets.get(stack.peek()).isEmpty()) {
                String pop = targets.get(stack.peek()).poll();
                printString("targets.get(stack.peek()).poll()" + pop);
                stack.push(pop);
            }                
            String pop = stack.pop();
            printString("route.pop():" + pop);
            route.add(0, pop);
        }
        return route;
    }	


    private void printLine() {
        System.out.println("---------------------"); 
    }

    private void printString(String arg) {
        System.out.println(arg); 
    }  

	private void printList(int[] list, int length) {
		for(int i = 0; i < length; i ++ ){
			System.out.println(list[i]);
		}
	}    

	public static void main(String[] args) {
		LC332 obj = new LC332();
        /// [["JFK","KUL"],["JFK","NRT"],["NRT","JFK"]]
        String[][] tickets = new String[][]{{"MUC", "LHR"}, {"JFK", "MUC"}, {"SFO", "SJC"}, {"LHR", "SFO"}};
		System.out.println(obj.findItinerary(tickets));
	}

}
