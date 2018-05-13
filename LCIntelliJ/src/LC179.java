import java.util.Arrays;
import java.util.Comparator;

public class LC179 {

    public String largestNumber(int[] nums) {
        if(nums.length == 0) {
            return "";
        }

        final Integer[] array = new Integer[nums.length];
        for(int i = 0; i < nums.length; i++) {
            array[i] = nums[i];
        }
        Arrays.sort(array, new Comparator<Integer>(){
            public int compare(Integer a, Integer b) {
                String s1 = Integer.toString(a);
                String s2 = Integer.toString(b);
                String ss1 = s1 + s2;
                String ss2 = s2 + s1;
                PrintUtils.printString("ss1:" + ss1 + ",ss2:" + ss2);
                return ss2.compareTo(ss1);
            }
        });
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < array.length; i++) {
            sb.append(array[i]);
        }
        PrintUtils.printString("sb:"  + sb.toString());
        return sb.toString();
    }

    public static void main(String[] args) {
        LC179 obj = new LC179();
        obj.largestNumber(new int[]{3,30});
    }
}
