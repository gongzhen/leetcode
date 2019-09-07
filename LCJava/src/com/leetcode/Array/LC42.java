package com.leetcode.Array;

import com.leetcode.Helper.PrintUtils;

import java.util.ArrayList;
import java.util.List;

public class LC42 {
    public int trap(int[] height) {
        int left = 0;
        int right = height.length - 1;
        int leftHigh = 0;
        int rightHight = 0;
        int sum = 0;
        while(left <= right) {
            if (height[left] <= height[right]) {
                if (leftHigh <= height[left]) {
                    leftHigh = height[left];
                } else {
                    sum += leftHigh - height[left];
                }
                left++;
            } else {
                if (rightHight <= height[right]) {
                    rightHight = height[right];
                } else {
                    sum += rightHight - height[right];
                }
                right--;
            }
        }
        return sum;
    }

    public static void main(String[] args) {
        LC42 obj = new LC42();
//        int res = obj.trap(new int[]{0,1,0,2,1,0,1,3,2,1,2,1});
        int res = obj.trap(new int[]{5,2,1,2,1,5});
//        int res = obj.trap(new int[]{4,3,3,9,3,0,9,2,8,3});
//        int res = obj.trap(new int[]{9,6,8,8,5,6,3});
        PrintUtils.printString("res:" + res);
    }
}
