import java.util.Arrays;

public class LC253 {

    public int minMeetingRooms(Interval[] intervals) {
        if(intervals.length == 0) {
            return 0;
        }

        int[] start = new int[intervals.length];
        int[] end = new int[intervals.length];
        int i = 0;
        for(Interval n : intervals) {
            start[i] = n.start;
            end[i] = n.end;
            i++;
        }

        Arrays.sort(start);
        Arrays.sort(end);
        int room = 0;
        int endPtr = 0;
        for(int j = 0; j < start.length; j++) {
            if(start[j] < end[endPtr]) {
                room++;
            } else {
                endPtr++;
            }
        }
        return room;
    }

    public static void main(String[] args) {

    }
}
