import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.Stack;

public class LC71 {

    public String simplifyPath(String path) {
        if(path == null || path.length() == 0) return "";

        Set<String> skip = new HashSet<>(Arrays.asList(".", "..", ""));
        Stack<String> stack = new Stack<>();
        for (String dir : path.split("/")) {
            if(dir.equals("..") && !stack.isEmpty()) {
                stack.pop();
            } else if (skip.contains(dir) == false){
                stack.push(dir);
            }
        }

        StringBuilder sb = new StringBuilder();
        for(String dir: stack) {
            sb.append("/" + dir);
        }
        return (sb == null || sb.toString().equals("") == true) ? "/" : sb.toString();
    }

    public static void main(String[] args) {
        LC71 obj = new LC71();
        String path = "/a/./b/../../c/";
        PrintUtils.printString("res: " + obj.simplifyPath(path));
    }
}
