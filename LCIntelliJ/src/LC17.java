import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LC17 {

    public List<String> letterCombinations(String digits) {
        ArrayList<String> result = new ArrayList<String>();

        if (digits == null || digits.equals("")) {
            return result;
        }

        Map<Character, char[]> map = new HashMap<Character, char[]>();
        map.put('0', new char[] {});
        map.put('1', new char[] {});
        map.put('2', new char[] { 'a', 'b', 'c' });
        map.put('3', new char[] { 'd', 'e', 'f' });
        map.put('4', new char[] { 'g', 'h', 'i' });
        map.put('5', new char[] { 'j', 'k', 'l' });
        map.put('6', new char[] { 'm', 'n', 'o' });
        map.put('7', new char[] { 'p', 'q', 'r', 's' });
        map.put('8', new char[] { 't', 'u', 'v'});
        map.put('9', new char[] { 'w', 'x', 'y', 'z' });

        String sb = "";
        dfs(map, digits, sb, result,  0);

        return result;
    }

    private void dfs(Map<Character, char[]> map, String digits, String sb, ArrayList<String> result, int pos) {
        if(sb.length() == digits.length()) {
            result.add(sb);
            return;
        }

        char[] chars = map.get(digits.charAt(pos));
        for(char c : chars) {
            dfs(map, digits, sb + c, result, pos + 1);
        }

    }

    public static void main(String[] args) {
        LC17 obj = new LC17();
        obj.letterCombinations("23");
    }
}
