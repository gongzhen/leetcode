import java.util.List;
import java.util.Map;

public class PrintUtils {

    public static void printLine() {
        System.out.println("-------------------------------------------");
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

    public static void printStringWithoutNewLine(String arg) {
        System.out.print(arg);
    }

    public static void printMapKeyStringValueString(Map<String, String> map) {
        for(String key:map.keySet()) {
            String value = map.get(key);
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
