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

class Point {
    int x;
    int y;
    Point() { x = 0; y = 0; }
    Point(int s, int e) { x = s; y = e; }
}

// 245. Subtree 
public class LC999 {


/***
    607    private void siftUpUsingComparator(int k, E x) {
    608        while (k > 0) {
    609            int parent = (k - 1) >>> 1;
    610            Object e = queue[parent];
    611            if (comparator.compare(x, (E) e) >= 0)
    612                break;
    613            queue[k] = e;
    614            k = parent;
    615        }
    616        queue[k] = x;
    617    }
*/

    public List<Point> findKClosest(Point[] points, int k) {             
        PriorityQueue<Point> pq = new PriorityQueue<Point>(points.length, new Comparator<Point>(){
            /// a - b > 0 is min Heap
            /// b - a > 0 is max Heap
            public int compare(Point a, Point b) {   
                /// previous point b: new coming point: a
                if(b.x * b.x + b.y * b.y > a.x * a.x + a.y * a.y) {
                    printString("b.x:" + b.x + ", b.y:" + b.y + " > " + "a.x:" + a.x + ", a.y:" + a.y);
                	return 1;
                } else if (b.x * b.x + b.y * b.y == a.x * a.x + a.y * a.y) {
                    printString("b.x:" + b.x + ", b.y:" + b.y + " == " + "a.x:" + a.x + ", a.y:" + a.y);
                	return 0;
                } 
                printString("b.x:" + b.x + ", b.y:" + b.y + " < " + "a.x:" + a.x + ", a.y:" + a.y);
                return -1;
            }
        });

        
        for(int i = 0; i < points.length; i++) {
            if(i < k) {
                printString("line 146 points[i:" + i + "].x:" + points[i].x + ", points[i:" + i + "].y:" + points[i].y);
                pq.offer(points[i]);
            } else {
                Point top = pq.peek();
                if((points[i].x * points[i].x + points[i].y * points[i].y) < (top.x * top.x + top.y * top.y)) {
                    printString("line 151 points[i:" + i + "].x:" + points[i].x + ", points[i:" + i + "].y:" + points[i].y + ",top.x:" + top.x + " ,top.y:" + top.y);
                	pq.poll();
                	pq.offer(points[i]);
                }
            }
        }

        List<Point> res = new ArrayList<Point>();
        while(!pq.isEmpty()) {
            Point p = pq.peek();
            printString("line 161 p.x:" + p.x + ", p.y:" + p.y);
        	res.add(pq.poll());
        }
        for(Point p : res) {
            printString("line 165 p.x:" + p.x + ", p.y:" + p.y);
        }
        return res;
    }


    private void printMap(Map<Integer, Integer> map) {
        for(Integer key:map.keySet()) {
            Integer value = map.get(key);
            printString("key:" + key + ",value:" + value);
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


	public static void main(String[] args) {
		LC999 obj = new LC999();
        Point p1 = new Point(1, 3);
		Point p2 = new Point(4, 3);        
		Point p3 = new Point(2, 5);        		
		Point p4 = new Point(2, 3);        		
		Point p5 = new Point(3, 2);
		Point p6 = new Point(3, 8);
		Point[] list = new Point[]{p1, p2, p3, p4, p5, p6};
		obj.findKClosest(list, 3);
	}

}
