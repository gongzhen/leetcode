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

public class Solution3 {

    private static int index;

    public String decodeString(String s) {
        index = 0;
        return dfs(s); 
    }	

    private String dfs(String s) {
        StringBuilder sb = new StringBuilder();
        int count = 0;
        while(index < s.length()) {
            printString("line 81 char at index:" + index + " is " + s.charAt(index));
            if (Character.isDigit(s.charAt(index)) == true) {
                int digit = Character.getNumericValue(s.charAt(index++));
                count = count * 10 + digit;
                printString("line 85 count:" + count);
            } else if (s.charAt(index) == '[') { printLine();
                printString("line 87 char at index:" + index + " is " + s.charAt(index));                
                ++index;
                String str = dfs(s);
                printLine();
                printString("line 91 str:" + str);                
                for (int i = 0; i < count; i++) {
                    sb.append(str);
                } 
                printString("line 95 sb:" + sb.toString());
                count = 0;
            } else if (s.charAt(index) == ']') {
                index++;
                printString("line 99 sb:" + sb.toString());
                return sb.toString();
            } else {
                sb.append(s.charAt(index++));
                printString("line 103 sb:" + sb.toString());                
            }            
        }
        printString("line 106 sb:" + sb.toString());        
        return sb.toString();
    }

    private void printList(List<String> list) {
        for(String s: list) {
            System.out.println(s);
        }
    }   

    private void printStringStack(Stack<String> stack) {
        for (Iterator<String> iterator = stack.iterator(); iterator.hasNext();) {
           String str = iterator.next();
           printString("strStack:|-" + str +  "-|");
        }
    }  

    private void printIntStack(Stack<Integer> stack) {
        for (Iterator<Integer> iterator = stack.iterator(); iterator.hasNext();) {
           int num = iterator.next();
           printString("numStack:" + num);
        }
    }      

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    }   

	public static void main(String[] args) {
		Solution3 obj = new Solution3();
		System.out.println(obj.decodeString("3[a]2[bc]"));
	}

}
