import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;


// class ListNode {
//     int val;
//     ListNode next;
//     ListNode(int x) {
//         val = x;
//         next = null;
//     }
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


// 245. Subtree 
public class Solution1 {

    private final String[] LESS_THAN_20 = {"", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"};
    private final String[] TENS = {"", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"};
    private final String[] THOUSANDS = {"", "Thousand", "Million", "Billion"};    

    public String numberToWords_1(int num) {
        if(num == 0) {
            return "Zero";
        }
        StringBuilder sb1 = new StringBuilder();  

        if(num / 1000000000 > 0) {
            int temp1 = num / 1000000000;            
            if(temp1 / 100 > 0) {
                sb1.append(LESS_THAN_20[temp1 / 100] + " Hundred ");
            }
            temp1 = temp1 % 100;
            if(temp1 / 10 >= 0 && temp1 / 10 < 2) {

                if(temp1 == 0) {

                } else {
                    sb1.append(LESS_THAN_20[temp1 % 100] + " ");
                }

            } else {
                sb1.append(TENS[temp1 / 10] + " ");
                temp1 = temp1 % 10;
                if(temp1 > 0) {
                    sb1.append(LESS_THAN_20[temp1 % 10] + " ");
                }                
            }
            sb1.append(THOUSANDS[3] + " ");            
        }
        num = num % 1000000000;
        if(num / 1000000 > 0) {
            int temp1 = num / 1000000;            
            if(temp1 / 100 > 0) {
                sb1.append(LESS_THAN_20[temp1 / 100] + " Hundred ");
            }
            temp1 = temp1 % 100;
            if(temp1 / 10 >= 0 && temp1 / 10 < 2) {
                if(temp1 == 0) {

                } else {
                    sb1.append(LESS_THAN_20[temp1 % 100] + " ");
                }
            } else {
                sb1.append(TENS[temp1 / 10] + " ");
                temp1 = temp1 % 10;
                if(temp1 > 0) {
                    sb1.append(LESS_THAN_20[temp1 % 10] + " ");
                }                
            }
            sb1.append(THOUSANDS[2] + " ");   
        }
        num = num % 1000000;
        if(num / 1000 > 0) {
            int temp1 = num / 1000;                       
            if(temp1 / 100 > 0) {
                sb1.append(LESS_THAN_20[temp1 / 100] + " Hundred ");
            }
            temp1 = temp1 % 100;
            if(temp1 / 10 >= 0 && temp1 / 10 < 2) {
                if(temp1 == 0) {
                    // sb1.append(LESS_THAN_20[temp1 % 100]);
                } else {
                    sb1.append(LESS_THAN_20[temp1 % 100] + " ");    
                }                
            } else {
                sb1.append(TENS[temp1 / 10] + " ");
                temp1 = temp1 % 10;
                if(temp1 > 0) {
                    sb1.append(LESS_THAN_20[temp1 % 10] + " ");
                }                
            }
            sb1.append(THOUSANDS[1] + " ");   
        }    

       num = num % 1000;
        if(num > 0) {        
            if(num / 100 > 0) {
                sb1.append(LESS_THAN_20[num / 100] + " Hundred ");
            }
            num = num % 100;
            if(num / 10 >= 0 && num / 10 < 2) {
                sb1.append(LESS_THAN_20[num % 100] + " ");
            } else {
                sb1.append(TENS[num / 10] + " ");
                num = num % 10;
                if(num > 0) {
                    sb1.append(LESS_THAN_20[num % 10] + " ");
                }                
            }
            sb1.append(THOUSANDS[0]);   
        }   

        return sb1.toString();       
    }    
    
    public String numberToWords(int num) {
        if(num == 0) {
            return "Zero";
        }

        StringBuilder sb1 = new StringBuilder();  
        int i = 3;
        int limit = 1000000000;

        while (num / limit == 0) {
            limit = limit / 1000;
            i--;
        }
        
        while(num / limit >= 0 && i >= 0) {
            int temp1 = num / limit;
            if(temp1 / 100 > 0) {
                sb1.append(LESS_THAN_20[temp1 / 100] + " Hundred ");
            }
            temp1 = temp1 % 100;
            if(temp1 / 10 >= 0 && temp1 / 10 < 2) {
                if(temp1 == 0) {
                    
                } else {
                    sb1.append(LESS_THAN_20[temp1 % 100] + " ");    
                }
                
            } else {
                sb1.append(TENS[temp1 / 10] + " ");
                temp1 = temp1 % 10;
                if(temp1 > 0) {
                    sb1.append(LESS_THAN_20[temp1 % 10] + " ");
                }
            }
            sb1.append(THOUSANDS[i--] + " ");
            num = num % limit;
            limit = limit / 1000;  
            printString("num:" + num);            
            printString("limit:" + limit);                                 
            while(num / limit == 0)  {                
                limit = limit / 1000;                
            } 
                                 
            printString("sb1:" + sb1.toString());                          
        }                                      
        return sb1.toString().trim();
    }

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

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


	public static void main(String[] args) {
		Solution1 obj = new Solution1();
        // System.out.println(obj.numberToWords(100000000));        
        // System.out.println(obj.numberToWords(100000));
        // System.out.println(obj.numberToWords(10000));
        // System.out.println(obj.numberToWords(1000));
        System.out.println(obj.numberToWords_1(1000010));
        System.out.println(obj.numberToWords(1000010));
	}

}
