package com.leetcode.Heap;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.PriorityQueue;

public class LC973 {
    private static class Axis {
        int x;
        int y;
        public Axis(int x, int y){
            this.x = x;
            this.y = y;
        }
    }

    public int[][] kClosest(int[][] points, int K) {
        int k = K;
        PriorityQueue<Axis> pq = new PriorityQueue<Axis>(k, new Comparator<Axis>(){
            public int compare(Axis a, Axis b) {
                return a.x * a.x + a.y * a.y - (b.x * b.x + b.y * b.y);
            }
        });

        int row = points.length;
        int col = points[0].length;
        for (int[] list : points) {
            pq.offer(new Axis(list[0], list[1]));
        }

        int i = 0;
        List<Axis> list = new ArrayList<Axis>();
        while(!pq.isEmpty()) {
            Axis p = pq.poll();
            i++;
            if (i <= k) {
                list.add(p);
            }
        }
        int size = list.size();
        i = 0;
        int[][] res = new int[size][2];
        for (int[] array : res) {
            array[0] = list.get(i).x;
            array[1] = list.get(i).y;
            i++;
        }
        return res;
    }
}
