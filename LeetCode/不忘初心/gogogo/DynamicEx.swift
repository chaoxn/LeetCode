
//动态规划专项练习
import UIKit

//509. 斐波那契数
/***
 1确定dp数组以及下标的含义
 dp[i]的定义为：第i个数的斐波那契数值是dp[i]

 2确定递推公式
 状态转移方程 dp[i] = dp[i - 1] + dp[i - 2];

 3dp数组如何初始化
 dp[0] = 0;
 dp[1] = 1;
 4.确定遍历顺序
 从前到后
 */

class Solution_d1 {
    func fib(_ n: Int) -> Int {
        
        if n <= 1 {
            return n
        }
        
        var dp = Array.init(repeating: 0, count: 2)
        dp[0] = 0
        dp[1] = 1
        
        for _ in 2...n{
            let sum = dp[0] + dp[1]
            dp[0] = dp[1]
            dp[1] = sum
        }
        return dp[1]
    }
}

//70. 爬楼梯
class Solution_d2 {
    func climbStairs(_ n: Int) -> Int {
        
        guard n > 2 else {
            return n
        }
        var dp = Array.init(repeating: 0, count: n+1)
        dp[1] = 1
        dp[2] = 2
        
        for i in 3...n{
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n]
    }
}


//746. 使用最小花费爬楼梯
/* 动态规划五部曲：
    1.确定dp[i]的下标以及dp值的含义： 从楼梯第i个台阶向上爬需要支付的费用dp[i]；
    2.确定动态规划的递推公式：dp[i] = min(dp[i - 1] + cost[i - 1], dp[i - 2] + cost[i - 2]);
    3.dp数组的初始化：你可以选择从下标为 0 或下标为 1 的台阶 开始爬楼梯 dp[0] = 0, dp[1] = 0;
    4.确定遍历顺序：分析递推公式可知当前值依赖前两个值来确定，所以递推顺序应该是从前往后；
    5.打印dp数组看自己写的对不对；
*/
class Solution_d3 {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = Array.init(repeating: 0, count: cost.count + 1)
        dp[0] = 0
        dp[1] = 0
        /*
       dp[i]代表从楼梯第i个台阶向上爬需要支付的费用，所以需要到达dp[i]有两种方法：
       1:从dp[i-1]花费cost[i-1]的费用可以到达dp[i];
       2:从dp[i-2]花费cost[i-2]的费用可以到达dp[i];
       需要最少的费用就是两者去最小值；
       */
        for i in 2...cost.count {
            dp[i] = min(dp[i-1] + cost[i-1], dp[i-2]+cost[i-2])
        }
        //注意最后一步可以理解为不用花费，所以取倒数第一步，第二步的最少值
        return dp[cost.count]
    }
}

//62. 不同路径
/*
 1. 确定dp含义: dp[i][j]  从dp[0][0] 到 dp[i][j] 的路径
 2. 确定状态转移方程: dp[i][j] = dp[i-1][j] + dp[i][j-1]
 3. 确定dp初始化数组  dp[i][0] = 1, dp[0][j] = 1
 4. 遍历顺序 从左到右
 **/
class Solution_d4 {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        var dp = Array.init(repeating: [Int].init(repeating: 0, count: n), count: m)
        
        for i in 0..<m{
            dp[i][0] = 1
        }
        
        for j in 0..<n{
            dp[0][j] = 1
        }
        
        for i in 1..<m{
            for j in 1..<n{
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        return dp[m-1][n-1]
    }
}

//63. 不同路径 II
class Solution_d6 {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {

        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        var dp = Array.init(repeating: [Int].init(repeating: 0, count: n), count: m)

        //其他思路和62一致. 不同的是遇到障碍初始化就终止
        for i in 0..<m{
            if obstacleGrid[i][0] == 0{
                dp[i][0] = 1
            }else{
                break
            }
        }
        
        for j in 0..<n{
            if obstacleGrid[0][j] == 0{
                dp[0][j] = 1
            }else{
                break
            }
        }
        
        for i in 1..<m{
            for j in 1..<n{
                //过滤掉遇到障碍的情况
                if obstacleGrid[i][j] == 1 {
                    continue
                }
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        
        return dp[m-1][n-1]
    }
}

//343. 整数拆分
class Solution_d7 {
    func integerBreak(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n + 1)
        for i in 2...n {
            var currentMax = 0
            for j in 1..<i {
                currentMax = max(currentMax, j * (i - j), j * dp[i - j])
            }
            dp[i] = currentMax
        }
        return dp[n]
    }
}

class Solution_d8 {
    func numWays(_ n: Int) -> Int {
        var dp = Array.init(repeating: 0, count: n)
        dp[1] = 1
        dp[2] = 2
        
        for i in 3..<n{
            dp[i] = dp[i-1] + dp[i-2]
        }
        
        return dp[n]
    }
}
