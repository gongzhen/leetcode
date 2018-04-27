public class PrintUtils {

    public static void printLine() {
        System.out.println("---------------------");
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
        System.out.print(arg + ",");
    }
}
