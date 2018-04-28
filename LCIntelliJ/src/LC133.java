import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;

public class LC133 {

    public UndirectedGraphNode cloneGraph(UndirectedGraphNode node) {
        if(node == null) {
            return null;
        }

        UndirectedGraphNode clone = new UndirectedGraphNode(node.label);
        Map<Integer, UndirectedGraphNode> map = new HashMap<>();
        map.put(node.label, clone);

        Queue<UndirectedGraphNode> pq = new LinkedList<>();
        pq.offer(node);

        while (!pq.isEmpty()) {
            UndirectedGraphNode top = pq.poll();
            for(UndirectedGraphNode neighbor : top.neighbors) {
                if(map.containsKey(neighbor.label) == false) {
                    pq.offer(neighbor);
                    map.put(neighbor.label, new UndirectedGraphNode(neighbor.label));
                }
                map.get(top.label).neighbors.add(map.get(neighbor.label));
            }
        }
        return clone;
    }

    public static void main(String[] args) {
        LC133 obj = new LC133();
        UndirectedGraphNode node =  UndirectedGraphUtils.createUndirectedGraph();
        UndirectedGraphNode res = obj.cloneGraph(node);
        PrintUtils.printString("res" + res.label);

    }
}
