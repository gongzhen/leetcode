package com.leetcode.String;

import com.leetcode.Helper.PrintUtils;

import java.util.Stack;

public class LC227 {

    public int calculate(String s) {
        Stack<Integer> number = new Stack<>();
        int lastNumber = 0;
        char lastSign = ' ';
        for (int i = 0; i < s.length(); i++) {
            if (i == 0) {
                lastSign = '+';
            }
            char c = s.charAt(i);
            if (Character.isDigit(c) == true) {
                lastNumber = lastNumber * 10 + c - '0';
            }

            if ((!Character.isDigit(c) && c != ' ') || i == s.length() - 1) {
                if (lastSign == '+') {
                    number.push(lastNumber);
                } else if (lastSign == '-') {
                    number.push(-lastNumber);
                } else if (lastSign == '*') {
                    number.push(number.pop() * lastNumber);
                } else if (lastSign == '/') {
                    number.push(number.pop() / lastNumber);
                }
                lastNumber = 0;
                lastSign = c;
            }
        }

        int sum = 0;
        while(!number.isEmpty()) {
            sum += number.pop();
        }
        return sum;
    }

    public static void main(String[] args) {
        LC227 obj = new LC227();
        int res = obj.calculate("3+2*2");
        //int res = obj.calculate(" 3/2 ");
        PrintUtils.printString("res:" + res);
    }
}
