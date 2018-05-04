import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Stack;

public class LC636 {

    public int[] exclusiveTime(int n, List<String> logs) {
        int[] res = new int[n];
        Stack<Integer> stack = new Stack<>();
        int prevTime = 0;
        for(String log: logs) {
            String[] parts = log.split(":");
            if(!stack.isEmpty()) {
                res[stack.peek()] += Integer.parseInt(parts[2]) - prevTime;
            }
            prevTime = Integer.parseInt(parts[2]);
            if(parts[1].equals("start")) {
                stack.push(Integer.parseInt(parts[0]));
            } else {
                res[stack.pop()]++;
                prevTime++;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        String[] array = new String[]{"0:start:0",  "1:start:2",  "1:end:5",  "0:end:6" };
        List<String> logs = Arrays.asList(array);
        LC636 obj = new LC636();
        obj.exclusiveTime(2, logs);
    }
}
