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

class Interval {
    int start;
    int end;
    Interval() { start = 0; end = 0; }
    Interval(int s, int e) { start = s; end = e; }
}

// 245. Subtree 
public class LC218 {

    public List<int[]> getSkyline(int[][] buildings) {
        List<int[]> result = new ArrayList<>();
        List<int[]> height = new ArrayList<>();
        for(int[] b:buildings) {
            height.add(new int[]{b[0], -b[2]});
            height.add(new int[]{b[1], b[2]});
        }
        /// sort height array with left position or height.
        // Collections.sort(height, (a, b) -> {
        //     if(a[0] != b[0]) 
        //         return a[0] - b[0];
        //     return a[1] - b[1];
        // });
        Collections.sort(height, (a, b) -> {
            if(a[0] != b[0]) 
                return a[0] - b[0];
            return a[1] - b[1];
        });    
        /// Queue<Integer> pq = new PriorityQueue<>((a, b) -> (b - a));
        /// queue is sorted with max height.
        Queue<Integer> pq = new PriorityQueue<Integer>(height.size(), new Comparator<Integer>(){
            public int compare(Integer a, Integer b) {
                return b - a;
            }
        });
        printList(height);
        printLine();
        pq.offer(0);
        int prev = 0;
        for(int[] h:height) {
            printString("h[0]:" + h[0] + ", h[1]:" + h[1]);
            printQueue(pq);
            if(h[1] < 0) {/// left pos
                pq.offer(-h[1]);
            } else { /// right pos
                pq.remove(h[1]);
            }
            printQueue(pq);
            
            int cur = pq.peek();
            printString("cur:" + cur + ", prev:" + prev);
            if(prev != cur) {
                printString("result:h[0]:" + h[0] + ", cur:" + cur);
                result.add(new int[]{h[0], cur});
                prev = cur;
            }
            printLine();
        }
        return result;
    }

    private void printList(List<int[]> list) {
        for(int[] s: list) {
            printStringWithoutNewLine("{0:" + s[0] + ", 1:" + s[1] + "}");
        }
        printString("");
    }


    private void printQueue(Queue<Integer> list) {
        for(Integer s: list) {
            printStringWithoutNewLine(s + ", ");
        }
        printStringWithoutNewLine("\n");
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
		LC218 obj = new LC218();
        /// int[][] buildings = new int[][]{{2, 9, 10}, {3, 7, 15}, {5, 12, 12}, {15, 20, 10}, {19, 24, 8}};
        int[][] buildings = new int[][]{{19, 24, 8}, {15, 20, 10}, {5, 12, 12}, {2, 9, 10}, {3, 7, 15}};
        List<int[]> res = obj.getSkyline(buildings);
        for(int[] list: res) {
            obj.printStringWithoutNewLine("{" + list[0] + ", " + list[1] + "}, ");
        }
        obj.printStringWithoutNewLine("\n");
	}

}
