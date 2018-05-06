import java.util.HashMap;
import java.util.Map;

public class LC149 {

    public int maxPoints(Point[] points) {
        if(points == null) return 0;
        if(points.length <= 2) return points.length;

        int max = 0;
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        for(int i = 0; i < points.length; i++) {
            map.clear();
            int same = 1, x0 = 0, y0 = 0, others = 0;
            for(int j = i + 1; j < points.length; j++) {
                int x = points[i].x - points[j].x;
                int y = points[i].y - points[j].y;
                if(x == 0 && y == 0) {
                    same++;
                } else if (x == 0) {
                    y0++;
                    others = Math.max(others, y0);
                } else if (y == 0) {
                    x0++;
                    others = Math.max(others, x0);
                } else {
                    int gcd = gcd(x, y);
                    x = x / gcd;
                    y = y / gcd;
                    int key = x * y;
                    if(map.containsKey(key) == false) {
                        map.put(key, 1);
                    } else {
                        int val = map.get(key);
                        val++;
                        map.put(key, val);
                    }
                    others = Math.max(others, map.get(key));
                }
            }
            max = Math.max(max, others + same);
        }
        return max;
    }

    private int gcd(int x, int y) {
        if(y == 0) {
            return x;
        }
        if(x < y) {
            return gcd(y, x);
        }
        while(y != 0) {
            int mod = x % y;
            x = y;
            y = mod;
        }
        return x;
    }



    public static void main(String[] args) {
//        Point p1 = new Point(2, 3);
//        Point p2 = new Point(3, 3);
//        Point p3 = new Point(-5, 3);
//        Point[] points = new Point[]{p1, p2, p3};
//        LC149 obj = new LC149();
//        obj.maxPoints(points);

//        Point p1 = new Point(1, 1);
//        Point p2 = new Point(2, 2);
//        Point p3 = new Point(3, 3);
//        Point[] points = new Point[]{p1, p2, p3};
//        LC149 obj = new LC149();
//        PrintUtils.printString("res:" + obj.maxPoints(points));

        Point p1 = new Point(1, 1);
        Point p2 = new Point(3, 2);
        Point p3 = new Point(5, 3);
        Point p4 = new Point(4, 1);
        Point p5 = new Point(2, 3);
        Point p6 = new Point(1, 4);
        Point[] points = new Point[]{p1, p2, p3, p4, p5, p6};
        LC149 obj = new LC149();
        PrintUtils.printString("res:" + obj.maxPoints(points));
    }
}
