
import UIKit

//codeTop题
//206 翻转链表
class Solution_1 {
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var curr = head
        var pre: ListNode? = nil

        while curr != nil {
            let temp = curr?.next
            curr?.next = pre
            pre = curr
            curr = temp
        }
        
        return pre?.next
    }
}

//3. 无重复字符的最长子串
class Solution_2 {
    func lengthOfLongestSubstring(_ s: String) -> Int {

        var window = [Character:Int]()
        var maxRes = 0
        var left = 0
        let array = Array(s)
        
        for (index, value) in array.enumerated(){
            //把队列的左边的元素移出，直到满足题目要求
            if window.keys.contains(value){
                left = max(left, window[value]! + 1)
            }
            window[value] = index
            maxRes = max(maxRes, index - left + 1)
        }
        
        return maxRes
    }
}

//146. LRU 缓存
class Solution_3 {
    
    public class LRU_Node{
        var key: Int
        var val: Int
        var next: LRU_Node? = nil
        var prev: LRU_Node? = nil
        
        public init(_ key: Int, _ val: Int){
            self.key = key
            self.val = val
            self.next = nil
            self.prev = nil
        }
    }
    
    public class LRU_DoubleList{
        
        var head: LRU_Node? = nil
        var tail: LRU_Node? = nil
        var size = 0
        
        public init(){
            self.head = LRU_Node.init(0, 0)
            self.tail = LRU_Node.init(0, 0)
            self.head?.next = self.tail
            self.tail?.prev = self.head
            size = 0
        }
        
        //尾部添加节点
        func addLast(_ x: LRU_Node?){
            x?.prev = tail?.prev
            x?.next = tail
            tail?.prev?.next = x
            tail?.prev = x
            size += 1
        }
        
        //删除节点
        func remove(_ x: LRU_Node?){
            x?.prev?.next = x?.next
            x?.next?.prev = x?.prev
            size -= 1
        }
        
        func removeFirst() -> LRU_Node?{
            if head?.next == nil {
                return nil
            }
            
            let first = head?.next
            remove(first)
            return first
        }
        func getSize() -> Int{
            return size
        }
    }
    
    class LRUCache {

        var map = [Int:LRU_Node]()
        var cache: LRU_DoubleList? = LRU_DoubleList.init()
        var cap: Int
        
        init(_ capacity: Int) {
            cap = capacity
        }
        
        /* 将某个 key 提升为最近使用的 */
        func makeRecently(_ key: Int){
            let x = map[key]
            // 先从链表中删除这个节点
            cache?.remove(x)
            // 重新插到队尾
            cache?.addLast(x)
        }
        
        /* 添加最近使用的元素 */
        func addRecently(_ key: Int, _ val: Int){
            let x = LRU_Node.init(key, val)
            // 链表尾部就是最近使用的元素
            cache?.addLast(x)
            // 别忘了在 map 中添加 key 的映射
            map[key] = x
        }
        
        /* 删除某一个 key */
        func deleteKey(_ key: Int){
            let x = map[key]
            // 从链表中删除
            cache?.remove(x)
            // 从 map 中删除
            map.removeValue(forKey: key)
        }
        
        /* 删除最久未使用的元素 */
        func removeLeastRecently(){
            // 链表头部的第一个元素就是最久未使用的
            let deleteNode = cache?.removeFirst()
            // 同时别忘了从 map 中删除它的 key
            let deleteKey = deleteNode?.key
            map.removeValue(forKey: deleteKey!)
        }
        
        func get(_ key: Int) -> Int {
            if !map.keys.contains(key){
                return -1
            }
            // 将该数据提升为最近使用的
            makeRecently(key)
            return map[key]!.val
        }
        
        func put(_ key: Int, _ value: Int) {
            
                if map.keys.contains(key){
                    // 删除旧的数据
                    deleteKey(key)
                    // 新插入的数据为最近使用的数据
                    addRecently(key, value)
                    return
                }
                if cap == cache?.getSize(){
                    // 删除最久未使用的元素
                    removeLeastRecently()
                }
                // 添加为最近使用的元素
                addRecently(key, value)
        }
    }
}

//215. 数组中的第K个最大元素
class Solution_4 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        //快排算出排序好之后的第k大值索引,同时nums也排好序了
        let index = quick_sort(&nums, 0, nums.count-1, nums.count-k)
        return nums[index]
    }
    
    func quick_sort(_ nums: inout [Int], _ left: Int, _ right: Int, _ k: Int) -> Int{
        
        guard left < right else {
            return left
        }
        
        let q = partion(&nums, left, right)
        
        if q == k {
            return k
        }else if (q < k){
            return quick_sort(&nums, q+1, right, k)
        }else{
            return quick_sort(&nums, left, q-1, k)
        }
    }
    
    func partion(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int{
        let povit = nums[right]
        var i = left
        for j in left..<right{
            if nums[j] < povit {
                if i != j {
                    nums.swapAt(i, j)
                }
                i+=1
            }
        }
        nums.swapAt(i, right)
        return i
    }
}

//15. 三数之和
class Solution_5 {
    //核心思想: 双指针+去重
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        let nums = nums.sorted()
        var res: [[Int]] = []
        
        if nums.count < 2 {
            return res
        }
        
        for k in 0..<nums.count - 2{
            
            //大于0 后面的必都大于0 无意义
            if nums[k] > 0 {
                break
            }
            
            //去重
            if k > 0 && nums[k] == nums[k-1]{
                continue
            }
            
            var i = k+1
            var j = nums.count - 1
            
            
            while i < j {
            
                let sum = nums[k] + nums[i] + nums[j]
                //记录原始值 方便后面去重
                let left = nums[i]
                let right = nums[j]
                
                if sum < 0 {
                    //左指针前进
                    while i < j && nums[i] == left{
                        i += 1
                    }
                }else if sum > 0 {
                    //右指针后腿
                    while i < j && nums[j] == right{
                        j -= 1
                    }
                }else{
                    res.append([nums[k],nums[i],nums[j]])
                    //左指针前进
                    while i < j && nums[i] == left{
                        i += 1
                    }
                    //右指针后腿
                    while i < j && nums[j] == right{
                        j -= 1
                    }
                }
            }
        }
        return res
    }
}


//53. 最大子数组和
/**
 int dp = 0;
 // 防止只有负数的情况
 int res = nums[0];
 for (int i = 0; i < nums.length; i++) {
     // 如果 dp[i - 1] < 0，无论如何加上 nums[i - 1]，结果只会更小
     if (dp < 0) dp = nums[i];
     else dp = dp + nums[i];
     res = Math.max(res, dp);
 }
 return res;

 */
class Solution_6 {
    //res = 当前所有数和 + 下一个数
    /**
     发现如果当前和为负值，则与下一个数和必为更小。所以将当前和的所有涉及范围全部清零，重新计算。简单来讲，不断舍弃左侧和小于0的。
     计算过程中，记录最大值
     */
    func maxSubArray(_ nums: [Int]) -> Int {
        var dp = 0
        var res = nums[0]
        for i in 0..<nums.count {
            if dp < 0 {
                dp = nums[i]
            }else{
                dp += nums[i]
            }
            res = max(res, dp)
        }
        return res
    }
    /** 动态规划 设 dp[i] 为以i点为结尾的最大子序和

     dp[i]有两种状态，一种是nums[i]单独作为一个子序列和，一种是nums[i] 和dp[i-1] 和在一起作为子序列和
     因而dp[i]的动态转移方程为：
     dp[i] = max(dp[i-1] + nums[i],nums[i])
     边界条件dp[0] = nums[0]
     */
    func maxSubArray1(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        var res = dp[0]
        
        for i in 1..<nums.count {
            dp[i] = max(dp[i-1] + nums[i], nums[i])
            res = max(dp[i], res)
        }
             
        return res
    }
}

//21. 合并两个有序链表
class Solution_7 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {

        let dummy: ListNode? = ListNode(0)
        var curr = dummy
        var l1 = list1
        var l2 = list2
        
        while l1 != nil && l2 != nil {
            
            if l1!.val < l2!.val{
                curr?.next = l1
                l1 = l1?.next
            }else{
                curr?.next = l2
                l2 = l2?.next
            }
            curr = curr?.next
        }
        
        if l1?.next == nil {
            curr?.next = l2
        }
        if l2?.next == nil{
            curr?.next = l1
        }
        
        return dummy?.next
    }
}

//1. 两数之和
class Solution_8 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
     
        var map = [Int:Int]()
        
        for i in 0..<nums.count {
            let m = nums[i]
            let n = target - nums[i]
            
            if let j = map[n] {
                return [i,j]
            }else{
                map[m] = i
            }
        }
        
        return []
    }
}

//二叉树的层序遍历
class Solution_9 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        guard root != nil else {
            return []
        }
        
        var res = [[Int]]()
        var stack = [root!]
        
        while !stack.isEmpty {
            
            var levelRes = [Int]()
            for _ in 0..<stack.count{
             
                let temp = stack.removeFirst()
                
                if temp.left != nil {
                    stack.append(temp.left!)
                }
                if temp.right != nil {
                    stack.append(temp.right!)
                }
                
                levelRes.append(temp.val)
            }
            res.append(levelRes)
        }
        
        return res
    }
}

//20有效的括号
class Solution_10 {
    func isValid(_ s: String) -> Bool {

        
        var stack = [Character]()
        
        for char in Array(s){
            
            if char == "(" || char == "[" || char == "{"{
                stack.append(char)
            }else{
                
                if (!stack.isEmpty && char == ")" && stack.last == "(")
                    || (!stack.isEmpty && char == "}" && stack.last == "{")
                    || (!stack.isEmpty && char == "]" && stack.last == "[") {
                    stack.removeLast()
                }else{
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
}

//141. 环形链表
class Solution_11 {
    func hasCycle(_ head: ListNode?) -> Bool {
        
        var fast = head
        var slow = head
        
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            
            if fast === slow {
                return true
            }
        }
     
        return false
    }
}

// 二叉树的锯齿形层序遍历
class Solution_12 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {

        var res: [[Int]] = []
        
        guard root != nil else {
            return res
        }
        
        var stack = [root!]
        var line = 1
        
        while !stack.isEmpty {
            
            var levelRes = [Int]()
            
            for _ in 0..<stack.count {

                let temp = stack.removeFirst()
                if line % 2 != 0 {
                    levelRes.insert(temp.val, at: 0)
                }else{
                    levelRes.append(temp.val)
                }
                
                if temp.left != nil {
                    stack.append(temp.left!)
                }
                if temp.right != nil {
                    stack.append(temp.right!)
                }
            }
            
            line += 1
            res.append(levelRes)
        }
        
        return res
    }
}

//33. 搜索旋转排序数组
class Solution_13 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        if nums.count == 0 {
            return -1
        }
        
        if nums.count == 1{
            return nums.first == target ? target : -1
        }
        
        var i = 0
        var j = nums.count - 1
        
        while i <= j {
            
            let mid = (i + j) / 2
            
            if nums[mid] == target{
                return mid
            }
            
            //左边有序
            if nums[mid] >= nums[0] {
                
                if nums[mid] > target && target >= nums[0]{
                    j = mid - 1
                }else{
                    i = mid + 1
                }
            }else{
                if nums[mid] < target && target <= nums[nums.count - 1]{
                    i = mid + 1
                }else{
                    j = mid - 1
                }
            }
        }
        
        return -1
    }
}

//236. 二叉树的最近公共祖先
class Solution_14 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        
        if root == nil || root === p || root === q {
            return root
        }
        
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        
        if left == nil && right == nil {
            return nil
        }
        
        if left == nil {
            return right
        }
        if right == nil {
            return left
        }
        return root
    }
}

//88. 合并两个有序数组
class Solution_15 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var k = m+n-1
        var i = m - 1
        var j = n - 1
        
        while j >= 0 {
            if i >= 0 && nums2[j] <= nums1[i]{
                nums1[k] = nums1[i]
                i -= 1
            }else{
                nums1[k] = nums2[j]
                j -= 1
            }
            k -= 1
        }
    }
}

//5 最长回文子串
class Solution_16 {
    func longestPalindrome(_ s: String) -> String {
        if s.count <= 1 {
            return s
        }
        let array = Array(s)
        var start = 0
        var end = 0
        
        //"babad"
        func findStartAndEnd(_ left: Int, _ right: Int){
            
            var left = left
            var right = right
            
            while left >= 0 && right < array.count && array[left] == array[right]{
                //向两边扩散
                left -= 1
                right += 1
            }
            
            left = left + 1
            right = right - 1
            
            if end - start < right - left {
                start = left
                end = right
            }
        }
        
        for i in 0..<array.count{
            findStartAndEnd(i, i)
            findStartAndEnd(i, i+1)
        }
        
        let strArr = array[start...end]
        return String(strArr)
    }
}

//200. 岛屿数量 回溯
class Solution_17 {
    func numIslands(_ grid: [[Character]]) -> Int {
        
        var res = 0
        var temp = grid
        let m = temp.count
        let n = temp[0].count
        
        func dfs(_ grid: inout [[Character]], _ i: Int, _ j: Int){
            
            let m = grid.count
            let n = grid[0].count
            
            if i < 0 || j < 0 || i >= m || j >= n {
                return
            }
            
            if grid[i][j] == "0"{
                return
            }
            
            grid[i][j] = "0"
            
            dfs(&grid, i+1, j)
            dfs(&grid, i, j+1)
            dfs(&grid, i-1, j)
            dfs(&grid, i, j-1)
        }
        
        for i in 0..<m{
            for j in 0..<n{
                if temp[i][j] == "1"{
                    res += 1
                    dfs(&temp, i, j)
                }
            }
        }
        
        
        return res
    }
}


//46. 全排列
class Solution_18 {
    
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

//142. 环形链表 II
class Solution_19 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        var fast = head
        var slow = head
        
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                break
            }
        }
        
        if fast == nil || fast?.next == nil {
            return nil
        }
        
        fast = head
        
        while fast !== slow {
            fast = fast?.next
            slow = slow?.next
        }
        
        return fast
    }
}

//415. 字符串相加
class Solution_20 {
    func addStrings(_ num1: String, _ num2: String) -> String {
            
        let zero = String.Element("0").asciiValue!
        let numA = Array(num1)
        let numB = Array(num2)
        var add = 0
        var res = ""
        var m = num1.count-1, n = num2.count-1
        while m >= 0 || n >= 0 || add != 0 {
            //swift ascii码取值换算
            let x = m >= 0 ? Int(numA[m].asciiValue! - zero) : 0
            let y = n >= 0 ? Int(numB[n].asciiValue! - zero) : 0
            let cur = x + y + add
            res.append(String(cur % 10))
            add = cur / 10
            m -= 1
            n -= 1
        }
        let result = String(res.reversed())
        return result
    }
}

//螺旋矩阵 - 收缩边界
class Solution_21 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        var res = [Int]()
        let m = matrix.count
        let n = matrix[0].count
        
        var top = 0
        var right = n - 1
        var bottom = m - 1
        var left = 0
        
        while top <= bottom && left <= right {
            
            //上
            for coloum in left ... right {
                res.append(matrix[top][coloum])
            }
            top += 1
            
            //右
            if top < bottom {
                for row in top...bottom{
                    res.append(matrix[row][right])
                }
                right -= 1
            }
            
            //下
            if top < bottom && left < right {
                for column in (left...right).reversed(){
                    res.append(matrix[bottom][column])
                }
                bottom -= 1
            }
           
            //作
            if top < bottom && left < right {
                for row in (top...bottom).reversed(){
                    res.append(matrix[row][left])
                }
                left += 1
            }
        }
        
        return res
    }
}

//143 重排链表
class Solution_22 {
    func reorderList(_ head: ListNode?) {
        //所有节点入栈 获取倒叙结果
        var stack = [ListNode]()
        var p = head
        
        while p != nil {
            stack.append(p!)
            p = p?.next
        }
        
        //指回去
        p = head
        
        while p != nil {
            let lastNode = stack.popLast()
            let next = p?.next
            //结束条件 栈里的最后和原链表的下一个重叠
            if lastNode === next || lastNode?.next === next {
                lastNode?.next = nil
                break
            }
            p?.next = lastNode
            lastNode?.next = next
            p = next
        }
    }
}

//199. 二叉树的右视图
class Solution_23 {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        
        var res = [Int]()
        
        guard root != nil else {
            return res
        }
        
        var stack = [root!]
        
        while !stack.isEmpty {
            
            var levelRes = [Int]()
            for _ in 0..<stack.count {
                
                let temp = stack.removeFirst()
                
                levelRes.append(temp.val)
                
                if temp.left != nil {
                    stack.append(temp.left!)
                }
                if temp.right != nil {
                    stack.append(temp.right!)
                }
            }
            res.append(levelRes.last!)
        }
        
        return res
    }
}

//56. 合并区间
class Solution_24{
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // 获取数组个数
        let count = intervals.count
        // 对数组进行排序(按照起始值从小到大排序)
        let sorted =  intervals.sorted { (interval1, interval2) -> Bool in
            return interval1[0] < interval2[0]
        }
        // 结果数组
        var result: [[Int]] = []
        // 左右区间初始值为第一个区间的值
        var currentLeft = sorted[0][0]
        var currentRight = sorted[0][1]
        for i in 1..<count {
            if sorted[i][0] <= currentRight {
                if sorted[i][1] > currentRight {
                    currentRight = sorted[i][1]
                }
            } else {
                // 无法重合的区间，存入结果数组
                result.append([currentLeft, currentRight])
                // 重置currentLeft currentRight
                currentLeft = sorted[i][0]
                currentRight = sorted[i][1]
            }
        }
        result.append([currentLeft, currentRight])
        return result
    }
}


//删除排序链表中的重复元素 II
class Solution_25 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        let dummy: ListNode? = ListNode(0, head)
        var pre = dummy
        var curr = head
        
        while curr != nil {
            
            while curr?.next != nil && curr?.val == curr?.next?.val {
                //如果遇到相同元素 curr 指向相同元素的最后一个
                curr = curr?.next
            }
            
            if curr !== pre?.next {
                pre?.next = curr?.next
            }else{
                pre = pre?.next
            }
            
            curr = curr?.next
        }
        
        return dummy?.next
    }
}

//232 用栈实现队列
class MyQueue_26 {

    var stack1: [Int] = []
    var stack2: [Int] = []

    init() {

    }
    
    func push(_ x: Int) {
        
        stack1.append(x)
    }
    
    func pop() -> Int {
        peek()
        return stack2.removeLast()
    }
    
    func peek() -> Int {
        if empty(){
            return -1
        }
        
        if stack2.count == 0 {
            
            while !stack1.isEmpty {
                stack2.append(stack1.popLast()!)
            }
        }
        return stack2[stack2.count - 1]
    }
    
    func empty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty
    }
}

//151. 颠倒字符串中的单词
class Solution_27 {
    /*
     1. 去除首位冗余的空格
     2. 从头遍历,确定每一个单词的边界 然后单独反转
     */

    func reverseWords(_ s: String) -> String {
        if s.count == 0 {
            return s
        }
        var trs = [Character](trimAndExtrusionWhitespaces(s)).reversed() as [Character]
        var start = 0, end = 0
        while start < trs.count {
            while end < trs.count && trs[end] != " " {
                end += 1
            }
            reversed(&trs, l: start, r: end - 1)
            end += 1
            start = end
        }
        return String(trs)
    }

    func reversed(_ s: inout [Character], l: Int, r: Int) {
        var i = l, j = r
        while i < j {
            s.swapAt(i, j)
            i += 1
            j -= 1
        }
    }

    func trimAndExtrusionWhitespaces(_ s: String) -> String {
        return s.trimmingCharacters(in: .whitespaces).components(separatedBy: .whitespaces).filter { $0 != "" }.joined(separator: " ")
    }
}


//739. 每日温度
//单调栈问题
class Solution_28 {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        
        var res = [Int](repeating: 0, count: temperatures.count)
        //定义一个栈
        var stack = [Int]()
        
        for i in 0..<temperatures.count{
            /**
                   如果当前遍历的元素 大于栈顶元素，表示 栈顶元素的 右边的最大的元素就是 当前遍历的元素，
                       所以弹出 栈顶元素，并记录
                    如果栈不空的话，还要考虑新的栈顶与当前元素的大小关系,否则的话，可以直接入栈。
                   注意，单调栈里 加入的元素是 下标。
                   */
            
            while !stack.isEmpty && temperatures[i] > temperatures[stack.last!]{
                //因为后面的比他大,他没有价值了 -> 要出栈的栈顶元素
                let last = stack.last
                res[last!] = i - last!
                stack.removeLast()
            }
            //小于等于入栈, 大于等于出栈
            stack.append(i)
        }
        
        return res
    }
}

//502下一个更大元素 I
class Solution_29 {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        var res = [Int].init(repeating: -1, count: nums1.count)
        var stack = [Int]()
        
        //下标元素 -- 下标
        var map = [Int:Int]()
               
        for i in 0..<nums1.count {
            map[nums1[i]] = i
        }
        
        stack.append(0)
        

        for i in 1..<nums2.count{
            //stack.last 不要使用临时变量
            if nums2[i] <= nums2[stack.last!]{
                stack.append(i)
            }else{
                //如果当前遍历的元素 大于栈顶元素，表示 栈顶元素的 右边的最大的元素就是 当前遍历的元素，
                while !stack.isEmpty && nums2[i] > nums2[stack.last!]{
                    //看看栈顶元素是不是数组一中的元素 是的话继续
                    if map.keys.contains(nums2[stack.last!]){
                        //根据map找到栈顶元素在nums1中的下标
                        let index = map[nums2[stack.last!]]!
                        //记录结果集,栈顶元素的右边最大元素就是当前值
                        res[index] = nums2[i]
                    }
                    //弹出栈顶元素
                    stack.removeLast()
                }
                stack.append(i)
            }
        }
        
        return res
    }
}


//503. 下一个更大元素 II
class Solution_30 {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        
        var stack = [Int]()
        var res = [Int].init(repeating: -1, count: nums.count)
        
        //使用取模运算 %可以把下标 ii 映射到数组 numsnums 长度的 0 - N0−N 内
        for i in 0..<nums.count * 2{
            
            while !stack.isEmpty && nums[i % nums.count] > nums[stack.last!]{
                
                res[stack.last!] = nums[i % nums.count]
                stack.removeLast()
            }
            stack.append(i % nums.count)
        }
        
        return res
    }
}
