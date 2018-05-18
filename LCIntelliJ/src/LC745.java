import java.util.HashMap;

public class LC745 {

    private static class WordFilter {
        HashMap<String, Integer> map = new HashMap<>();

        public WordFilter(String[] words) {
            for(int i = 0; i < words.length; i++){
                int n = words[i].length();
                String[] prefix = new String[n + 1];
                initArray(prefix);
                String[] suffix = new String[n + 1];
                initArray(suffix);
                for(int j = 0; j < n; j++) {
                    prefix[j + 1] = prefix[j] + words[i].charAt(j);
                    suffix[j + 1] = words[i].charAt(n - j - 1) + suffix[j];
                }

                for(String p : prefix) {
                    for(String s: suffix) {
                        map.put(p + "_" + s, i);
                    }
                }
                PrintUtils.printMapKeyStringValueInteger(map);
                PrintUtils.printString("--------------------------------------------" + map.keySet().size());
            }

        }

        public void initArray(String[] array) {
            for(int i = 0; i < array.length; i++) {
                array[i] = "";
            }
        }

        public int f(String prefix, String suffix) {
            return (map.containsKey(prefix + "#" + suffix))? map.get(prefix + "#" + suffix) : -1;
        }
    }

    public static void main(String[] args) {
        WordFilter obj = new WordFilter(new String[]{"apple", "alive"});
        obj.f("a", "e");
    }
}
