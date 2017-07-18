class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var count = 0
        let m = grid.count
        var copyGrid:[[Character]] = Array(repeating:[Character](), count: m)
        
        for (i, row) in grid.enumerated() {
            for (_, col) in grid[i].enumerated() {
                copyGrid[i].append(col)
            }
        }
                        
        for (i, row) in copyGrid.enumerated() {
            for(j, _) in copyGrid[i].enumerated() {
                if copyGrid[i][j] == "1"{
                    count = count + 1
                    dfs(&copyGrid, i, j)                    
                }
            }
        }
        return count
    }
    
    let direction = [[0, 1], [0, -1], [-1, 0], [1, 0]]
    
    func dfs(_ grid:inout [[Character]], _ i: Int, _ j: Int) {
        if i < 0 || j < 0 || i >= grid.count || j >= grid[i].count || grid[i][j] == "0" {
            return
        }
        
        grid[i][j] = "0"
        
        for list in direction {
            let nx = i + list[0]
            let ny = j + list[1]
            dfs(&grid, nx, ny)
        }
    }
}