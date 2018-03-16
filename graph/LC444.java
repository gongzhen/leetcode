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

public class LC444 {

    public boolean sequenceReconstruction(int[] org, List<List<Integer>> seqs) {
       	if(org.length == 0) {
       		return false;
       	}

       	Map<Integer, Set<Integer>> map = new HashMap<Integer, Set<Integer>>();
       	Map<Integer, Integer> indegree = new HashMap<Integer, Integer>();

       	for(int n : org) {
       		map.put(n, new HashSet<Integer>());
       		indegree.put(n, 0);
       	}

       	int len = org.length;
       	int count = 0;
       	for(List<Integer> seq: seqs) {
       		count += seq.size();
       		/// handle if element is larger than org.length.
       		if(seq.size() >= 1 && (seq.get(0) <= 0 || seq.get(0) > org.length)) {
       			return false;
       		} 
       		for(int i = 1; i < seq.size(); i++) {
       			int a = seq.get(i - 1);
       			int b = seq.get(i);
       			if(b <= 0 || b > org.length) {
       				return false;
       			}
       			if(map.get(a).add(b)) {
       				indegree.put(b, indegree.get(b) + 1);
       			}
       		}
       	}
       	printMap(map);
       	if(count < org.length) {
       		return false;
       	}

       	Queue<Integer> pq = new LinkedList<Integer>();
       	for(int key: indegree.keySet()) {
       		if(indegree.get(key) == 0) {
       			pq.offer(key);
       		}
       	}

       	int cnt = 0;
       	while(pq.size() == 1) {
       		int ele = pq.poll();
       		for(int next : map.get(ele)) {
       			indegree.put(next, indegree.get(next) - 1);
       			if(indegree.get(next) == 0) {
       				pq.add(next);
       			}
       		}
   			if(ele != org[cnt]) {
   				return false;
   			}       		
   			cnt++;
       	}
       	return cnt == org.length;
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

	private void printStringWithoutNewLine(String arg) {
		System.out.print(arg + ","); 
	} 

	private void printMap(Map<Integer, Set<Integer>> map) {
	    for(Integer num : map.keySet()) {
	        Set<Integer> set = map.get(num);
	        printString("num:" + num);
	        for(int n : set) {
	        	printStringWithoutNewLine("" + n + ", ");
	        }
	        printStringWithoutNewLine("\n");
	    }
	}	   

	public static void main(String[] args) {
		LC444 obj = new LC444();
		// int[] org = new int[]{5, 4, 3, 2, 1};
		// List<List<Integer>> seqs = new ArrayList<List<Integer>>();
		// List<Integer> list1 = new ArrayList<Integer>(Arrays.asList(5, 3, 2, 4));
		// List<Integer> list2 = Arrays.asList(4, 1);
		// List<Integer> list3 = Arrays.asList(1);
		// List<Integer> list4 = Arrays.asList(3);
		// List<Integer> list5 = Arrays.asList(2, 4);
		// List<Integer> list6 = Arrays.asList(10000000);
		// seqs.add(list1);
		// seqs.add(list2);
		// seqs.add(list3);
		// seqs.add(list4);
		// seqs.add(list5);
		// seqs.add(list6);
		// obj.sequenceReconstruction(org, seqs);

		// int[] org = new int[]{5, 3, 2, 4, 1};
		// List<List<Integer>> seqs = new ArrayList<List<Integer>>();
		// List<Integer> list1 = new ArrayList<Integer>(Arrays.asList(5, 3, 2, 4));
		// List<Integer> list2 = Arrays.asList(4, 1);
		// List<Integer> list3 = Arrays.asList(1);
		// List<Integer> list4 = Arrays.asList(3);
		// List<Integer> list5 = Arrays.asList(2, 4);
		// List<Integer> list6 = Arrays.asList(1, 10000000);
		// seqs.add(list1);
		// seqs.add(list2);
		// seqs.add(list3);
		// seqs.add(list4);
		// seqs.add(list5);
		// seqs.add(list6);
		// obj.sequenceReconstruction(org, seqs);		

		int[] org = new int[]{1, 2, 3};
		List<List<Integer>> seqs = new ArrayList<List<Integer>>();
		List<Integer> list1 = new ArrayList<Integer>(Arrays.asList(1, 2));
		List<Integer> list2 = Arrays.asList(2, 3);
		List<Integer> list3 = Arrays.asList(1, 3);
		seqs.add(list1);
		seqs.add(list2);
		seqs.add(list3);
		obj.sequenceReconstruction(org, seqs);			
	}

}
