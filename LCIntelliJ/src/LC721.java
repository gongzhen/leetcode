import java.util.*;

public class LC721 {

    public static List<List<String>> accountsMerge_2(List<List<String>> accounts) {
        Map<String, String> emailToName = new HashMap<>(); // to construct answer
        Map<String, List<String>> graph = new HashMap<>();
        for (List<String> account : accounts) {
            String name = "";

            for (int i = 0; i < account.size(); i++) {
                String email = account.get(i);
                if (i == 0) {
                    name = email;
                    continue;
                }
                if (i == 1) {
                    graph.computeIfAbsent(email, x -> new ArrayList<>());
                    emailToName.put(email, name);
                    continue;
                }
                graph.computeIfAbsent(email, x -> new ArrayList<>()).add(account.get(1));
                graph.get(account.get(1)).add(email);
                emailToName.put(email, name);
            }
        }

        PrintUtils.printMapKeyStringValueList(graph);
        PrintUtils.printLine();
        PrintUtils.printMapKeyStringValueString(emailToName);

        Set<String> visited = new HashSet<>();
        List<List<String>> res = new ArrayList<>();
        for (String email : graph.keySet()) {
            if (!visited.contains(email)) {
                visited.add(email);
                Stack<String> stack = new Stack<>();
                stack.push(email);
                List<String> component = new ArrayList<>();
                while (!stack.isEmpty()) {
                    String cur = stack.pop();
                    component.add(cur);
                    for (String nei : graph.get(cur)) {

                        if (!visited.contains(nei)) {
                            stack.push(nei);
                            visited.add(nei);
                        }
                    }
                }

                Collections.sort(component);
                component.add(0, emailToName.get(email));
                res.add(component);
            }
        }
        PrintUtils.printListOfListString(res);
        PrintUtils.printLine();
        return res;
    }

    public List<List<String>> accountsMerge(List<List<String>> accounts) {
        Map<String, String> emailToName = new HashMap<>();
        Map<String, List<String>> graph = new HashMap<>();

        for(List<String> account: accounts) {
            String name = "";
            for(int i = 0; i < account.size(); i++) {
                String email = account.get(i);
                if(i == 0) {
                    name = email;
                    continue;
                }
                if(i == 1) {
                    if(graph.containsKey(email) == false) {
                        graph.put(email, new ArrayList<String>());
                    }
                    emailToName.put(email, name);
                    continue;
                }

                if(graph.containsKey(email) == false) {
                    graph.put(email, new ArrayList<String>());
                }
                graph.get(email).add(account.get(1));
                graph.get(account.get(1)).add(email);
                emailToName.put(email, name);
            }
        }
        PrintUtils.printMapKeyStringValueList(graph);
        PrintUtils.printLine();
        PrintUtils.printMapKeyStringValueString(emailToName);

        List<List<String>> res = new ArrayList<List<String>>();
        Set<String> visited = new HashSet<>();
        for(String email : graph.keySet()) {
            if(!visited.contains(email)) {
                visited.add(email);
                Stack<String> stack = new Stack<>();
                stack.push(email);
                List<String> component = new ArrayList<>();
                while (!stack.isEmpty()) {
                    String cur = stack.pop();
                    component.add(cur);
                    for(String nei : graph.get(cur)) {
                        if(!visited.contains(nei)) {
                            stack.push(nei);
                            visited.add(nei);
                        }
                    }
                }
                Collections.sort(component);
                component.add(0, emailToName.get(email));
                res.add(component);
            }
        }
        PrintUtils.printListOfListString(res);
        PrintUtils.printLine();
        return res;
    }

    public static void main(String[] args) {
        String[] array1 = new String[]{"John", "johnsmith@mail.com", "john00@mail.com"};
        List<String> list1 = new ArrayList<>(Arrays.asList(array1));

        String[] array2 = new String[]{"John", "johnnybravo@mail.com"};
        List<String> list2 = new ArrayList<>(Arrays.asList(array2));

        String[] array3 = new String[]{"John", "johnsmith@mail.com", "john_newyork@mail.com"};
        List<String> list3 = new ArrayList<>(Arrays.asList(array3));

        String[] array4 = new String[]{"Mary", "mary@mail.com"};
        List<String> list4 = new ArrayList<>(Arrays.asList(array4));

        List<List<String>> accounts = new ArrayList<List<String>>();
        accounts.add(list1);
        accounts.add(list2);
        accounts.add(list3);
        accounts.add(list4);

        LC721 obj = new LC721();
        obj.accountsMerge(accounts);
        PrintUtils.printLine();
        obj.accountsMerge_2(accounts);
    }
}
