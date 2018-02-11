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

class Interval {
    int start;
    int end;
    Interval() { start = 0; end = 0; }
    Interval(int s, int e) { start = s; end = e; }
}

// 245. Subtree 
public class LC253 {

    public int minMeetingRooms_2(Interval[] intervals) {
        if(intervals.length == 0) {
            return 0;
        }
        
        Arrays.sort(intervals, new Comparator<Interval>(){
            public int compare(Interval a, Interval b) {
                return a.start - b.start;
            }
        });
        
        PriorityQueue<Interval> pq = new PriorityQueue<Interval>(intervals.length, new Comparator<Interval>(){
            public int compare(Interval a, Interval b) {
                return a.end - b.end;
            }
        });
        
        pq.offer(intervals[0]);
        
        for(int i = 1; i < intervals.length; i++) {
            Interval interval = pq.poll();
            if(interval.end <= intervals[i].start) {
                interval.end = intervals[i].end;                
            } else {
                pq.offer(intervals[i]);
            }
            pq.offer(interval);
        }
        return pq.size();
    }

    public int minMeetingRooms(Interval[] intervals) {
        int[] start = new int[intervals.length];
        int[] end = new int[intervals.length];
        for(int i = 0; i < intervals.length; i++) {
            start[i] = intervals[i].start;
            end[i] = intervals[i].end;
        }
        
        Arrays.sort(start);
        Arrays.sort(end);
        
        int rooms = 0, endPos = 0;
        for(int i = 0; i < intervals.length; i++) {
            if(start[i] < end[endPos]) {
                rooms++;
            } else {
                endPos++;
            }
        }
        
        return rooms;
    }


    public int minMeetingRooms_1(Interval[] intervals) {
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        for(Interval n : intervals) {
            if(!map.containsKey(n.start)) {
                map.put(n.start, 0);
            }
            int v = map.get(n.start);
            v++;
            map.put(n.start, v);
            printString("n.start:" + n.start + ",value:" + v);

            if(!map.containsKey(n.end)) {
                map.put(n.end, 0);
            } 
            v = map.get(n.end);            
            v--;
            map.put(n.end, v);
            printString("n.end:" + n.end + ",value:" + v);
        }

        printMap(map);
        printLine();
        
        int room = 0, res = 0;
        for(Integer n : map.keySet()) {
            // room += map.get(n);
            res = Math.max(res, room += map.get(n));
            printString("room:" + room);
            printString("res:" + res);                        
        }
        printString("res:" + res);
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
		LC253 obj = new LC253();
        Interval it1 = new Interval(9, 10);
        Interval it2 = new Interval(4, 9);
        Interval it3 = new Interval(9, 17);
        Interval[] list = new Interval[]{it1, it2, it3};
        obj.printString("obj.minMeetingRooms(list):" + obj.minMeetingRooms(list));
	}

}
