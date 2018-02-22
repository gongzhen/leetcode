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

public class Solution2 {

  public int[] findOrderBFS(int numCourses, int[][] prerequisites) {
        // Write your code here
        // ArrayList[] edges = new ArrayList[numCourses];
        List<List<Integer>> edges = new ArrayList<List<Integer>>();
        int[] degree = new int[numCourses];
        
        for (int i = 0;i < numCourses; i++)
            edges.add(new ArrayList<Integer>());
            
        for (int i = 0; i < prerequisites.length; i++) {
            degree[prerequisites[i][0]] ++ ;
            edges.get(prerequisites[i][1]).add(prerequisites[i][0]);
        }

        Queue<Integer> queue = new LinkedList<Integer>();
        for(int i = 0; i < degree.length; i++){
            if (degree[i] == 0) {
                queue.add(i);
            }
        }
        
        int count = 0;
        int[] order = new int[numCourses];
        while(!queue.isEmpty()){
            int course = (int)queue.poll();
            order[count] = course;
            count ++;
            int n = edges.get(course).size();
            printString("course: " + course + ", n: " + n);
            for(int i = n - 1; i >= 0 ; i--){
                int pointer = (int)edges.get(course).get(i);
                printString("pointer: " + pointer);
                degree[pointer]--;
                if (degree[pointer] == 0) {
                    queue.add(pointer);
                }
            }
        }
        
        if (count == numCourses)
            return order;

        return new int[0];
    }

    public int[] findOrder(int numCourses, int[][] prerequisites) {
        List<List<Integer>> graph = new ArrayList<List<Integer>>();
        for(int i = 0; i < numCourses; i++) {
            graph.add(new ArrayList<Integer>());
        }

        for (int[] list : prerequisites) {
            graph.get(list[1]).add(list[0]);
        }
        
        printListOfList(graph);

        int[] visited = new int[numCourses];
        List<Integer> result = new ArrayList<Integer>();

        for (int i = 0; i < numCourses; i++) {
            if (dfs(graph, result, visited, i) == false) {
                return new int[0];
            }
        }

        int[] resultArray = new int[result.size()];

        int i = 0;
        for(int n : result) {
            resultArray[i++] = n;
        }

        return resultArray;
    }	

    private boolean dfs(List<List<Integer>> graph, List<Integer> result, int[] visited, int index) {
        printString("line 136: index:" + index);
        printString("line 137: visited[" + index + "]:" + visited[index]);
        if (visited[index] == 1) { // 1 means visited.
            return false;
        }

        if(visited[index] == -1) { /// -1 means added the number to result.
            return true;
        }

        visited[index] = 1; // added the number to result list.

        List<Integer> list = graph.get(index);
        printList(list);
        printLine();
        for(int course: list) {
            printString("line 152: course:" + course);
            if(dfs(graph, result, visited, course) == false) {
                return false;
            }
        }

        visited[index] = -1; // visited

        result.add(0, index);
        printString("line 161:");
        printList(result);
        printLine();
        return true;
    }

    private void printListOfList(List<List<Integer>> listOflist) {
        int i = 0;
        for(List<Integer> list: listOflist){
            System.out.print(i + ":");
            for(int n : list) {
                System.out.print(n + ", ");
            }
            System.out.println();
            i++;
        }
    }    

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    } 

    private void printList(List<Integer> list) {
        for(int s: list) {
            System.out.print(s + " ,");
        }
        System.out.println();
    }       

    private void printArray(int[] list) {
        for(int n: list) {
            System.out.println(n);
        }
    }    

	public static void main(String[] args) {
		Solution2 obj = new Solution2();
		int[][] matrix = new int[][]{{1,0},{2,1},{3,1},{3,0}};
		int[] result = obj.findOrderBFS(4, matrix);
        obj.printArray(result);
	}

}
