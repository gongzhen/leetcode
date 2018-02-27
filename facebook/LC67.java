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
public class LC67 {
  
    public String addBinary(String a, String b) {
        int len1 = a.length();
        int len2 = b.length();
        
        int i = len1 - 1, j = len2 - 1;
        StringBuilder sb = new StringBuilder();
        int carry = 0;
        while(i >= 0 && j >= 0) {
            int n1 = a.charAt(i--) - '0';
            int n2 = b.charAt(j--) - '0';
            int r = (n1 + n2 + carry) % 2;
            carry = (n1 + n2 + carry) / 2;
            sb.append(r);
        }
        
        if(i == j) {
            
        } else if( i >= j) {
            for(; i>= 0; i--) {
                int n1 = a.charAt(i) - '0';
                int r = (n1 + carry) % 2;
                carry = (n1 + carry) / 2;
                sb.append(r);
            }
        } else if (j >= i) {
            for(; j>= 0; j--) {
                int n1 = b.charAt(j) - '0';
                int r = (n1 + carry) % 2;
                carry = (n1 + carry) / 2;
                sb.append(r);
            }       
        }
        
        if(carry == 1) {
            sb.append(1);
        }        
        
        return sb.reverse().toString();
    }  

    public String addBinary_1(String a, String b) {
        if(a == null || a.length() == 0) {
            return b;
        }
        if(b == null || b.length() == 0) {
            return a;
        }        
        
        char[] a1 = reverse(a);
        char[] b1 = reverse(b);
        
        int i = 0;
        int j = 0;
        StringBuilder sb = new StringBuilder();
        int carry = 0;
        int sum = 0;
        while(i < a1.length && j < b1.length) {
            sum = (a1[i] - '0') + (b1[i] - '0') + carry;
            sb.append(sum % 2);
            carry = sum / 2;
            i++;
            j++;            
        }
        
        if(i == a1.length && j == b1.length && carry != 0) {
            sb.append(carry);
        } else if (i < a1.length) {
            while(i < a1.length) {
                sum = a1[i] - '0' + carry;
                sb.append(sum % 2);
                carry = sum / 2;
                i++;
            }
            if(i == a1.length && carry != 0) {
                sb.append(carry);
            }
        } else if (j < b1.length) {
            while(j < b1.length) {
                sum = b1[j] - '0' + carry;
                sb.append(sum % 2);
                carry = sum / 2;
                j++;
            }
            if(j == b1.length && carry != 0) {
                sb.append(carry);
            }            
        }
        return sb.reverse().toString();
    }
    
    public char[] reverse(String s) {
        if(s.length() == 0) {
            return new char[0];
        }
        char[] array = s.toCharArray();
        int i = 0;
        int j = array.length - 1;
        while(i < j) {
            char temp = array[i];
            array[i] = array[j];
            array[j] = temp;
            i++;
            j--;
        }
        return array;
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


	public static void main(String[] args) {
		LC67 obj = new LC67();
        System.out.println(obj.addBinary_1("1", "11"));
	}

}
