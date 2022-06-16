

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

//128. 最长连续序列
/***
 输入：nums = [100,4,200,1,3,2]
 输出：4
 解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
 */
class Hot100_11 {
    //排序
    func longestConsecutive(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var count = 1
        var res = 1
        
        for i in 1..<nums.count{
            if nums[i] - nums[i-1] == 1 {
                count += 1
            }else{
                res = max(count, res)
                count = 1
            }
        }
        res = max(count, res)
        return res
    }
    //空间换时间 - map
    func longestConsecutive1(_ nums: [Int]) -> Int {
        let num_set = Set(nums)
        var maxCount = 0
        //遍历nums，如果set中存在nums[i]-1，则表示这个元素不是开始元素，所以不会是最长的连续子序列起点，跳过。
        for num in num_set {
            if !num_set.contains(num-1) {
                var currentNum = num
                var currentCount = 1
                //对于没有nums[i]-1的元素，则表示为起点，开始循环，每次+1，判断是否在set中，并维护变量记录最大值。
                while num_set.contains(currentNum + 1) {
                    currentCount += 1
                    currentNum += 1
                }
                maxCount = max(maxCount, currentCount)
            }
        }
        return maxCount
    }
}

//139. 单词拆分
/***
 输入: s = "applepenapple", wordDict = ["apple", "pen"]
 输出: true
 解释: 返回 true 因为 "applepenapple" 可以由 "apple" "pen" "apple" 拼接成。
      注意，你可以重复使用字典中的单词。
      
 dp[i] 表示 字符串 从 0 到 i 是可以被拆分的 dp[s.count]
 
 如果后续 从 i 到 j 也可以被单词拆分，那么 我们就能得出 dp[j] 是有效的。
 假设 从 字符串 s 中 拿出 两个 坐标 i 和 j,其中 i < j， word_set 为包含的单词集合

 初始态dp[0] = true
 如果 dp[i] = flase, 那么 dp[j] 自然也是 false ,不需要比对了
 如果 dp[i] = true, 那么 如果 word_set 包含子串 s[i..j], 那么 dp[j] = true , 否则 dp[j] = false
 */
class Hot100_12 {
   
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
      let  word_set = Set(wordDict)
      var dp = [Bool](repeating: false, count: s.count + 1)
      dp[0] = true
    
      for j in 1...s.count {
        //! 确定左边边界
        let endIndex = s.index(s.startIndex, offsetBy: j)
          for i in 0..<j {
            //! 找到 一个可行的分割点
            let starIndex = s.index(s.startIndex, offsetBy: i)
            //! 判断当前 i 是可行的 并且 i~j 也是可行的
            if dp[i] && word_set.contains(String(s[starIndex..<endIndex])) {
              dp[j] = true
              break
            }
          }
        }
    
      return dp[s.count]
    }
}


//114. 二叉树展开为链表
class Hot100_13 {
    func flatten(_ root: TreeNode?) {
        guard root != nil else {
            return
        }
        
        //先把左右两边拉直,虽然不知道怎么拉,但是知道这个函数就是拉直就好了
        flatten(root?.left)
        flatten(root?.right)
        
        //已经拉直的左右子树
        let left = root?.left
        let right = root?.right
        
        //左子树置空, 左子树放在右子树上
        root?.left = nil
        root?.right = left
        
        //将原先的右子树接到当前右子树的末端
        // p节点从根节点 指向交换完的左子树末端
        var p = root
        while p?.right != nil{
            p = p?.right
        }
        p?.right = right
    }
}

//输入：nums = [1,2,3]
//输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
class Hot100_14 {
    func permute(_ nums: [Int]) -> [[Int]] {
        
        var res: [[Int]] = []
        var track: [Int] = []
        
        func backtrack(_ track: inout [Int]){
            
            if track.count == nums.count {
                res.append(track)
            }
            
            for i in 0..<nums.count{
                track.append(nums[i])
                backtrack(&track)
                track.removeLast()
            }
        }
        
        backtrack(&track)
        return res
    }
    
}

//打家劫舍
// dp[i][j] , 其中 i 表示截止到 i 这个房子， j 表示这个房子需不需要偷。
//dp[i][0] 表示不偷 i 这个房子的时候，所能得到的最大金额
//dp[i][1] 表示需要偷 i这个房子的时候，所能得到的最大金额。
class Hot100_15 {
    func rob(_ nums: [Int]) -> Int {
        
      if nums.count == 0 {
        return 0
      }
    
      let n = nums.count
      var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
   
      dp[0][0] = 0
      dp[0][1] = nums[0]
    
      for i in 1..<n {
        dp[i][0] = max(dp[i-1][0], dp[i-1][1])
        dp[i][1] = dp[i-1][0] + nums[i]
      }
       return max(dp[n-1][0], dp[n-1][1])
    }
}

//对于 香蕉数组，珂珂 每小时只能选择其中 一堆 去吃香蕉，假设速度是 k， 如果这堆香蕉 小于 k ，则直接吃了， 如果大于，就会剩下一些，等待下一小时去吃，然后我们需要在 守卫回来之前，把所以香蕉都吃掉。 所以我们如果速度够快，每一堆 顶多花费一小时（只有有一个香蕉，我们至少也要一个小时）。现在需要我们求 最小的 速度。
class Hot100_16 {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
      var left = 1
      var right = piles.max()!
      //! 默认值
      var res = right
    
      while left < right {
        let midSpeed = (left + right) / 2
        var curTime = 0
        for pile in piles {
          //! 向上取商
          curTime += (pile + midSpeed - 1)/midSpeed
        }
        //! 当前时间小于 目标，说明可以进一步的减少速度
        if curTime <= h {
          res = midSpeed
          right = midSpeed
        } else {
          left = midSpeed + 1
        }
      }
      return res
    }
}

/***
 dp[i][j]：下标为 i 这一天结束的时候，手上持股状态为 j 时，我们持有的现金数。换种说法：dp[i][j] 表示天数 [0, i] 区间里，下标 i 这一天状态为 j 的时候能够获得的最大利润。其中：

 j = 0，表示当前不持股；
 j = 1，表示当前持股。

 推导状态转移方程：

 dp[i][0]：规定了今天不持股，有以下两种情况：
 昨天不持股，今天什么都不做；
 昨天持股，今天卖出股票（现金数增加）
 
 dp[i][1]：规定了今天持股，有以下两种情况：
 昨天持股，今天什么都不做（现金数与昨天一样）；
 昨天不持股，今天买入股票（注意：只允许交易一次，因此手上的现金数就是当天的股价的相反数）。

 */
class Hot100_17 {
    func maxProfit(_ prices: [Int]) -> Int {
        
        let count = prices.count
        
        if count < 2 {
            return 0
        }
        
        var dp = Array.init(repeating: Array.init(repeating: 0, count: 2), count: count)
        // dp[i][0] 下标为 i 这天结束的时候，不持股，手上拥有的现金数
        // dp[i][1] 下标为 i 这天结束的时候，持股，手上拥有的现金数

        // 初始化：不持股显然为 0，持股就需要减去第 1 天（下标为 0）的股价
        dp[0][0] = 0;
        dp[0][1] = -prices[0];
        
        for i in 1..<count {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i]);
            dp[i][1] = max(dp[i - 1][1], -prices[i]);
        }
        
        return dp[count-1][0]
    }
    
    //用一个指针 实时更新为最新的最低股价，然后 看后面 的股票行情，如果比最低股价高，则尝试当天卖出，得出利润。
    func maxProfit1(_ prices: [Int]) -> Int {
      if prices.count <= 1 {
        //！ 返回不合理数据
        return 0
      }
      //！前面扫描过的 最大利润
      var maxNumber = 0
      //！前面扫描过的最低价格
      var per = prices[0]
      
      for i in 1..<prices.count {
        //！ 如果当前买入时机比之前的小，那么就在当前买入。
        if prices[i] < per {
          per =  prices[i]
        } else {
          //! 当前 i 天 的股价比 之前最低股价要高，我们尝试卖出，得出利润 并与之前的最大利润对比
          maxNumber = max(maxNumber,  prices[i]-per)
        }
        
      }
      return maxNumber
   
    }
}

class Hot100_18{
    //230. 二叉搜索树中第K小的元素
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        
        var res = -1
        var index = 0
        func reverse(_ root: TreeNode?){
            
            guard root != nil else{
                return
            }
            
            reverse(root?.left)
            index += 1
            if index == k {
                res = root!.val
            }
            reverse(root?.right)
        }
        
        reverse(root)
        return res
    }

    //538. 把二叉搜索树转换为累加树
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        
        var sum = 0
        
        func traverse(_ root: TreeNode?){
            
            guard root != nil else{
                return
            }
            
            traverse(root?.right)
            sum += root!.val
            root?.val = sum
            traverse(root?.left)
        }
        
        traverse(root)
        return root
    }
}

/**
 238. 除自身以外数组的乘积
 
 给你一个整数数组 nums，返回 数组 answer ，其中 answer[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积 。
 题目数据 保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内。
 请不要使用除法，且在 O(n) 时间复杂度内完成此题
 输入: nums = [1,2,3,4]
 输出:        [24,12,8,6]
 */

/***
 以前在做这个题的时候，老是搞不清楚边界的处理，看到别的题解说：先求下三角或者再求上三角之类的。今天正好借着【每日一题】系列，终于给搞懂了，不用管上三角或者下三角。见下图就知道了：

 原数组：       [1       2       3       4]
 左部分的乘积：   1       1      1*2    1*2*3
 右部分的乘积： 2*3*4    3*4      4      1
 结果：        1*2*3*4  1*3*4   1*2*4  1*2*3*1
 从上面的图可以看出，当前位置的结果就是它左部分的乘积再乘以它右部分的乘积。因此需要进行两次遍历，第一次遍历用于求左部分的乘积，第二次遍历在求右部分的乘积的同时，再将最后的计算结果一起求出来。
 */

class Hot100_19 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        
        var res = Array(repeating: 0, count: nums.count)
        
        var p = 1
        var q = 1
        
        for i in 0..<nums.count{
            res[i] = p
            p *= nums[i]
        }
        for i in (0 ..< nums.count).reversed() {
            res[i] *= q
            q *= nums[i]
        }

        return res
    
    }
}
