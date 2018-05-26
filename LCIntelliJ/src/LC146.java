import java.util.HashMap;
import java.util.Map;

public class LC146 {

    private static class LRUCache {

        private static class Node {
            public int key;
            public int value;
            public Node prev;
            public Node next;

            public Node(int key, int value) {
                this.key = key;
                this.value = value;
                this.prev = null;
                this.next = null;
            }
        }

        public Node head;
        public Node tail;
        public Map<Integer, Node> map;
        public int capacity;

        public LRUCache(int capacity) {
            this.capacity = capacity;
            map = new HashMap<>();
            this.head = new Node(0, 0);
            this.tail = new Node(0, 0);
            this.head.next = this.tail;
            this.tail.prev = this.head;
        }

        public int get(int key) {
            if(this.map.containsKey(key) == false) {
                return -1;
            }

            Node node = this.map.get(key);
            this.disconnect(node);
            this.moveToTail(node);
            return node.value;
        }

        public void put(int key, int value) {
            if(this.get(key) != -1) {
                Node node = this.map.get(key);
                node.value = value;
                this.map.put(key, node);
                return;
            }

            Node node = new Node(key, value);
            if(this.capacity == this.map.size()) {
                Node removed = this.head.next;
                this.disconnect(removed);
                this.map.remove(removed.key);
                removed = null;
            }

            this.moveToTail(node);
            this.map.put(key, node);
        }

        private void disconnect(Node node){
            if(node == null || node == this.tail || node == this.head) {
                return;
            }

            node.prev.next = node.next;
            node.next.prev = node.prev;
        }

        private void moveToTail(Node node) {
            if(node == null || node == this.tail || node == this.head) {
                return;
            }
            this.tail.prev.next = node;
            node.prev = this.tail.prev;
            node.next = this.tail;
            this.tail.prev = node;
        }
    }

    public static void main(String[] args) {

    }
}
