import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

// class TreeNode {
// 	int val;
// 	TreeNode left;
// 	TreeNode right;
// 	TreeNode(int x) { val = x; }
// }
// private void createTree() {
// 	//       5
// 	//    2      7
// 	//  1   3      10
// 	TreeNode node5 = new TreeNode(5);
// 	TreeNode node2 = new TreeNode(2);
// 	TreeNode node1 = new TreeNode(1);
// 	TreeNode node7 = new TreeNode(7);
// 	TreeNode node10 = new TreeNode(10);

// 	node5.left = node2;
// 	node5.right = node7;
// 	node2.left = node1;
// 	node2.right = node3;
// 	node5.right = node7;
// 	node7.right = node10; 
// 	return node5;
// }
// private void printList(List<String> list) {
// 	for(String s: list) {
// 		System.out.println(s);
// 	}
// }
// private void printQueue(Queue<String> list) {
// 	for(String s: list) {
// 		System.out.println(s);
// 	}
// } 
// private void printListOfList(List<List<Integer>> listOflist) {
// 	for(List<Integer> list: listOflist){
// 		for(int n : list) {
// 			System.out.print(n + ", ");
// 		}
// 		System.out.println();
// 	}
// }
// private void printMatrix(int[][] matrix) {
//     for(int[] s: matrix) {
//         for(int n: s) {
//             System.out.print(n + ",'");
//         }
//         System.out.println();            
//     }
// }   
//    private void printLine() {
//    	System.out.println("---------------------"); 
// }

public class Solution1 {

    public List<Integer> findSubstring(String s, String[] words) {
        List<Integer> res = new ArrayList<Integer>();
        if(words.length == 0 || s.length() == 0)  {
            return res;
        }
        
        String str = "";
        int total = 0;
        for(String word : words) {
            total += word.length();
        }
        int[] visited = new int[words.length];
        List<String> list = new ArrayList<String>();
        dfs(words, list, str, total, visited);
        
        for(String word : list) {
            if(s.indexOf(word) != -1) {
                res.add(s.indexOf(word));
            }
        }
        return res;
    }
    
    private void dfs(String[] words, List<String> list, String str, int total, int[] visited) {
        if(str.length() == total) {
            if(list.contains(str) == false) {
                list.add(str);      
            }
            
            return;
        }
        
        for(int i = 0; i < words.length; i++) {
            if(visited[i] == 1) {
                continue;
            }
            visited[i] = 1;
            dfs(words, list, str + words[i], total, visited);
            visited[i] = 0;
        }
    }

    private void printLine() {
        System.out.println("---------------------"); 
    }

    private void printString(String arg) {
        System.out.println(arg); 
    }    

    private void printArray(int[] list) {
        printStringWithoutNewLine("[");
        int i = 0;
        for(int n : list) {
            printStringWithoutNewLine("[" + i + "]" + n + ", ");
            i++;
        }
        printStringWithoutNewLine("]\n");
    } 

    private void printStringWithoutNewLine(String arg) {
        System.out.print(arg + ","); 
    } 

    private void printList(List<String> list) {
        for(String s: list) {
            System.out.println(s);
        }
    }  

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
        String[] words = new String[]{"word","good","best","good"};
        String s = "wordgoodgoodgoodbestword";
        obj.findSubstring(s, words);
	}

}
