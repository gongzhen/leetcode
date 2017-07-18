class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var list:[Int] = []
        dfs(&list, root, 0)
        return list
    }
    
    func dfs(_ list: inout [Int], _ root: TreeNode?, _ level: Int) {
        guard let root = root else {
            return
        }
        
        if list.count == level {
            list.append(root.val)
        }
        
        dfs(&list, root.right, level + 1)
        dfs(&list, root.left, level + 1)
    }
}