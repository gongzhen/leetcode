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

public class LC301 {

    public List<String> removeInvalidParentheses_3(String s) {
        int left = 0;
        int right = 0;
        List<String> res = new ArrayList<String>();
        for(char c : s.toCharArray()) {
            left += (c == '(') ? 1 : 0;
            if(left == 0) {
                right += (c == ')') ? 1 : 0;
            } else {
                left -= (c == ')') ? 1 : 0;
            }
        }
        
        dfs(s, 0, left, right, res);
        return res;        
    }
    
    private void dfs(String s, int po, int left, int right, List<String> res) {
        if(left == 0 && right == 0) {
            if(isValid(s) == true) {
                res.add(s);
            }
            return;
        }
        
        for(int i = po; i < s.length(); i++) {
            if(i != 0 && s.charAt(i) == s.charAt(i - 1)) {
                continue; /// i -1 is choosed and just skip it.
            }
            
            if(s.charAt(i) == '(' || s.charAt(i) == ')' ) {
                String subStr = s.substring(0, i) + s.substring(i + 1, s.length());
                if(right > 0) {                    
                    dfs(subStr, i, left, right - 1, res);
                } else if (left > 0) {
                    dfs(subStr, i, left - 1, right, res);
                }
            }
        }
    }
    
    private boolean isValid(String s) {
        int count = 0;
        int i = 0;
        
        while(i < s.length()) {
            if(s.charAt(i) == '(') {
                count++;
            } else if (s.charAt(i) == ')') {
                count--;
            }
            if(count < 0) {
                return false;
            }
        }
        return true;
    }    

////////////////////////////////////////////////////////////////////////////////////////////////

    public List<String> removeInvalidParentheses_1(String s) {
        List<String> res = new ArrayList<String>();
        Set<String> set = new HashSet<String>();
        if(s.length() == 0 || (s.length() == 1 && s.equals("("))) {
            res.add("");
            return res;
        }
        String subStr = "";
        for(int i = 0; i < s.length(); i++) {
            subStr = s.substring(0, i) + s.substring(i + 1, s.length());
            if(validString(subStr) == true) {                
                set.add(subStr);
            }
        }
        for(String e: set) {
            res.add(e);
        }
        return res;
    }

    private boolean validString(String s) {
        Stack<Character> stack = new Stack<Character>();
        for(int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if(c== '(') {
                stack.push(c);
            } else if(c == ')') {
                if(stack.isEmpty() != true && stack.peek() == '(') {
                    stack.pop();
                } else {
                    return false;
                }
            }
        }
        return true;
    }   

////////////////////////////////////////////////////////////////////////////////////////////////
    
    public List<String> removeInvalidParentheses_2(String s) {
        List<String> ans = new ArrayList<>();
        remove(s, ans, 0, 0, new char[]{'(', ')'});
        return ans;
    }

    public void remove(String s, List<String> ans, int last_i, int last_j,  char[] par) {
        for (int stack = 0, i = last_i; i < s.length(); ++i) {
            if (s.charAt(i) == par[0]) stack++;
            if (s.charAt(i) == par[1]) stack--;
            printString("192  " + stack);
            if (stack >= 0) {
                continue;
            }
            for (int j = last_j; j <= i; ++j) {
                if (s.charAt(j) == par[1] && (j == last_j || s.charAt(j - 1) != par[1])) {
                    String str = (s.substring(0, j) + s.substring(j + 1, s.length()));
                    printString("199  " + str);
                    remove(str, ans, i, j, par);
                }
            }
            return;
        }

        printString("206 " + s); // stack>= 0
        String reversed = new StringBuilder(s).reverse().toString();
        if (par[0] == '(') // finished left to right {
        {
            printString("210 " + reversed);
            remove(reversed, ans, 0, 0, new char[]{')', '('});
        } 
        else // finished right to left { 
        { 
            printString("215 " + reversed);
            ans.add(reversed);
        }
    }

    public List<String> removeInvalidParentheses(String s) {
        int rmL = 0, rmR = 0;
        for(int i=0;i<s.length();i++){
           if(s.charAt(i)=='('){
               rmL++;
           }else if(s.charAt(i)==')'){
               if(rmL>0){
                   rmL--;
               }else{
                   rmR++;
               }
           }
        }
        printString("rmL:" + rmL);
        printString("rmR:" + rmR);
        Set<String> res = new HashSet<String>();
        dfs(s, 0, res, new StringBuilder(), rmL, rmR, 0);
        return new ArrayList<String>(res);
    }

    public void dfs(String s, int i, Set<String> res, StringBuilder sb, int rmL, int rmR, int open) {
        int len = sb.length();//decision point
        if(open<0||rmL<0||rmR<0) {
            return;//rmL rmR limit the max removal boundary,
            //else will return all possibilities["","()()","()","(())","()()()","(())()"]
        } 
                                        
        if(i==s.length()){
            printString("248 iiiii == " + i + " ,sbsbsbsbsbsb: " + sb.toString());
            if(open==0){
                res.add(sb.toString());//back tracking till the full length
            }
            return;
        }else{
             //we don't need for loop since no ordering(not like subsets,permu problem)
            char c = s.charAt(i);
            if(c == '('){ 
            //order matters here, once append c to sb, sb contains c when backtracking
                printString("256 :" + c + " ,rmL-1: " + (rmL-1));
                dfs(s,i+1,res,sb,rmL-1,rmR,open); //remove '('
                printString("256 :" + c + " ,open+1: " + (open+1));
                dfs(s,i+1,res,sb.append('('),rmL,rmR,open+1); //use '('   
            }else if(c==')'){
                printString("260 :" + c + " ,rmR-1: " + (rmR-1));
                dfs(s,i+1,res,sb,rmL,rmR-1,open); //remove ')'
                printString("260 :" + c + " ,open-1: " + (open-1));
                dfs(s,i+1,res,sb.append(')'),rmL,rmR,open-1); //use ')'   
            }else{
                dfs(s,i+1,res,sb.append(c),rmL,rmR,open);// append non '(',')' char    
            }
        }
        printString("271 sbsbsbsbsbsbsb:" + sb.toString() );
        sb.setLength(len);//reset back to decision point -- remove last char of sb
        printString("273 sbsbsbsbsbsbsb:" + sb.toString());
    }    

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

    private void printLine() {
        System.out.println("---------------------"); 
	}

    private void printString(String arg) {
        System.out.println(arg); 
    }    

	private void printList(int[] list) {
		for(int i = 0; i < list.length; i ++ ){
			printStringWithoutNewLine(list[i] + ", ");
		}
        printString("");
	}    
    
    private void printStringWithoutNewLine(String arg) {
        System.out.print(arg); 
    }     

	public static void main(String[] args) {
		LC301 obj = new LC301();
		// System.out.println(obj.removeInvalidParentheses("())"));
        // System.out.println(obj.removeInvalidParentheses("(a)())()"));
        // System.out.println(obj.removeInvalidParentheses_3("())"));
        PriorityQueue<Integer> pq = new PriorityQueue<Integer>();
        pq.offer(30);
        pq.offer(10);
        pq.offer(20);

        while(!pq.isEmpty()){
            System.out.println(pq.poll());
        }


	}

}
