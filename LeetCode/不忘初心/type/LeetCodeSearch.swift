//
//  Created by chaox on 2021/12/7.
//


import UIKit

//200 岛屿数量
func numIslands(_ grid: [[Character]]) -> Int {

    var temp = grid
    var res = 0
    let m = temp.count      //总个数
    let n = temp[0].count   //每层个数
    
    for i in 0..<m {
        for j in 0..<n{
            //找到一个岛屿 数量+1 并且深度遍历周围是否有为1的岛屿,并且将这座岛淹没 避免重复查询
            if temp[i][j] == "1"{
                res += 1
                dfs(&temp, i, j)
            }
        }
    }
    
    return res
}


func dfs(_ grid: inout [[Character]], _ i: Int, _ j: Int){
    let m = grid.count      //总个数
    let n = grid[0].count   //每层个数
    
    if i < 0 || j < 0 || i >= m || j >= n{
        return
    }
    //已经是海水
    if grid[i][j] == "0"{
        return
    }
    
    //淹没
    grid[i][j] = "0"
    
    //探寻上下左右的岛屿
    dfs(&grid, i+1, j)
    dfs(&grid, i, j+1)
    dfs(&grid, i-1, j)
    dfs(&grid, i, j-1)
}





//1254. 统计封闭岛屿的数目
func closedIsland(_ grid: [[Int]]) -> Int {
    var temp = grid
    var res = 0
    let m = temp.count      //总层数
    let n = temp[0].count   //每层个数
    
    for j in 0..<n{
        //淹掉上边
        dfs1(&temp, 0, j)
        //淹掉下边
        dfs1(&temp, m-1, j)
    }
    
    for i in 0..<m{
        //淹掉左边
        dfs1(&temp, i, 0)
        //淹掉右边
        dfs1(&temp, i, n-1)
    }
    
    //剩下的岛都是封闭岛
    for i in 0..<m {
        for j in 0..<n{
            if temp[i][j] == 0{
                res += 1
                dfs1(&temp, i, j)
            }
        }
    }
    
    return res
}

func dfs1(_ grid: inout [[Int]], _ i: Int, _ j: Int){
    let m = grid.count      //总个数
    let n = grid[0].count   //每层个数
    
    if i < 0 || j < 0 || i >= m || j >= n{
        return
    }
    //已经是海水
    if grid[i][j] == 1{
        return
    }
    
    //淹没
    grid[i][j] = 1
    
    //探寻上下左右的岛屿
    dfs1(&grid, i+1, j)
    dfs1(&grid, i, j+1)
    dfs1(&grid, i-1, j)
    dfs1(&grid, i, j-1)
}


//695. 岛屿的最大面积
func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    var temp = grid
    var res = 0
    let m = temp.count      //总层数
    let n = temp[0].count   //每层个数
    
    for i in 0..<m {
        for j in 0..<n{
            //找到一个岛屿 数量+1 并且深度遍历周围是否有为1的岛屿,并且将这座岛淹没 避免重复查询
            if temp[i][j] == 1{
                var tempCount = 0
                dfs2(&temp, &tempCount,i, j)
                res = max(res, tempCount)
            }
        }
    }
    
    return res
}

func dfs2(_ grid: inout [[Int]],_ count: inout Int ,_ i: Int, _ j: Int){
    
    let m = grid.count      //总层数
    let n = grid[0].count   //每层个数
    
    if i < 0 || j < 0 || i >= m || j >= n{
        return
    }
    //已经是海水
    if grid[i][j] == 0{
        return
    }
    
    //淹没
    grid[i][j] = 0
    count += 1
    
    //探寻上下左右的岛屿
    dfs2(&grid, &count, i+1, j)
    dfs2(&grid, &count, i, j+1)
    dfs2(&grid, &count, i-1, j)
    dfs2(&grid, &count, i, j-1)
}

///回溯问题
/***
 3.怎么样写回溯算法(从上而下，※代表难点，根据题目而变化)
 ①画出递归树，找到状态变量(回溯函数的参数)，这一步非常重要※
 ②根据题意，确立结束条件
 ③找准选择列表(与函数参数相关),与第一步紧密关联※
 ④判断是否需要剪枝
 ⑤作出选择，递归调用，进入下一层
 ⑥撤销选择
 */

// 46全排列
//记录结果
var res: Array<Array<Int>> = Array()

func permute(_ nums: [Int]) -> [[Int]] {
    // 记录「路径」
    var track: Array<Int> = Array()
    backtrack(nums, &track)
    return res
}
// 路径：记录在 track 中
// 选择列表：nums 中不存在于 track 的那些元素
// 结束条件：nums 中的元素全都在 track 中出现
func backtrack(_ nums: [Int], _ track : inout Array<Int>){
    // 触发结束条件
    if track.count == nums.count {
        res.append(Array(track))
        return
    }
    
    for i in 0..<nums.count {
        // 排除已经做出的选择
        if track.contains(nums[i]){
            continue
        }
        // 做选择
        track.append(nums[i])
        // 进入下一层决策树
        backtrack(nums, &track)
        // 取消选择
        track.removeLast();
     }
    // [1,2,3]
    
}

//78子集

var res1: Array<Array<Int>> = Array()

func subsets(_ nums: [Int]) -> [[Int]] {
    var track: Array<Int> = Array()
    backtrack1(nums, 0, &track)
    return res1
}

func backtrack1(_ nums: [Int], _ start: Int, _ track: inout [Int]){
    res1.append(track)
    for i in start..<nums.count {
        track.append(nums[i])
        backtrack1(nums, i+1, &track)
        track.removeLast()
    }
}

//216 组合总和
func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {

    var res: [[Int]] = []
    var track: [Int] = []
    
    func backtrack( _ start: Int, _ tempSum: inout Int){
        
        //剪枝 条件不符合了
        if tempSum > n { return }
        
        if track.count == k  {
            if tempSum == n{
                res.append(track)
            }
            return
        }
        let endIndex = 9
        guard start <= endIndex else { return }
        
        for i in start ... endIndex{
            tempSum += i
            track.append(i)
            backtrack(i+1, &tempSum)
            tempSum -= i
            track.removeLast()
        }
    }
    var sum = 0
    backtrack(1, &sum)
    
    return res
}


//17 电话号码的排列组合
func letterCombinations(_ digits: String) -> [String] {
    
    var res : Array<String> = []
    var s = ""  //子串收集结果
    
    // 按键与字母串映射
    let letterMap = [
        "",
        "", "abc", "def",
        "ghi", "jkl", "mno",
        "pqrs", "tuv", "wxyz"
    ]
    // 把输入的按键字符串转成Int数组  eg: "23" -> [2,3]
    let baseCode = ("0" as Character).asciiValue!
    let digits = digits.map { c in
        guard let code = c.asciiValue else { return -1 }
        return Int(code - baseCode)
    }.filter { $0 >= 0 && $0 <= 9 }
    guard !digits.isEmpty else { return [] }
    
    //index 记录遍历第几个数字 也是树的深度
    func backtrack(_ index: Int){
        if index == digits.count{
            res.append(s)
            return
        }
        
        // 将取出对应的数字  eg:2
        let tempIndex = digits[index]
        // 取数字对应的字符集 eg:"abc"
        let letters = letterMap[tempIndex]
        
        // 遍历
        for letter in letters {
            //处理
            s.append(letter)
            //递归,下一层处理下一个数字
            backtrack(index+1)
            //回溯
            s.removeLast()
        }
    }
    
    backtrack(0)
    return res
}

//78
func subsets1(_ nums: [Int]) -> [[Int]] {
    
    //res 记录结果
    //track 记录每次的回溯路径 也就是每个子集.
    var res = [[Int]]()
    var track = [Int]()
    func backTrack(_ start: Int, _ track: inout [Int]){
            
        res.append(track)
        for i in start..<nums.count {
            track.append(nums[i])
            backTrack(i+1, &track)
            track.removeLast()
        }
    }
        
    backTrack(0, &track)

    
    return res
}

//77
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
