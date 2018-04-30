import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class LC56 {

    public List<Interval> merge(List<Interval> intervals) {

        List<Interval> res = new ArrayList<Interval>();
        if(intervals.size() == 0) return res;

        Collections.sort(intervals, new Comparator<Interval>(){
            public int compare(Interval a, Interval b) {
                return Integer.compare(a.start, b.start);
            }
        });


        Interval prev = intervals.get(0);
        int i = 1;
        while( i < intervals.size()) {
            if(prev.end < intervals.get(i).start) {
                res.add(prev);
                prev = intervals.get(i);
            } else if (prev.end >= intervals.get(i).start) {
                prev.end = Math.max(prev.end, intervals.get(i).end);
            }
            i++;
        }
        res.add(prev);
        return res;
    }

    public static void main(String[] args) {
        Interval obj1 = new Interval(1, 3);
        Interval obj2 = new Interval(2, 6);
        Interval obj3 = new Interval(8, 10);
        Interval obj4 = new Interval(15, 18);
        List<Interval> list = new ArrayList<>();
        list.add(obj1);
        list.add(obj2);
        list.add(obj3);
        list.add(obj4);
        LC56 obj = new LC56();
        List<Interval> res = obj.merge(list);
        for(Interval r : res) {
            PrintUtils.printString("start:" + r.start + ", end:" + r.end);
        }
    }

}
