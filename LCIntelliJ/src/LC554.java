import java.util.*;

public class LC554 {

    public int leastBricks(List<List<Integer>> wall) {
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        int minBricks = wall.size();

        for(List<Integer> list : wall) {
            int width = 0;
            for(int i = 0; i < list.size() - 1; i++) {
                width += list.get(i);
                if(map.containsKey(width)) {
                    int value = map.get(width);
                    map.put(width, ++value);
                } else {
                    map.put(width, 1);
                }
            }
        }

        for(Integer key: map.keySet()) {
            minBricks = Math.min(minBricks, wall.size() - map.get(key));
        }
        return minBricks;
    }


    public static void main(String[] args) {
        Integer[] list1 = new Integer[]{1, 2, 2, 1};
        Integer[] list2 = new Integer[]{3, 1, 2};
        Integer[] list3 = new Integer[]{1, 3, 2};
        Integer[] list4 = new Integer[]{2, 4};
        Integer[] list5 = new Integer[]{3, 1, 2};
        Integer[] list6 = new Integer[]{1, 3, 1, 1};
        List<Integer> l1 = Arrays.asList(list1);
        List<Integer> l2 = Arrays.asList(list2);
        List<Integer> l3 = Arrays.asList(list3);
        List<Integer> l4 = Arrays.asList(list4);
        List<Integer> l5 = Arrays.asList(list5);
        List<Integer> l6 = Arrays.asList(list6);
        List<List<Integer>> wall = new ArrayList<>();
        wall.add(l1);
        wall.add(l2);
        wall.add(l3);
        wall.add(l4);
        wall.add(l5);
        wall.add(l6);
        LC554 obj = new LC554();
        obj.leastBricks(wall);
    }
}
