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
// class ListNode {
//     int val;
//     ListNode next;
//     ListNode(int x) {
//         val = x;
//         next = null;
//     }
// }
// class Interval {
//     int start;
//     int end;
//     Interval() { start = 0; end = 0; }
//     Interval(int s, int e) { start = s; end = e; }
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
// private void printListMap(Map<Integer, List<Integer>> map) {
//     for(Integer key:map.keySet()) {
//         List<Integer> list = map.get(key);
//         printStringWithoutNewLine("key:" + key + "[");   
//         for(int n : list) {
//             printStringWithoutNewLine(n + ", ");    
//         }
//         printString("]");               
//     }
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
//     printStringWithoutNewLine("[");
//     for(int n: list) {
//         printStringWithoutNewLine(n + ", ");
//     }
//     printStringWithoutNewLine("]\n");
// } 
// private void printArray(int[] list) {
//     printStringWithoutNewLine("[");
//     int i = 0;
//     for(int n : list) {
//         printStringWithoutNewLine("[" + i + "]" + n + ", ");
//         i++;
//     }
//     printStringWithoutNewLine("]\n");
// }  
// private void printArray(int[] list, int s, int e) {
//     printStringWithoutNewLine("[");
//     for(int i = s; i <= e; i++) {
//         printStringWithoutNewLine("[" + i + "]" + list[i] + ", ");
//     }
//     printStringWithoutNewLine("]\n");
// } 
// private void printStringWithoutNewLine(String arg) {
//     System.out.print(arg); 
// }  
// private void printStringWithoutNewLine(String arg) {
//     System.out.print(arg); 
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

public class LC76 {

    public String minWindow(String s, String t) {
        int len1 = s.length();
        int len2 = t.length();
        
        Set<Character> set = new HashSet<Character>();
        for(int i = 0; i < len2; i++) {
            set.add(t.charAt(i));
        }
        int start = 0;
        int end = 0;
        String res = "";
        int min = len1;
        for(int i = 0; i < len1; i++) {
            if(set.contains(s.charAt(i))) {
                int temp = len2;
                start = i;
                temp--;
                for(int j = i + 1; j < len1; j++) {
                    if(set.contains(s.charAt(j))) {
                        temp--;
                        if(temp == 0) {
                            end = j;
                        }
                    }
                }
                if(end >= start) {
                    int diff = end - start + 1;    
                    if(diff < min) {
                        min = diff;
                        res = s.substring(start, end);
                    }
                }                                
            }
        }
        return res;
    }	

    public String minWindow_1(String s, String t) {
        int[] map = new int[128];
        int len1 = s.length();
        char[] s1 = s.toCharArray();
        int len2 = t.length();
        char[] t1 = t.toCharArray();
        if(len1 < len2) {
            return "";
        }
        for(int i = 0; i < len2; i++) {
            map[t1[i] - 'A']++;
        }
        int start = 0;
        int end = 0;
        int min = len1 + 1;
        for(int i = 0; i < len1; i++) {
            if(map[s1[i] - 'A'] != 0) {
                int[] temp = map.clone();
                for(int j = i; j < len1; j++) {
                    if(temp[s1[j] - 'A'] != 0) {
                        temp[s1[j] - 'A']--;
                        if(findAllChars(temp) == true) {
                            if(j - i + 1 < min) {
                                start = i;
                                end = j;                                
                                min = end - start + 1; 
                            }                            
                            break;
                        }                        
                    }
                }
            }            
        }
        if(min == len1 + 1) {
            return "";
        }
        
        return s.substring(start, end + 1);
    }  

    public String minWindow_2(String s, String t) {    
        int[] map = new int[256];
        int len1 = s.length();
        char[] s1 = s.toCharArray();
        int len2 = t.length();
        char[] t1 = t.toCharArray();
        if(len1 < len2) {
            return "";
        }
        for(int i = 0; i < len2; i++) {
            map[t1[i] - 'A']++;
        }
        int min = len1 + 1;
        int i = 0;
        int j = 0;
        int head = 0;
        int count = len2;
        while(i < len1) {
            if(map[s1[i] - 'A'] >= 1) {
                count--;
            }
            map[s1[i] - 'A']--;
            i++;
            
            while(count == 0) {
                if(i - j < min) {
                    min = i - j;
                    head = j;
                }
                if(map[s1[j] - 'A'] == 0) {
                    count++;
                }
                map[s1[j] - 'A']++;
                j++;
            }
        }
        printString("head:" + head); 
        printString("min:" + min); 
        return min == (len1 + 1) ? "" : s.substring(head, head + min);
    }   

    private boolean findAllChars(int[] map) {
        for(int n : map) {
            if(n != 0) {
                return false;
            }
        }
        return true;
    }   

    public String minWindow_3(String s, String t) {
        
        int[] map = new int[256];
        int len1 = s.length();
        char[] s1 = s.toCharArray();
        int len2 = t.length();
        char[] t1 = t.toCharArray();
        for(int i = 0; i < len2; i++) {
            map[t1[i] - 'A']++;
        }
        int min = len1 + 1;
        int i = 0;
        int j = 0;
        int head = 0;
        int count = len2;
        while(i < len1) {
            if(map[s1[i++] - 'A']-- >= 1) {
                count--;
            }
            // map[s1[i] - 'A']--;
            // i++;
            
            while(count == 0) {
                if(i - j < min) {
                    min = i - j;
                    head = j;
                }
                if(map[s1[j++] - 'A'] ++== 0) {
                    count++;
                }
                // map[s1[j] - 'A']++;
                // j++;
            }
        }
        
        return min == (len1 + 1) ? "" : s.substring(head, head + min);        
    }

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

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
		LC76 obj = new LC76();
		System.out.println(obj.minWindow_2("a", "a"));
        System.out.println(obj.minWindow_2("ADOBECODEBANC", "ABC"));
        System.out.println(obj.minWindow_2("a", "b"));
        System.out.println(obj.minWindow_2("aa", "aa"));
	}

}
