import java.util.List;
import java.util.Map;

public class PrintUtils {

    public static void printLine() {
        System.out.println("-------------------------------------------");
    }

    public static int getLineNumber() {
        return Thread.currentThread().getStackTrace()[2].getLineNumber();
    }

    public static void printBinaryString(int x) {
        printString(Integer.toBinaryString(x));
    }

    public static void printString(String arg) {
        System.out.println(arg);
    }

    public static void printArray(int[] list) {
        printStringWithoutNewLine("[");
        int i = 0;
        for(int n : list) {
            printStringWithoutNewLine("[" + i + "]" + n + ", ");
            i++;
        }
        printStringWithoutNewLine("]\n");
    }

     public static void printListString(List<String> list) {
        for(String s: list) {
            printStringWithoutNewLine( s + ", ");
        }
         printStringWithoutNewLine("\n");
     }

     public static void printMatrixInt(int[][] matrix) {
        int i = 0;
         for(int[] s: matrix) {
             int j = 0;
             for(int n: s) {
                 printStringWithoutNewLine( "[" + i + "]" + "[" + (j++) + "]" + n + ", ");
             }
             System.out.println();
             i++;
         }
     }

    public static void printStringWithoutNewLine(String arg) {
        System.out.print(arg);
    }

    public static void printMapKeyStringValueString(Map<String, String> map) {
        for(String key:map.keySet()) {
            String value = map.get(key);
            printString("key:" + key + ": [" + value + "]");
        }
    }

    public static void printMapKeyStringValueInteger(Map<String, Integer> map) {
        for(String key:map.keySet()) {
            Integer value = map.get(key);
            printString("key:" + key + ": [" + value + "]");
        }
    }

    public static void printMapKeyStringValueList(Map<String, List<String>> map) {
        for(String key:map.keySet()) {
            List<String> list = map.get(key);
            printStringWithoutNewLine("key:" + key + ": [");
            for(String n : list) {
                printStringWithoutNewLine(n + ", ");
            }
            printString("]");
        }
    }

    public static void printListOfListInteger(List<List<Integer>> listOflist) {
        for(List<Integer> list: listOflist){
            printStringWithoutNewLine("[");
            for(int n : list) {
                printStringWithoutNewLine(n + ", ");
            }
            printStringWithoutNewLine("]\n");
        }
    }

    public static void printListOfListString(List<List<String>> listOflist) {
        for(List<String> list: listOflist){
            printStringWithoutNewLine("[");
            for(String n : list) {
                printStringWithoutNewLine(n + ", ");
            }
            printStringWithoutNewLine("]\n");
        }
    }
}
