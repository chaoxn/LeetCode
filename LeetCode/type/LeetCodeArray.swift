//
//  Created by chaox on 2021/12/7.
//

import UIKit

class LeetCodeArray: NSObject {
    //27 移除元素
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {

        var slowIndex = 0
        for (index, element) in nums.enumerated(){
            if element != val {
                //快慢指针， 将快指针的值赋给慢指针
                nums[slowIndex] = nums[index]
                slowIndex += 1
            }
         }
        return slowIndex
    }
    
    //26
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var slow = 1
        var fast = 1
        
        while fast < nums.count {
            if nums[fast] != nums[fast - 1]{
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        return fast
    }
    
    //283移动0
    func moveZeroes(_ nums: inout [Int]) {
        var slow = 0
        var fast = 0
        
        while fast < nums.count {
            if nums[fast] != 0{
                //加一个临时变量,交换元素更好点 省去双重遍历
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        
        for index in nums.indices {
            if index >= slow{
                nums[index] = 0
            }
        }
    }
    
    //242 字母异位
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        //判断长度是否相等
        if s.count != t.count {
            return false
        }
        //定义a-z  26个字母对应的数组
        var map = Array(repeating: 0, count: 26)
        
        //初始字母的值
        let unicodeA = "a".unicodeScalars.first!.value
        
        //遍历s的所有编码
        for value in s.unicodeScalars {
            //给每个编码值+1
            map[Int(value.value - unicodeA)] += 1
        }
        
        for value in t.unicodeScalars {
            //给每个编码值+1
            map[Int(value.value - unicodeA)] -= 1

        }
        
        //            //如果当前值遍历完不等于0 说明不是重复的

        for value in map {
                 if value != 0 {
                     return false
                 }
             }
        
        return true
    }
    
    //349数组交集
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        var set = Set<Int>()
            
        //暴力解法
        for valueA in nums1 {
            for valueB in nums2 {
                if valueA == valueB {
                    set.insert(valueA)
                }
            }
        }
        
        //巧妙解法
        var set1 = Set<Int>()
        var set2 = Set<Int>()
        for num in nums1 {
             set1.insert(num)
         }
         for num in nums2 {
             if set1.contains(num) {
                 set2.insert(num)
             }
         }
        
        return Array(set2)
    }
    
/**    350数组交集2
    遍历num1数组，用哈希表记录下每个数字出现的次数
    遍历num2数组，再去哈希表里查是否出现过。是的话，判断哈希表中现存的次数值是否大于0
    如果哈希表值大于0，给存结果的数组加上该值，并将哈希表值减一 */
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
        guard nums1 != nil && nums2 != nil else{
            return []
        }
        var hs = [Int: Int](), res = [Int]()
        for num in nums1 {
            if let record = hs[num] {
                hs[num] = record + 1
            }else { hs[num] = 1 }
        }
        for num in nums2 {
            if let record = hs[num] {
                if record > 0 {
                    res.append(num)
                    hs[num] = record - 1
                }
            }
        }
        return res
     }
    
    //剑3  辣鸡解法
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var array:[Int] = []
        
        for (_, value) in nums.enumerated(){
            if !array.contains(value){
                array.append(value)
            }else{
                return value
            }
        }
        
        return -1
    }
    
    //剑3 O(1)解法
    // 原地交换， 时间O(n), 空间O(1)

    func findRepeatNumber1(_ nums: [Int]) -> Int {
        var index = 0
        
        while index < nums.count{
            // 遍历的索引对应的值等于索引，不动，继续遍历

            if nums[index] == index{
                index += 1
                continue
            }
            // 即nums[i] == num[x]
                // 如果i下标对应的值与下标i的元素值做索引的值相等，说明遇到重复值，返回该元素
            if nums[nums[index]] == nums[index] {
                return nums[index]
            }
            // 不等，交换两值

//            var temp = nums[index]
//            nums[index] = nums[temp]
//            nums[temp] = temp
        }
        
        return -1
    }
    
    //剑 11 旋转数组的最小数字
    // 采用二分法找到旋转点
    // 思路在于：
    // 若中点值小于 nums[right]，说明 (mid,right] 区间内正确升序，无旋转点，旋转点在 [left-mid]之间
    // 若中点值大于 nums[right]，说明(mid,right] 区间内存在旋转点导致了降序，此时令 left=mid+1 继续循环
    // 若中点值刚好与 nums[right]相等，说明存在重复元素，故 right 向左移一（多）位即可。（去重）
    // 值比较一直采用了 nums[right]，因为它与可以配合 nums[mid] 正确地进行区间缩减
    // 如若比较的是 nums[left]，那么对于未旋转的区间，它会一直往右区间做进行进一步查找（然而实际上，它的旋转点就是开头）
    
    func minArray(_ numbers: [Int]) -> Int {
        var right = numbers.count - 1
        var left = 0
        var mid = 0
        // left === right 跳出，找到旋转点
        while (left < right) {
            mid = ((left + right) / 2)
            if (numbers[mid] < numbers[right]) {
                right = mid
            }
            else if (numbers[mid] > numbers[right]) {
                left = mid + 1
            }
            else {
                // 跳过（多个）重复元素 right--
                while (numbers[right] == numbers[mid] && right != mid) {
                    right -= 1
                }
            }
        }
        return numbers[left]
        }
    
}

//977
func sortedSquares(_ nums: [Int]) -> [Int] {

    var res: [Int] = Array.init(repeating: -1, count: nums.count)
    
    //原始数组的左边界和右边界
    var left = 0
    var right = nums.count - 1
    
    //新数组从后往前装填
    var resIndex = res.count - 1
    
    while left <= right {
        
        //选出左右大的一个放到新数组最后边
        if square(nums[left]) > square(nums[right]){
            //左指针右移
            res[resIndex] = square(nums[left])
            left += 1
        }else{
            //右指针左移
            res[resIndex] = square(nums[right])
            right -= 1
        }
        resIndex -= 1
    }
    return res
}

func square(_ value: Int) -> Int{
    return value *  value
}

//不重复元素
/*
 使用异或运算，将所有值进行异或
 异或运算，相异为真，相同为假，所以 a^a = 0 ;0^a = a
 因为异或运算 满足交换律 a^b^a = a^a^b = b 所以数组经过异或运算，单独的值就剩下了
***/
func singleNumber(_ nums: [Int]) -> Int {
    
    var reduce = 0
    for num in nums {
        reduce = reduce ^ num
    }
    return reduce
}


//剑39
func majorityElement(_ nums: [Int]) -> Int {
    
    var map = [Int:Int]()
    for value in nums {
        if let record = map[value] {
            map[value] = record + 1
        }else{
            map[value] = 1
        }
    }
    
    let target = nums.count / 2
    
    for (k,v) in map {
        if v > target {
            return k
        }
    }

    return -1
}


//

func rotate(_ matrix: inout [[Int]]) {
    var temp = [[Int]]()
    
    let m = matrix.count
    let n = matrix[0].count
    
    for i in 0..<m{
        var result = [Int]()
        for j in 0..<n{
            result.append(matrix[m-j-1][i])
        }
        temp.append(result)
    }
    matrix = temp
}


//215 数组中的第K个最大元素

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
       var nums = nums
       let index = quickSelect(&nums, 0, nums.count - 1, nums.count - k)
       return nums[index]
}
   
func quickSelect(_ nums: inout [Int], _ left: Int, _ right: Int, _ index: Int) -> Int {
   guard left < right else { return left}
   let pIndex = randomPartition(&nums, left, right)
   if pIndex == index {
       return pIndex
   } else if pIndex < index {
       return quickSelect(&nums, pIndex + 1, right, index)
   } else {
       return quickSelect(&nums, left, pIndex - 1, index)
   }
}

func randomPartition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
   let index = Int.random(in: left...right)
   nums.swapAt(left, index)
   let pivot = nums[left]
   var leftPt = left
   for i in (left + 1)...right {
       if nums[i] < pivot {
           leftPt += 1
           nums.swapAt(i, leftPt)
       }
   }
   nums.swapAt(left, leftPt)
   return leftPt
}


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var tempDic: Dictionary<Int, Int> = [Int : Int]()
          for i in 0..<(nums.count) {
              let num1: Int = nums[i]  //当前值x
              let num2:Int = target - num1  //目标值target - x
              if tempDic.index(forKey: num2) != nil {
                  //存在则直接返回结果
                  return [i, tempDic[num2] ?? 0]
              } else {
                  //不存在则将x及其对应的下标保存到字典中
                  tempDic[num1] = i
              }
          }
          return []
}

func search(_ nums: [Int], _ target: Int) -> Int {

    var i = 0
    var j = nums.count - 1

    while i < j {
        let mid = (i + j) / 2
        
        if nums[mid] == target {
            return mid
        }else if nums[mid] > target {
            j = mid
        }else if nums[mid] < target {
            i = mid
        }
    }
     
    
    return -1
 }

/***
 public int mySqrt(int x) {
     int low = 0, high = x, res = -1;
     while (low <= high) {
         int mid = low + (high - low) / 2;
         if ((long) mid * mid <= x) {
             res = mid;
             low = mid + 1;
         } else {
             high = mid - 1;
         }
     }
     return res;
 }
*/

//69 x 的平方根 二分查找思路
func mySqrt(_ x: Int) -> Int {
    var low = 0
    var high = x
    var res = -1
    while low <= high {
        let mid = low + (high - low) / 2
        if mid * mid <= x {
            res = mid
            low = mid + 1
        }else{
            high = mid - 1
        }
    }
    return res
}


//16 三数之和
func threeSum(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    var nums = nums
    //排序 变成递增数组
    nums.sort()
    if nums.count < 2 {
        return []
    }
    //-2 保证后面还能有两个数字
    for k in 0..<nums.count-2{
        //若nums[k]大于0，则后面的数字也是大于零（排序后是递增的） 无意义
        if nums[k] > 0 {
            break
        }
        //去重 nums[k]
        if k > 0 && nums[k] == nums[k-1] {
            continue
        }
        var i = k + 1
        var j = nums.count - 1
        
        while i < j {
            let sum = nums[k] + nums[i] + nums[j]
            //记录i和j最初的值 方便后面去重
            let left = nums[i]
            let right = nums[j]
            if sum < 0 {
                //左指针向前 并去重
                while (i < j && nums[i] == left) {
                    i += 1
                }
            }else if sum > 0 {
                //右指针向后 并去重
                while (i < j && nums[j] == right) {
                    j -= 1
                }
            }else{
                res.append([nums[k],nums[i],nums[j]])
                while (i < j && nums[i] == left) {
                    i += 1
                }
                while (i < j && nums[j] == right) {
                    j -= 1
                }
            }
        }
    }
    
    return res
}

//33 搜索旋转排序数组
//  3 4 5 6 7 1 2,     target = 1
//        6
//
//
func searchNew(_ nums: [Int], _ target: Int) -> Int {
    
    if nums.count == 0 {
        return -1
    }
    
    if nums.count == 1 {
        return nums[0] == target ? 0 : -1
    }
    
    var i = 0
    var j = nums.count - 1
    
    while i <= j {
        
        let mid = (j + i) / 2
        
            //比对中间值左边的断点和右边的断点和本身的大小 判断出哪边是有序的.
        if nums[mid] == target {
            return mid
        }
        
    
        //左边有序
        if nums[mid] >= nums[0]{  //判断是否有序
            //中间值比目标值大 并且目标值比数组首个值大,那么目标值就在左区间,此时缩进J
            if nums[mid] > target && target >= nums[0]{  //判断在哪个区间
                j = mid - 1
            }else{
                //反之,目标值在右区间,i前进
                i = mid + 1
            }
            //右边有序
        }else{
            //中间值比目标值小,并且目标值小于右边最大的一个数,那么目标值就在右区间,i前进
            if nums[mid] < target &&  target <= nums[nums.count - 1]{
                i = mid + 1
            }else{
                //反之 j缩进
                j = mid - 1
            }
        }
    }
    
    return -1
}

//48旋转矩阵
func rotate1(_ matrix: inout [[Int]]) {
    guard matrix.count != 0 else {
        return
    }
    
    let n = matrix.count
    // 先沿对角线镜像对称二维矩阵
    for i in 0..<n {
        for j in i..<n{
            let temp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = temp
        }
    }
    // 反转一维数组
    func reverseArray(_ arr: inout [Int]){
        var i = 0
        var j = arr.count - 1
        while i < j {
            arr.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
    
    // 然后反转二维矩阵的每一行
    for (index, _) in matrix.enumerated() {
        reverseArray(&matrix[index])
    }
}


//54螺旋矩阵
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    
    guard matrix.count != 0 else {
        return []
    }
    
    var res: [Int] = []
    //矩阵的长和宽
    let m = matrix.count  //宽
    let n = matrix[0].count //长
    
    //矩阵的四个边界
    var top = 0
    var bottom = m-1
    var left = 0
    var right = n-1
    
    //当结果集数量 = m * n 遍历结束
    while left <= right && top <= bottom {
        
        //上 -> 右 -> 下 -> 左
        
        // 第一步：top: 从左到右遍历 left -> right
        for column in left...right {
            res.append(matrix[top][column])
        }
        
        // 第二步：right: 从上到下遍历 top+1 -> bottom
        if top < bottom {
            for row in top+1...bottom {
                res.append(matrix[row][right])
            }
        }
        
        if left < right && top < bottom {
            // 第三步：bottom：从右到左遍历 right-1 -> left+1
            for i in (left...right-1).reversed() {
                res.append(matrix[bottom][i])
            }
        }
  
        // 第四步：left：从下到上遍历 bottom -> top+1
        if left < right && top < bottom - 1 {
            for i in (top+1...bottom-1).reversed() {
                res.append(matrix[i][left])
            }
        }

        
        // 一层循环结束后，开始下一层循环
        left += 1
        right -= 1
        top += 1
        bottom -= 1
    }
    

    return res
}


//56 合并区间
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
