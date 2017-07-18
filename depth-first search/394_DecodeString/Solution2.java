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

public class Solution2 {

    public String decodeString(String s) {
        if (s == "") {
            return "";
        }
        Stack<String> strStack = new Stack<>();
        Stack<Integer> numStack = new Stack<>();
        
        int i = 0;
        String charStr = "";
        while(i < s.length()) {
            char c = s.charAt(i);
            if (Character.isDigit(c) == true) {
                int count = 0;
                while(Character.isDigit(c) == true) {
                    count = count * 10 + c - '0';
                    i++;
                    c = s.charAt(i);
                }
                numStack.push(count);
            } else if (c == '[') {
                strStack.push(charStr);                             
                i++;
                charStr = "";
            } else if (c == ']') {                
                i++;
                int num = numStack.pop();
                printString("line:96:] => number:" + num);
                StringBuilder result = new StringBuilder(strStack.pop());
                for (int j = 0; j < num; j++) {
                    result.append(charStr);
                }
                charStr = result.toString();
                printString("line:102:charStr:" + charStr);
            } else {
                charStr = charStr + c;
                i++;
                printString("line:106:charStr:" + charStr);
            }
            printStringStack(strStack);
            printIntStack(numStack);
            printString("index:" + i);
            printLine();
        }
        
        return charStr;
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
		Solution2 obj = new Solution2();
		System.out.println(obj.decodeString("3[a]2[bc]"));
	}

}
