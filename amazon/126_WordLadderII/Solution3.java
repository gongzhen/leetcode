import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;


public class Solution3 {

    public List<List<String>> findLadders(String beginWord, String endWord, List<String> wordList) {
        List<List<String>> result = new ArrayList<>();  
        if(beginWord == null || endWord == null || beginWord.length()!=endWord.length()) return result;  
        Set<String> dict = new HashSet<String>();
        for(String word: wordList) {
            dict.add(word);
        }
        int minLen = Integer.MAX_VALUE; // shortest transform sequence length  
        Map<String, Set<String>> visited = new HashMap<>(); // <nextword, previous_words>  
        Map<String, Integer> level = new HashMap<>(); // <nextword, level>  
        Queue<String> queue = new LinkedList<>(); // BFS next word queue  
      
        visited.put(beginWord, new HashSet<>()); // start word has no previous words  
        level.put(beginWord, 1);  
        queue.offer(beginWord);  
      
        while (!queue.isEmpty()) {  
            String word = queue.poll();  
            int preLevel = level.get(word);  
            if (preLevel >= minLen) continue;  
            char[] chars = word.toCharArray();  
            for (int i = 0; i < word.length(); i++) {  
                char old = chars[i];                  
                for (char letter = 'a'; letter <= 'z'; letter++) {  
                    if(letter == old) continue;  
                    chars[i] = letter;  
                    String nextWord = new String(chars);  
                  
                    if(!dict.contains(nextWord)) continue;                      
                    printString("line 38 nextWord " + nextWord + "\n");                      
                    // if level doesn't contain next word  
                    if(!level.containsKey(nextWord)) {  
                        Set<String> preWords = new HashSet<>();  
                        preWords.add(word);  
                        visited.put(nextWord, preWords);  
                        level.put(nextWord, preLevel + 1);  
                        queue.add(nextWord);  

                    // if level contains next word and near the start  
                    } else if(level.get(nextWord) > preLevel) {   
                        visited.get(nextWord).add(word);  
                    }  

                    if (nextWord.equals(endWord)) {  
                        minLen = preLevel + 1;  
                    }  
                }  
                chars[i] = old;  
            }  
        }  
        printMap(visited);
        buildPaths(endWord, visited, new LinkedList<>(), result);  
        return result;    
    }
    
    private void buildPaths(String end, Map<String, Set<String>> visited, List<String> path, List<List<String>> paths) {    
        path.add(0, end);  
        Set<String> preWords = visited.get(end);  
        if(preWords == null) return; // can't transform from start to end  
        if (preWords.size() == 0) { // reached start word  
            paths.add(new ArrayList<String>(path));  
        } else {    
            for (String pre : preWords) {  
                buildPaths(pre, visited, path, paths);    
            }    
        }    
        path.remove(0);    
    }  

    private void printMap(Map<String, Set<String>> visited) {
        for(String key : visited.keySet()) {
            Set<String> set = visited.get(key);
            printString("key:" + key + " {");
            for(String word : set) {
                printString("" + word + ",");
            }
            printString("}");
            System.out.println(); 
        }
    }
  

    private void printString(String arg) {
        System.out.print(arg); 
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
        Solution3 obj = new Solution3();
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
        // Set<String> wordList4 = new HashSet<String>();
        // for(String word: wordArray4) {
        //     wordList4.add(word);
        // }
        // List<List<String>> res4 = obj.findLadders("hot", "dog", wordList4);
        // obj.printListOfList(res4);  

        String[] wordArray5 = new String[]{"hot","dot","dog","lot","log"};
        List<String> wordList5 = Arrays.asList(wordArray5);
        List<List<String>> res3 = obj.findLadders("hit", "cog", wordList5);
        obj.printListOfList(res3);
    }    

}



