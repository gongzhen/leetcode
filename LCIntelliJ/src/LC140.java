import java.util.*;

public class LC140 {

    public List<String> wordBreak(String s, List<String> wordDict) {
        List<String> result = new ArrayList<>();
        Map<String, List<String>> visited = new HashMap<>();
        Set<String> wordSet = new HashSet<>();
        for(String word: wordDict) {
            wordSet.add(word);
        }
        result = dfs(visited, wordSet, s);
        PrintUtils.printListString(result);
        return result;
    }

    private List<String> dfs(Map<String, List<String>> visited, Set<String> wordSet, String s) {
        if(visited.containsKey(s)) {
            return visited.get(s);
        }
        if(s.length() == 0) {
            return null;
        }

        List<String> res = new ArrayList<>();
        for(int i = 1; i <= s.length(); i++) {
            String substr = s.substring(0, i);
            if(wordSet.contains(substr)) {
                List<String> partRes = dfs(visited, wordSet, s.substring(i));
                if(partRes == null) {
                    res.add(substr);
                } else {
                    for(String w : partRes) {
                        res.add(substr + " " + w);
                    }
                }
            }
        }
        visited.put(s, res);
        return res;
    }

    public static void main(String[] args) {
        String[] wordArray = new String[]{"apple", "pen", "applepen", "pine", "pineapple"};
        List<String> wordDict = Arrays.asList(wordArray);

        LC140 obj = new LC140();
        obj.wordBreak("pineapplepenapple", wordDict);
    }
}
