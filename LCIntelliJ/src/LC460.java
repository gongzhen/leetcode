import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class LFUCache {

    private static class Node {
        int key;
        int value;
        int freq;
        List<Integer> list;

        public Node(int key, int value, int freq) {
            this.key = key;
            this.value = value;
            this.freq = freq;
        }
    }
    int minFreq;
    int capacity;
    Map<Integer, Node> keyNodeMap;
    Map<Integer, List<Integer>> keyFreqMap;

    public LFUCache(int capacity) {
        this.capacity = capacity;
        this.minFreq = -1;
        this.keyNodeMap = new HashMap<>();
        this.keyFreqMap = new HashMap<>();
    }

    public int get(int key) {
        if(this.keyNodeMap.containsKey(key) == false) {
            return -1;
        }
        Node node = this.keyNodeMap.get(key);
        this.touch(node);
        return node.value;
    }

    public void put(int key, int value) {
        if(this.capacity <= 0) {
            return;
        }
        if(this.keyNodeMap.containsKey(key)) {
            Node node = this.keyNodeMap.get(key);
            this.touch(node);
            node.value = value;
            return;
        }

        if(this.capacity == this.keyNodeMap.size()) {
            List<Integer> list = this.keyFreqMap.get(minFreq);
            int removedKey = list.remove(list.size() - 1);
            this.keyNodeMap.remove(removedKey);
        }

        final int freq = 1;
        this.minFreq = freq;
        if(this.keyFreqMap.containsKey(this.minFreq)) {
            this.keyFreqMap.get(this.minFreq).add(0, key);
        } else {
            this.keyFreqMap.put(this.minFreq, new ArrayList<Integer>());
            this.keyFreqMap.get(this.minFreq).add(key);
        }
        this.keyNodeMap.put(key, new Node(key, value, freq));
    }

    private void touch(Node node) {
        if(node == null) {
            return;
        }

        final int prevFreq = node.freq;
        final int newFreq = ++(node.freq);

        if(this.keyFreqMap.containsKey(prevFreq) == false) {
            return;
        }

        this.keyFreqMap.get(prevFreq).remove(new Integer(node.key));

        if(this.keyFreqMap.get(prevFreq).isEmpty() == true && prevFreq == this.minFreq) {
            this.keyFreqMap.remove(prevFreq);
            this.minFreq = newFreq;
        }

        if(this.keyFreqMap.containsKey(newFreq)) {
            this.keyFreqMap.get(newFreq).add(0, node.key);
        } else {
            this.keyFreqMap.put(newFreq, new ArrayList<Integer>());
            this.keyFreqMap.get(newFreq).add(node.key);
        }

    }
}

public class LC460 {

    public static void main(String[] args) {
        LFUCache cache = new LFUCache(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.get(1);       // returns 1
        cache.put(3, 3);    // evicts key 2
        cache.get(2);       // returns -1 (not found)
        cache.get(3);       // returns 3.
        cache.put(4, 4);    // evicts key 1.
        cache.get(1);       // returns -1 (not found)
        cache.get(3);       // returns 3
        cache.get(4);       // returns 4
    }
}
