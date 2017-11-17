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

//
// private void printMap(Map<String, List<String>> map) {
//     for(String key:map.keySet()) {
//         List<String> list = map.get(key);
//         printStringWithoutNewLine("key:" + key + ":{");
//         for(String word: list) {
//             printStringWithoutNewLine(word + ",");    
//         }
//         printStringWithoutNewLine("}\n");
//     }
// }  
//
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

public class Solution1 {

public List<List<String>> findLadders(String beginWord, String endWord, List<String> wordList) {
        if(wordList.size() == 0) {
            return new ArrayList<List<String>>();
        }
        
        Set<String> wordSet = new HashSet<String>();
        for(String word : wordList) {
            wordSet.add(word);
        }
       if(wordSet.contains(endWord) == false) {
            return new ArrayList<List<String>>();
        }
        
        if(wordSet.contains(beginWord) == true) {
            wordSet.remove(beginWord);
        }
        if(wordSet.contains(endWord) == true) {
            wordSet.remove(endWord);
        }        
        // printSet(wordSet);

        Map<String, Integer> steps = new HashMap<String, Integer>();
        steps.put(beginWord, 1);
        Map<String, List<String>> graph = new HashMap<String, List<String>>();
        List<List<String>> res = new ArrayList<List<String>>();
        Queue<String> queue = new LinkedList<String>();
        boolean found = false;
        int step = 0;
        queue.offer(beginWord);
        
        while(!queue.isEmpty() && !found) {  
            step++;printString("152:queue.size =" + queue.size());
            int size = queue.size();
            for(int i = 0; i < size; i++) {
                String word = queue.poll();
                printString("156:word=" + word);
                char[] chars = word.toCharArray();
                for(int j = 0; j < word.length(); j++) {                
                    char oldc = chars[j];
                    for(char c = 'a'; c <= 'z'; c++) {
                        if(oldc != c) {
                            chars[j] = c;
                            String newWord = new String(chars);                            
                            if(newWord.equals(endWord)) {
                                printString("line 165 newWord:" + newWord);
                                if(graph.containsKey(word) == true) {
                                    
                                    graph.get(word).add(newWord);
                                } else {
                                    List<String> list = new ArrayList<String>();
                                    list.add(newWord);
                                    graph.put(word, list);
                                }
                                found = true;
                            } else {
                                // handle 
                                if(steps.containsKey(newWord) == true && step < steps.get(newWord)) {
                                    printString("line 177 newWord:" + newWord);
                                    if(graph.containsKey(word) == true) {
                                        graph.get(word).add(newWord);
                                    } 
                                    else {
                                        List<String> list = new ArrayList<String>();
                                        list.add(newWord);
                                        graph.put(word, list);
                                    }
                                }
                            }
                            if(wordSet.contains(newWord) == true) {
                                printString("line 189 newWord=" + newWord);
                                printStringWithoutNewLine("line 190 wordSet {");
                                wordSet.remove(newWord); 
                                printSet(wordSet);                            
                                printStringWithoutNewLine("}\n");                                
                                queue.offer(newWord);
                                printStringWithoutNewLine("line 195 queue {");                                                
                                printQueue(queue);
                                printStringWithoutNewLine("}\n");
                                steps.put(newWord, steps.get(word) + 1); 
                                
                                if(graph.containsKey(word) == true) {
                                    graph.get(word).add(newWord);
                                } else {
                                    List<String> list = new ArrayList<String>();
                                    list.add(newWord);
                                    graph.put(word, list);
                                }                                
                            } 
                        }
                    }
                    chars[j] = oldc;
                }                               
                printStringWithoutNewLine("graph 211:\n");
                printMap(graph);
                printStringWithoutNewLine("213:\n");
                printLine(); 
                printStringWithoutNewLine("steps 219:\n");   
                printSteps(steps);
                printStringWithoutNewLine("221.\n");
            }
        }

        if(found == true) {
            List<String> current = new ArrayList<String>();
            current.add(beginWord);
            getPath(res, graph, beginWord, endWord, current);
        } 
        
        return res;
    }

    private void getPath(List<List<String>> res, Map<String, List<String>>graph, String beginWord, String endWord, List<String> current) {
        if(beginWord.equals(endWord) == true) {
            res.add(new ArrayList<String>(current));
            return;
        }
        if(graph.containsKey(beginWord) == false) {
            return;
        }  
        for(String word: graph.get(beginWord)) {    
            current.add(word);
            getPath(res, graph, word, endWord, current);
            current.remove(current.size() - 1);
        }
    }    

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

    private void printLine() {
    	System.out.println("---------------------"); 
	}

    private void printQueue(Queue<String> queue) {
        for(String s: queue) {
            printStringWithoutNewLine(s + ",");
        }
    }

    private void printString(String arg) {
        System.out.println(arg); 
    }    

    private void printSet(Set<String> set) {
        for(String word: set) {
            printStringWithoutNewLine("" + word + ",");
        }
    }

    private void printStringWithoutNewLine(String arg) {
        System.out.print(arg); 
    } 

    private void printSteps(Map<String, Integer> map) {
        printStringWithoutNewLine("line 276 steps:[\n");
        for(String key:map.keySet()) {
            printStringWithoutNewLine("[" + key + "," + map.get(key) + "], "); 
        }
        printStringWithoutNewLine("\n]\n");        
    }

    private void printMap(Map<String, List<String>> map) {
        printStringWithoutNewLine("[\n");
        for(String key:map.keySet()) {
            List<String> list = map.get(key);
            printStringWithoutNewLine(key + ":{");
            for(String word: list) {
                printStringWithoutNewLine(word + ",");    
            }
            printStringWithoutNewLine("}\n");
        }
        printStringWithoutNewLine("]\n");
    }  

    private void printListOfList(List<List<String>> listOflist) {
        for(List<String> list: listOflist){
            for(String n : list) {
                System.out.print(n + ", ");
            }
            System.out.println();
        }
    }    

	public static void main(String[] args) {
		Solution1 obj = new Solution1();
		// String[] wordArray = new String[]{"hot","dot","dog","lot","log","cog"};
		// List<String> wordList = Arrays.asList(wordArray);
  //       List<List<String>> res = obj.findLadders("hit", "cog", wordList);
  //       obj.printListOfList(res);


        // String[] wordArray2 = new String[]{"ted", "tex", "red", "tax", "tad", "den", "rex", "pee"};
        // List<String> wordList2 = Arrays.asList(wordArray2);
        // List<List<String>> res2 = obj.findLadders("red", "tax", wordList2);
        // obj.printListOfList(res2);

        // String[] wordArray3 = new String[]{"a", "b", "c"};
        // List<String> wordList3 = Arrays.asList(wordArray3);
        // List<List<String>> res3 = obj.findLadders("a", "c", wordList3);
        // obj.printListOfList(res3);


        // String[] wordArray4 = new String[]{"hot","cog","dog","tot","hog","hop","pot","dot"};
        // List<String> wordList4 = Arrays.asList(wordArray4);
        // List<List<String>> res4 = obj.findLadders("hot", "dog", wordList4);
        // obj.printListOfList(res4);        

        String[] wordArray5 = new String[]{"hot","dot","dog","lot","log"};
        List<String> wordList5 = Arrays.asList(wordArray5);
        List<List<String>> res5 = obj.findLadders("hit", "cog", wordList5);
        obj.printListOfList(res5);          
	}

}
