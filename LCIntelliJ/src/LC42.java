import java.util.Stack;

public class LC42 {

    public int trap1(int[] heights) {
        if(heights.length == 0) return 0;
        PrintUtils.printArray(heights);
        int max = 0;
        for(int i = 1; i < heights.length - 1; i++) {
            int maxLeft = 0;
            int maxRight = 0;
            for(int j = i; j >= 0; j--) {
                maxLeft = Math.max(maxLeft, heights[j]);
            }
            for(int j = i; j < heights.length; j++) {
                maxRight = Math.max(maxRight, heights[j]);
            }
            max += Math.min(maxLeft, maxRight) - heights[i];
        }
        return max;
    }

    public int trap2(int[] heights) {
        int left = 0;
        int right = heights.length - 1;
        int max = 0;
        int maxLeft = 0, maxRight = 0;
        while (left <= right) {
            if(heights[left] <= heights[right]) {
                if(heights[left] >= maxLeft) {
                    maxLeft = heights[left];
                } else {
                    max += maxLeft - heights[left];
                }
                left++;
            } else if (heights[left] > heights[right]){
                if(heights[right] >= maxRight) {
                    maxRight = heights[right];
                } else {
                    max += maxRight - heights[right];
                }
                right--;
            }
        }
        return max;
    }

    public int trap3(int[] heights) {
        if(heights.length == 0) return 0;

        int max = 0;
        int size = heights.length;
        int[] leftMax = new int[size];
        int[] rightMax = new int[size];
        leftMax[0] = heights[0];
        for(int i = 1; i < size; i++) {
            leftMax[i] = Math.max(heights[i], leftMax[i-1]);
        }

        PrintUtils.printArray(leftMax);

        rightMax[size - 1] = heights[size - 1];
        for(int i = size - 2; i >= 0; i--) {
            rightMax[i] = Math.max(heights[i], rightMax[i + 1]);
        }
        PrintUtils.printArray(rightMax);

        for(int i = 1; i < size - 1; i++) {
            max += Math.min(leftMax[i], rightMax[i]) - heights[i];
        }
        return max;
    }

    public int trap4(int[] heights) {
        if(heights.length == 0) {
            return  0;
        }

        Stack<Integer> stack = new Stack<>();
        int i = 0;
        int max = 0, maxBottom = 0;
        while(i < heights.length) {
            if(stack.isEmpty() == true || heights[i] < heights[stack.peek()]) {
                stack.push(i++);
            } else {
                int bottom = stack.pop();
                if(stack.isEmpty() == true) {
                    maxBottom = 0;
                } else {
                    int min = Math.min(heights[stack.peek()], heights[i]);
                    maxBottom = (min - heights[bottom]) * (i - stack.peek() - 1);
                    max += maxBottom;
                }
            }
        }
        return max;
    }

    public static void main(String[] args) {
        /// int[] heights = new int[]{0,1,0,2,1,0,1,3,2,1,2,1};
        int[] heights = new int[] {0,1,0,0,0,0,0,3,0,0,0,0};
        LC42 obj = new LC42();
//        PrintUtils.printString("res:" + obj.trap1(heights));
//        PrintUtils.printString("res:" + obj.trap2(heights));
        PrintUtils.printString("res:" + obj.trap3(heights));
//        PrintUtils.printString("res:" + obj.trap4(heights));
    }
}
