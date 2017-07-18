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
// private void printArray(int[] list) {
//     for(int n: list) {
//         System.out.println(n);
//     }
// }   

public class Solution1 {

    public int findCircleNum(int[][] M) {
        boolean[] visited = new boolean[M.length];
        int count = 0;
        printMatrix(M);
        for(int i = 0; i < M.length; i++) {
            if(visited[i] == false) {
                count++;
                printString("line:91 visited[" + i + "], count = " + count);                
                dfs(M, visited, i);
            }
        }
        return count;
    }	

    private void dfs(int[][] M, boolean[] visited, int i) {
        printString("line99:i[" + i + "]");          
        for(int j = 0; j < M.length; j++) {
            printString("line101:j[" + j + "]");          
            if(M[i][j] == 1 && visited[j] == false) {
                visited[j] = true;
                printString("line105:visited[" + j + "] is true");          
                dfs(M, visited, j);
            }            
        }
        printLine();
    }

    private void printString(String arg) {
        System.out.println(arg); 
    }    

    private void printArray(int[] list) {
        for(int n: list) {
            System.out.println(n);
        }
    }

    private void printMatrix(int[][] matrix) {
        for(int[] s: matrix) {
            for(int n: s) {
                System.out.print(n + ",");
            }
            System.out.println();            
        }
    }          

    private void printLine() {
    	System.out.println("---------------------"); 
	}

	private void printList(int[] list, int length) {
		for(int i = 0; i < length; i ++ ){
			System.out.println(list[i]);
		}
	}    

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		int[][] matrix = new int[][]{{1, 1, 0}, {1, 1, 0}, {0, 0, 1}};
		System.out.println(obj.findCircleNum(matrix));
	}

}
