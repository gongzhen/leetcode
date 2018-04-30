public class LC43 {

    public String multiply(String num1, String num2) {
        int len1 = num1.length();
        int len2 = num2.length();
        int[] digit = new int[len1 + len2];

        for(int i = len1 - 1; i >= 0; i--) {
            for(int j = len2 - 1; j >= 0; j--) {
                int n1 = num1.charAt(i) - '0';
                int n2 = num2.charAt(j) - '0';
                int product = n1 * n2;
                int p1 = i + j;
                int p2 = i + j + 1;
                int sum = product + digit[p2];
                digit[p2] = sum % 10;
                digit[p1] += sum / 10;

            }
        }
        PrintUtils.printArray(digit);
        StringBuilder sb = new StringBuilder();
        int i = 0;
        while(i < digit.length) {
            if(i == 0 && digit[i] == 0) {
                while(i < digit.length && digit[i] == 0) {
                    i++;
                }
            }else if (digit[i] != 0) {
                break;
            }
        }

        for(; i < digit.length; i++) {
            sb.append(digit[i]);
        }

        /// if digit is [0, 0] => sb is empty.
        return sb.length() == 0 ? "0" : sb.toString();
    }

    public static void main(String[] args) {
        LC43 obj = new LC43();
//        String res = obj.multiply("123", "456");
//        PrintUtils.printString("res:" + res);
//        String res2 = obj.multiply("999", "999");
//        PrintUtils.printString("res2:" + res2);
        String res3 = obj.multiply("0", "0");
        PrintUtils.printString("res3:" + res3);
    }
}
