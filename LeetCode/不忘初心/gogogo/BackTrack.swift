
//回溯专题
import UIKit

//全排列
class Solution_B1 {
    func permute(_ nums: [Int]) -> [[Int]] {
        
        var res: [[Int]] = []
        var track: [Int] = []
        
        func backTrack(_ track: inout [Int]){
            
            if track.count == nums.count {
                res.append(Array(track))
                return
            }
            
            for i in 0..<nums.count {
                if track.contains(nums[i]){
                    continue
                }
                track.append(nums[i])
                backTrack(&track)
                track.removeLast()
            }
        }
        
        backTrack(&track)
        
        return res
    }
}

//51 N皇后
class Solution_B2 {
   
    func solveNQueens(_ n: Int) -> [[String]] {
        
        var ret:[[String]] = []
        /// 初始化棋盘
        let chessBoard:[[String]] = Array(repeating: Array(repeating: ".", count: n), count: n)
        backTracking(&ret, chessBoard, 0, n)
        return ret
    }
    
    func backTracking(_ ret:inout [[String]], _ chessBoard: [[String]],_ row:Int, _ n:Int) {
        ///到底了,记录
        if row == n {
            ret.append(change(chessBoard))
            return
        }
        
        ///去看这行的每一列
        for col in 0..<n {
            if isValid(chessBoard, row, col, n) {
                var chessBoard = chessBoard
                chessBoard[row][col] = "Q"
                ///该列已经添加，去看下一行
                backTracking(&ret,chessBoard, row + 1, n)
                chessBoard[row][col] = "."
            }
        }
    }
    
    /// 数组转换为字符串
    func change(_ nums: [[String]]) -> [String] {
        var ret:[String] = []
        for stringArray in nums {
            ret.append(stringArray.joined())
        }
        return ret
    }
    
    /// 判断落子是否合法
    func isValid(_ chessBoard:[[String]], _ row:Int, _ col:Int, _ n:Int) -> Bool {
        /// 检测列上是否有棋子
        for index in 0..<row {
            if  chessBoard[index][col] == "Q" {
                return false
            }
        }
        
        /// 检测对角线左上角
        var colIndex:Int = col - 1
        var rowIndex:Int = row - 1
        while colIndex >= 0 && rowIndex >= 0 {
            if chessBoard[rowIndex][colIndex] == "Q" {
                return false
            }
            colIndex -= 1
            rowIndex -= 1
        }
        
        /// 检测右上角对角线
        colIndex = col + 1
        rowIndex = row - 1
        while colIndex < n && rowIndex >= 0 {
            if chessBoard[rowIndex][colIndex] == "Q" {
                return false
            }
            colIndex += 1
            rowIndex -= 1
        }
        
        return true
    }
}


class Solution_B3 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var track: [Int] = []
        func backtrack(_ track: inout [Int], _ start: Int){
            
            res.append(Array(track))
            //使用 start 参数控制树枝的生长避免产生重复的子集
            //这个 i 从 start 开始，那么下一层回溯树就是从 start + 1 开始，从而保证 nums[start] 这个元素不会被重复使用：
            for i in start..<nums.count {
                track.append(nums[i])
                backtrack(&track, i+1)
                track.removeLast()
            }
        }
        
        backtrack(&track, 0)
        return res
    }
}

//77组合 给定两个整数 n 和 k，返回范围 [1, n] 中所有可能的 k 个数的组合。
class Solution_B4 {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        //res 记录结果
        //track 记录每次的回溯路径 也就是每个子集.
        var res = [[Int]]()
        var track = [Int]()
        //start 默认1开始
        //n 截止到n
        //k 个数
        func backtrack(_ start: Int, _ n: Int, _ k: Int, _ track: inout [Int]){
            
            if k == track.count {
                res.append(track)
            }
            //有个坑点  ..<n+1可以   ...<n不行
            for i in start..<n+1 {
                track.append(i)
                backtrack(i+1, n, k, &track)
                track.removeLast()
            }
        }
                
        backtrack(1,n,k,&track)

        return res
    }
}

//90. 子集 II
//给你一个整数数组 nums ，其中可能包含重复元素，请你返回该数组所有可能的子集（幂集）。
class Solution_B5 {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var res: [[Int]] = []
        var track: [Int] = []
        
        // 通过 start 参数控制树枝的遍历，避免产生重复的子集
        func backtrack(_ track: inout [Int], _ start: Int){
            
            res.append(track)
            
            for i in start..<nums.count{
                // 剪枝逻辑，值相同的相邻树枝，只遍历第一条
                if i > start && nums[i] == nums[i-1]{
                    continue
                }
                track.append(nums[i])
                backtrack(&track, i+1)
                track.removeLast()
            }
        }
        
        backtrack(&track, 0)
        return res
    }
}

//40. 组合总和 II
class Solution_B6 {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        // 先排序，让相同的元素靠在一起
        let nums = candidates.sorted()
        var res: [[Int]] = []
        var track: [Int] = []
        var trackSum = 0
        
        func backtrack(_ track: inout [Int], _ start: Int){
            // base case，达到目标和，找到符合条件的组合
            if trackSum == target {
                res.append(Array(track))
                return
            }
            // base case，超过目标和，直接结束
            if trackSum > target {
                return
            }
            
            for i in start..<nums.count {
                // 剪枝逻辑，值相同的树枝，只遍历第一条
                if i > start && nums[i] == nums[i - 1] {
                    continue
                }
                
                track.append(nums[i])
                trackSum += nums[i]
                
                backtrack(&track, i+1)
                
                track.removeLast()
                trackSum -= nums[i]
            }
        }
        
        backtrack(&track, 0)
        
        return res
    }
}

//全排列 II 给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。
class Solution_B7 {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var res: [[Int]] = []
        var track: [Int] = []
        var used = [Bool](repeating: false, count: nums.count)

        func backtrack() {
            
            if track.count == nums.count {
                res.append(track)
                return
            }
            
            for i in 0..<nums.count {
                
                if (used[i]) {
                    continue
                }
                //固定相同的元素在排列中的相对位置
                if i > 0 && nums[i] == nums[i-1] && !used[i-1]{
                    continue
                }
                track.append(nums[i])
                used[i] = true
                backtrack()
                track.removeLast()
                used[i] = false
            }
        }
        
        backtrack()
        print(res)
        return res
    }
}


class Solution_B8 {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        let nums = candidates.sorted()
        var res: [[Int]] = []
        var track: [Int] = []
        var trackSum = 0
        
        func backTrack(_ start: Int){
            
            if trackSum == target {
                res.append(track)
                return
            }
            
            if trackSum > target{
                return
            }
            
            for i in start..<nums.count {
                
                track.append(nums[i])
                trackSum += nums[i]
                // 递归遍历下一层回溯树
                // 同一元素可重复使用
                backTrack(i)
                
                track.removeLast()
                trackSum -= nums[i]
            }
        }
        
        backTrack(0)

        return res
    }
}

//131分割回文串
class Solution_B9 {
    func partition(_ s: String) -> [[String]] {
        var res: [[String]] = []
        var track: [String] = []
        let array = Array(s)
        func backtrack(_ start: Int){
            if start >= s.count {
                res.append(track)
            }
            
            for i in start ..< s.count {
                // 回文则收集，否则跳过
                guard isPalindrome(start, i) else { continue }
                let substring = String(array[start ... i])
                track.append(substring) // 处理
                backtrack(i + 1) // 寻找下一个起始位置的子串
                if !track.isEmpty { track.removeLast() } // 回溯
            }
        }
        
        func isPalindrome(_ start: Int, _ end: Int) -> Bool{
            var left = start
            var right = end
            while left < right{
                if array[left] != array[right]{
                    return false
                }
                left += 1
                right -= 1
            }
            return true
        }
        
        backtrack(0)
        return res
    }
}

// 复原 IP 地址
class Solution_B10 {
    
    func restoreIpAddresses(_ s: String) -> [String] {
           var res = [String]()
           var s = Array(s)
           
           func backtrack(_ start: Int, _ pointCount: Int){
               
               if pointCount == 3 {
                   if isValid(start, s.count-1) {
                       res.append(String(s))
                   }
                   return
               }
               
               for i in start..<s.count {
                   if isValid(start, i){
                       s.insert(".", at: i+1)        //合法,在i的后面插入一个逗点
                       backtrack(i+2, pointCount + 1)    //插入逗点之后下一个子串的起始位置为i+2
                       s.remove(at: i+1)             //回溯删掉逗点
                   }else{
                       break
                   }
               }
           }
           
           // 判断字符串s在左闭又闭区间[start, end]所组成的数字是否合法
           func isValid(_ start: Int, _ end: Int) -> Bool{

               guard start <= end, start >= 0, end < s.count else {
                   return false
               }

               // 0开头的数字不合法
               if start != end, s[start] == "0"{
                   return false
               }

               // 遇到非数字字符不合法
               for i in start...end {
                   let char = s[i]
                   guard char >= "0", char <= "9" else{
                       return false
                   }
               }

               // 如果大于255了不合法
               if Int(String(s[start...end]))! > 255 {
                   return false
               }

               return true
           }

           backtrack(0, 0)
           return res
       }
}
