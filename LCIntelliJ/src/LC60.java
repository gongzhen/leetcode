import java.util.ArrayList;
import java.util.List;

public class LC60 {

    public String getPermutation(int n, int k) {
        int[] factorial = new int[n + 1];
        factorial[0] = 1;
        for(int i = 1; i < factorial.length; i++) {
            /// 1:  1
            /// 1:  1
            /// 2:  12, 21
            /// 6:  123,132, 213, 231, 312, 321
            /// 24: 1234, 1324, 2134, 2314, 3124, 3214, ....
            /// 1, 1*1, 1*2, 2*3, 6*4
            factorial[i] = factorial[i - 1] * i;
        }

        List<Integer> list = new ArrayList<>();
        for(int i = 1; i <= n; i++) {
            list.add(i);
        }

        k--;
        StringBuilder sb = new StringBuilder();
        for(int i = 1; i <= n; i++) {
            int fact = factorial[n - i];
            int index = k / fact;
            int num = list.get(index);
            sb.append(num);
            list.remove(index);
            k -= index * fact;
        }

        return sb.toString();
    }

    public String getPermutation1(int n, int k) {
        List<String> res = new ArrayList<String>();
        StringBuilder sb = new StringBuilder();
        boolean[] visited = new boolean[n + 1];
        dfs(res, n, 1, sb, visited);
        PrintUtils.printListStringWithLine(res);
        return res.get(k - 1);
    }

    private void dfs(List<String> res, int n, int idx, StringBuilder sb, boolean[] visited) {

        if(sb.length() == n) {
            res.add(sb.toString());
            return;
        }

        for(int i = 1; i <= n; i++) {
            if(visited[i] == false) {
                sb.append(i);
                visited[i] = true;
                dfs(res, n, idx + 1, sb, visited);
                sb.setLength(sb.length() - 1);
                visited[i] = false;
            }

        }
    }

    public static void main(String[] args) {
        LC60 obj = new LC60();
        PrintUtils.printString("res: " + obj.getPermutation(5, 26));
        PrintUtils.printString("res: " + obj.getPermutation1(5, 26));
    }
}
