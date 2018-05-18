import java.util.ArrayList;
import java.util.List;

public class LC68 {

    public List<String> fullJustify_1(String[] words, int maxWidth) {
        List<String> res = new ArrayList<String>();
        if(words == null || words.length == 0 || maxWidth == 0) {
            return res;
        }

        int i = 0;
        while(i < words.length) {
            int count = 0;
            int last = i;
            while(last < words.length) {
                count += words[last].length();
                if(count == maxWidth) {
                    last++;
                    break;
                }
                if(count > maxWidth) {
                    count -= (words[last].length() + 1);
                    break;
                }
                count++;
                last++;
            }

            int evenlyDistributedSpaces = 1;
            int extraSpace = 0;
            int numOfGapBwWords = last - i - 1;

            if(last != i + 1 && last != words.length) {
                evenlyDistributedSpaces = (maxWidth - count) / numOfGapBwWords + 1;
                extraSpace = (maxWidth - count) % numOfGapBwWords;
            }

            StringBuilder sb = new StringBuilder();
            for(int j = i; j < last; j++) {
                sb.append(words[j]);
                if(j + 1 < last) {
                    for(int s = 0; s < evenlyDistributedSpaces; s++) {
                        sb.append(" ");
                    }
                    if(extraSpace > 0) {
                        sb.append(" ");
                        extraSpace--;
                    }
                }
            }
            int remaining = maxWidth - sb.length();
            while(remaining > 0) {
                sb.append(" ");
                remaining--;
            }
            i = last;
            res.add(sb.toString());
        }
        return res;
    }

    public List<String> fullJustify(String[] words, int maxWidth) {
        List<String> res = new ArrayList<String>();
        if(words == null || words.length == 0 || maxWidth == 0) {
            return res;
        }

        int i = 0;
        while(i < words.length) {
            int count = words[i].length();
            int last = i + 1;
            while(last < words.length) {
                if(words[last].length() + count + 1 > maxWidth) {
                    break;
                }
                count += words[last++].length() + 1;
            }

            int evenlyDistributedSpaces = 1;
            int extraSpace = 0;
            int numOfGapBwWords = last - i - 1;

            if(last != i + 1 && last != words.length) {
                evenlyDistributedSpaces = (maxWidth - count) / numOfGapBwWords + 1;
                extraSpace = (maxWidth - count) % numOfGapBwWords;
            }

            StringBuilder sb = new StringBuilder();
            for(int j = i; j < last; j++) {
                sb.append(words[j]);
                if(j + 1 < last) {
                    for(int s = 0; s < evenlyDistributedSpaces; s++) {
                        sb.append(" ");
                    }
                    if(extraSpace > 0) {
                        sb.append(" ");
                        extraSpace--;
                    }
                }
            }
            int remaining = maxWidth - sb.length();
            while(remaining > 0) {
                sb.append(" ");
                remaining--;
            }
            i = last;
            res.add(sb.toString());
        }
        return res;
    }

    public static void main(String[] args) {
        String[] words = new String[] {"This", "is", "an", "example", "of", "text", "justification."};
        LC68 obj = new LC68();
        List<String> res1 = obj.fullJustify(words, 16);
        PrintUtils.printListString(res1);
        List<String> res2 = obj.fullJustify_1(words, 16);
        PrintUtils.printListString(res2);

//        String[] words = new String[] {"Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"};
////        String[] words = new String[] {"enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"};
//        LC68 obj = new LC68();
//        List<String> res1 = obj.fullJustify(words, 20);
//        PrintUtils.printListString(res1);
//        List<String> res2 = obj.fullJustify_1(words, 20);
//        PrintUtils.printListString(res2);
    }
}
