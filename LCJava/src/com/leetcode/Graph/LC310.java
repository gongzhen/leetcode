package com.leetcode.Graph;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class LC310 {

    public List<Integer> findMinHeightTrees(int n, int[][] edges) {
        List<Integer> res = new ArrayList<>();
        if(edges == null || edges.length == 0) {
            return res;
        }

        List<List<Integer>> graph = new ArrayList<>();

        for(int i = 0; i < n; i++) {
            graph.add(new ArrayList<>());
        }

        for(int[] edge : edges) {
            graph.get(edge[0]).add(edge[1]);
            graph.get(edge[1]).add(edge[0]);
        }

        List<Integer> leaves = new ArrayList<>();
        for(int i = 0; i < graph.size(); i++) {
            if(graph.get(i).size() == 1) {
                leaves.add(i);
            }
        }

        Queue<Integer> pq = new LinkedList<>();




    }

    public static void main(String[] args) {

    }
}
