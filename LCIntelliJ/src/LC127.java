import java.util.*;

public class LC127 {

    public int ladderLength(String beginWord, String endWord, List<String> wordList) {
        Set<String> wordSet = new HashSet<>(wordList);
        Queue<String> pq = new LinkedList<>();

        Set<String> hashSet = new HashSet<>();
        pq.offer(beginWord);

        int count = 1;

        while(!pq.isEmpty()) {
            int size = pq.size();
            count++;
            for(int i = 0; i < size; i++) {
                String top = pq.poll();
                for(int j = 0; j < top.length(); j++) {
                    char[] array = top.toCharArray();
                    for(char c = 'a'; c <= 'z'; c++) {
                        if (array[j] != c) {
                            char temp = array[j];
                            array[j] = c;
                            String newWord = new String(array);
                            if (wordSet.contains(newWord) == true) {
                                if (!hashSet.contains(newWord)) {
                                    if (newWord.equals(endWord) == true) {
                                        return count;
                                    } else {
                                        hashSet.add(newWord);
                                        pq.offer(newWord);
                                    }
                                }
                            }
                            array[j] = temp;
                        }
                    }
                }
            }
        }
        return 0;
    }

    public static void main(String[] args) {
        LC127 obj = new LC127();
        String[] array = new String[]{"hot","dot","dog","lot","log","cog"};
        List<String> wordList = new ArrayList<>(Arrays.asList(array));
        int res = obj.ladderLength("hit", "cog", wordList);
        PrintUtils.printString("res:" + res);
    }
}
