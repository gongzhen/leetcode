import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class LC90 {

    public List<List<Integer>> subsetsWithDup(int[] nums) {
        Arrays.sort(nums);
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        List<Integer> list = new ArrayList<>();
        dfs(res, list, nums, 0);
        return res;
    }

    private void dfs(List<List<Integer>> res, List<Integer> list, int[] nums, int idx) {
        res.add(new ArrayList<Integer>(list));
        for(int i = idx; i < nums.length; i++) {
            if(i > idx && nums[i] == nums[i - 1]) {
                continue;
            }
            list.add(nums[i]);
            dfs(res, list, nums, i + 1);
            list.remove(list.size() - 1);
        }
    }


    public static void main(String[] args) {
        int[] nums = new int[] {2, 2, 1};
        LC90 obj = new LC90();
        List<List<Integer>> list = obj.subsetsWithDup(nums);
        PrintUtils.printListOfListInteger(list);
    }
}
