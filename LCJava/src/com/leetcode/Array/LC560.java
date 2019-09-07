package com.leetcode.Array;

import com.leetcode.Helper.PrintUtils;

import java.util.HashMap;
import java.util.Map;

public class LC560 {
    public int subarraySum(int[] nums, int k) {
        Map<Integer, Integer> map = new HashMap<>(); // sum -> count
        // [8, 54, 7, -70, 22, 65, -6] 100
        int sum = 0;
        int j = 0;
        map.put(0, 1);
        int res = 0;
        for(int i = 0; i < nums.length; i++) {
            sum += nums[i];
            if(map.containsKey(sum - k)) {
                int count = map.get(sum - k);
                res += count;
            }
            if(map.containsKey(sum)) {
                int count = map.get(sum);
                map.put(sum, ++count);
            } else {
                map.put(sum, 1);
            }
        }
        return res;
    }

    public static void main(String[] args) {
        LC560 obj = new LC560();
        int res = obj.subarraySum(new int[]{28,54,7,-70,22,65,-6}, 100);
//        int res = obj.subarraySum(new int[]{1, 1, 1}, 2);
        PrintUtils.printString("res:" + res);

    }
}