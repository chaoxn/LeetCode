

/**
 hot100 一半已经做过 在其他分类下.这里把剩下的e和m解决
 */

import UIKit

//169多数元素
class Hot100_1 {
    func majorityElement(_ nums: [Int]) -> Int {
        
//        var map = [Int:Int]()
//
//        for value in nums {
//            if let record = map[value]{
//
//                map[value] = record + 1
//                if record > nums.count / 2 {
//                    return value
//                }
//
//            }else{
//                map[value] = 1
//            }
//        }
//
//        return -1
        
        //摩尔投票
        
        //票数
        var count = 0
        //选举人
        var candidate = nums[0]
        
        for num in nums {
            //票数为0 换选举人
            if count == 0 {
                candidate = num
            }
            //下一个数字和当前选举人一样 给他投票,不一样减一票
            count += (num==candidate) ? 1:-1
        }
        return candidate
    }
}

//448 消失的数字
class Hot100_2 {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        
        var res = [Int]()
        let n = nums.count
        var map = [Int: Int]()
        
        for value in 1...n {
            map[value] = 0
        }
        
        for value in nums {
            map[value] = map[value]! + 1
        }
        
        for (key, value) in map {
            if value == 0 {
                res.append(key)
            }
        }
        
        return res
    }
}

//543 二叉树的直径
class Hot100_3 {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        
        var res = 0
        
        func maxDepth(_ root: TreeNode?) -> Int{
            
            guard root != nil else {
                return 0
            }
            
            let leftMax = maxDepth(root?.left)
            let rightMax = maxDepth(root?.right)
            
            res = max(res, leftMax + rightMax)
            return 1 + max(leftMax, rightMax)
        }
        
        maxDepth(root)
        return res
    }
}

//11盛最多水的容器
class Hot100_4 {
    func maxArea(_ height: [Int]) -> Int {
        var res = 0
        
        //左右双指针
        var left = 0
        var right = height.count-1
        
        while left < right {
            //面积等于两遍最短的 * 底部长度
            let s = min(height[left], height[right]) * (right - left)
            res = max(res, s)
            
            //收缩短板的那一侧,如果是长版的收缩 只会更小
            if height[left] < height[right]{
                left += 1
            }else{
                right -= 1
            }
        }
        return res
    }
}

//49字母异位词分组
class Hot100_5 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var res: [[String]] = []
        var map =  [String: [String]]()
        //思路 异位词,排序之后 是一样的
        
        for str in strs {
            let key = String(str.sorted())
            if map[key] == nil {
                map[key] = [str]
            }else{
                map[key]!.append(contentsOf: [str])
            }
        }
        
        res = Array(map.values)
        return res
    }
}

//55. 跳跃游戏
class Hot100_6 {
    func canJump(_ nums: [Int]) -> Bool {
        
        //前n-1个元素能够跳到的最远距离
        var maxLength = 0
        let n = nums.count-1
        
        for i in 0...maxLength {
            //第i个元素能够跳到的最远距离
            let temp = i + nums[i]
            //更新最远距离
            maxLength = max(temp, maxLength)
            //如果最远距离已经大于或等于最后一个元素的下标,则说明能跳过去,退出. 减少循环
            if maxLength >= n {
                return true
            }
        }
        
        return false
    }
}

//45. 跳跃游戏 II -> 贪心算法
class Hot100_7 {
    func jump(_ nums: [Int]) -> Int {
        //跳跃次数
        var jump = 0
        //跳跃最大距离
        var farthest = 0
        //当前能跳范围内的最大距离的结束点
        var end = 0
        let n = nums.count
        
        for i in 0..<n-1{
            let temp = i + nums[i]
            //取[i...end]区间内的最大距离为farthest,
            farthest = max(farthest, temp)
            //到了end
            if end == i {
                jump += 1
                //刷新end, farthest为当前跳跃区间结束的结束点.
                end = farthest
            }
        }
        
        return jump
    }
}

//64. 最小路径和
/*
 1. 确定dp含义: dp[i][j]  从dp[0][0] 到 dp[i][j] 的最小路径和
 2. 确定状态转移方程: dp[i][j] = dp[i-1][j] + dp[i][j-1]
 3. 确定dp初始化数组  dp[i][0] += dp[i-1][0]   dp[0][j] += dp[0][j-1]
 4. 遍历顺序 从左到右
 **/
class Hot100_8 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        
        var grid = grid
        let m = grid.count
        let n = grid[0].count
        
        for i in 1..<m{
            grid[i][0] += grid[i-1][0]
        }
        
        for j in 1..<n{
            grid[0][j] += grid[0][j-1]
        }
        
        for i in 1..<m{
            for j in 1..<n{
                grid[i][j] += min(grid[i-1][j], grid[i][j-1])
            }
        }
        
        return grid[m-1][n-1]
    }
}

//75. 颜色分类
//输入：nums = [2,0,2,1,1,0]
//输出：[0,0,1,1,2,2]
/**
 遇到 1: 跳过, curr++
 遇到 0: 跟左指针 left 交换值， 并且 left++, curr++
 遇到 2: 跟右指针 right 交换值, right--，重新判断 当前 curr 的新值。
 */
class Hot100_9 {
    func sortColors(_ nums: inout [Int]) {
        
        var curr = 0
        var left = 0
        var right = nums.count - 1
        
        while curr <= right{
            let value = nums[curr]
            if value == 0 {
                nums[curr] = nums[left]
                nums[left] = value
                curr += 1
                left += 1
            }else if value == 1 {
                curr += 1
            }else {
                nums[curr] = nums[right]
                nums[right] = value
                right -= 1
            }
        }
    }
}

//79. 单词搜索
class Hot100_10 {
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        guard board.count > 0, word.count > 0 else {
            return false
        }
        var board = board
        let word = Array(word)
        let m = board.count
        let n = board[0].count
        var visited = Array(repeating: Array(repeating: 0, count: n), count: m)

        for i in 0..<m {
            for j in 0..<n{
                if dfs(&board, word, &visited, i, j, 0){
                    return true
                }
            }
        }
    
        return false
    }
    
    func dfs(_ board: inout [[Character]],
             _ word: [Character],
             _ visited: inout [[Int]],
             _ i: Int,
             _ j: Int,
             _ curr: Int) -> Bool{
        
        if curr >= word.count {
            return true
        }

        if i < 0 || j < 0 || i >= board.count || j >= board[0].count {
            return false
        }

        if board[i][j] != word[curr] {
            return false
        }
        
        if visited[i][j] == 1 {
            return false
        }
        
        //找完的路径标记一下
        visited[i][j] = 1
        
        //递归，沿着当前坐标的上下左右4个方向查找
        if  dfs(&board, word, &visited, i+1, j, curr+1) ||
            dfs(&board, word, &visited, i-1, j, curr+1) ||
            dfs(&board, word, &visited, i, j+1, curr+1) ||
            dfs(&board, word, &visited, i, j-1, curr+1) {
            return true
        }
    
        //回溯 复原
        visited[i][j] = 0

        return false
    }
}

class Solution_temp {
     var res = false
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        guard board.count > 0, word.count > 0 else {
            return false
        }

        var board = board

        var word = Array(word)

        var used = Array(repeating: Array(repeating: 0, count: board[0].count), count: board.count)

        for i in 0..<board.count {
            for j in 0..<board[0].count {

                if backtrack(&board, word, i, j, 0, &used) {
                    res = true
                }
            }
        }

        return res
    }

    func backtrack(_ board: inout [[Character]], _ word: [Character], _ i: Int, _ j: Int, _ index: Int, _ used: inout [[Int]]) -> Bool {

        if index >= word.count {
            return true
        }

        if i < 0 || j < 0 || i >= board.count || j >= board[0].count {
            return false
        }

        if board[i][j] != word[index] {
            return false
        }

        if used[i][j] == 1 {
            return false
        }

        used[i][j] = 1
 
        if backtrack(&board, word, i + 1, j, index + 1, &used) ||
        backtrack(&board, word, i - 1, j, index + 1, &used) ||
        backtrack(&board, word, i, j + 1, index + 1, &used) ||
        backtrack(&board, word, i, j - 1, index + 1, &used) {
            return true
        }

        used[i][j] = 0

        return false
    }
}


class Hot100_11 {
    
}

class Hot100_12 {
    
}

class Hot100_13 {
    
}

class Hot100_14 {
    
}
