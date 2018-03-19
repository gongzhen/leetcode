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

public class LC269 {

    public String alienOrder(String[] words) {
        if(words.length == 0) {
            return "";
        }

        Set<Character> set = new HashSet<Character>();
        for(String word : words) {
            for(int i = 0; i < word.length(); i++) {
                set.add(word.charAt(i));
            }
        }

        Map<Character, Set<Character>> graph = new HashMap<Character, Set<Character>>();
        int[] indegree = new int[26];
        for(int i = 1; i < words.length; i++) {
            String preWord = words[i-1];
            String curWord = words[i];
            int len = Math.min(preWord.length(), curWord.length());
            for(int j = 0; j < len; j++) {
                char preChar = preWord.charAt(j);
                char curChar = curWord.charAt(j);
                if(preChar != curChar) {
                    if(graph.containsKey(preChar) == false) {
                        graph.put(preChar, new HashSet<Character>());
                    }
                    if(graph.get(preChar).add(curChar) == true) {
                        indegree[curChar - 'a']++;
                    }
                    break;
                }
            }
        }

        Queue<Character> pq = new LinkedList<Character>();
        for(int i = 0; i < 26; i++) {
            if(indegree[i] == 0) {
                char c = (char)(i + 'a');
                if(set.contains(c)) {
                    pq.offer(c);
                }
            }
        }

        StringBuilder sb = new StringBuilder();
        while(!pq.isEmpty()) {
            char c = pq.poll();
            sb.append(c);
            if(graph.containsKey(c)){
                Set<Character> wordSet = graph.get(c);
                for(Character ch: wordSet) {
                    indegree[ch - 'a']--;
                    if(indegree[ch - 'a'] == 0) {
                        pq.offer(ch);
                    }
                }
            }
        }

        return sb.length() != set.size() ? "" : sb.toString(); 
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
		LC269 obj = new LC269();
        
	}

}
