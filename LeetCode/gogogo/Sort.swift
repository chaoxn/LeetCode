
//前中后序遍历、各种排序、各种链表操作、kmp求next。
import UIKit

//归并排序
func mergeSort(_ array: [Int]) -> [Int]{
    return merge(array)
}
//分治
func merge(_ array: [Int]) -> [Int]{
    
    if array.count <= 1 {
        return array
    }
    
    let tempArray = array
    let count = array.count
    let middle = (count - 1)/2
    
    let leftArray = merge(Array(tempArray[0...middle]))
    let rightArray = merge(Array(tempArray[middle+1...count-1]))
    
    return sortMerge(leftArray, rightArray)
}

//合并
func sortMerge(_ leftArr: [Int], _ rightArr:[Int]) -> [Int]{
    var res = [Int]()
    var p = 0, q = 0
    
    while p < leftArr.count && q < rightArr.count{
        if leftArr[p] < rightArr[q]{
            res.append(leftArr[p])
            p += 1
        }else{
            res.append(rightArr[q])
            q += 1
        }
    }
    
    if p == leftArr.count {
        res.append(contentsOf: rightArr[q...rightArr.count-1])
    }else{
        res.append(contentsOf: leftArr[p...leftArr.count-1])
    }
    return res
}


//选择排序
//每一轮选择最大值和最后一个元素交换位置。
func selectSort(_ array: inout [Int]){
    //外层循环从头到尾遍历[0,array.count)  目的:交换最大值
    for i in 0..<array.count-1{
        //假设第一个为最大值
        var maxIndex = 0
        //内层循环从0到已经排好序的前一个元素遍历  目的:找最大值索引
        for j in 0..<array.count-i{
            //如果当前元素小于等于后一个元素,交换最大值坐标
            if array[maxIndex] <= array[j]{
                maxIndex = j
            }
        }
        //获取最大值坐标元素,与当前位置元素交换
        let temp = array[maxIndex]
        array[maxIndex] = array[array.count-1-i]
        array[array.count-1-i] = temp
    }
}

//插入排序
//把最小的元素插到最前面
func insertionSort(_ array: inout [Int]){
    //外循环边界从1开始 [1,array.count)
    for i in 1..<array.count {
        //内循环边界从i开始, 每层内循环依次判断当前数字和前面所有元素的大小.
        var j = i
        //如果当前的元素比前一个元素小，则调换位置；反之进行下一个外层循环。
        while j > 0 && array[j] < array[j-1]{
            array.swapAt(j-1, j)
            j -= 1
        }
    }
}

//快速排序
func sort(_ sourceArr: inout [Int]){
    quickSort(&sourceArr, 0, sourceArr.count-1)
}

private func quickSort(_ sourceArr: inout [Int], _ left: Int, _ right: Int) {
    guard left < right else {
        return
    }
    let q = partion(&sourceArr, left, right)
    quickSort(&sourceArr, left, q-1)
    quickSort(&sourceArr, q+1, right)
}

//分区函数
private func partion(_ sourceArr: inout [Int], _ left: Int, _ right: Int) -> Int {
    let pivot = sourceArr[right]
    var i = left
    for j in left..<right {
        if sourceArr[j] < pivot {
            if i != j {
                //自己和自己交换没有意义
                sourceArr.swapAt(i, j)
            }
            i+=1
        }
    }
    sourceArr.swapAt(i, right)
    return i
}

         
func bubbleSort(_ array: inout [Int]){
    for i in 0..<array.count-1{
        var sorted = true
        for j in 0..<array.count-1-i{
            if array[j] > array[j+1]{
                let temp = array[j]
                array[j] = array[j+1]
                array[j+1] = temp
                sorted = false
            }
        }
        if sorted {
            break
        }
    }
}


class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        quickSort(&nums, 0, nums.count - 1)
        return nums
    }

    func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int){
        guard left < right else {
            return
        }
        
        let middle = sort(&nums, left, right)
        quickSort(&nums, left, middle-1)
        quickSort(&nums, middle+1, right)
    }
    
    func sort(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int{
        let pivot = nums[right]
        var i = left
        for j in left..<right{
            if nums[j] < pivot {
                if j != i {
                    nums.swapAt(i, j)
                }
                i += 1
            }
        }
        nums.swapAt(i, right)
        return i
    }
    // 12 23 2 14 5
}



class Solution_s1{
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        quickSort(&nums, 0, nums.count-1)
        return nums
    }
    
    func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int){
        
        guard left < right else {
            return
        }
        
        let mid = sort(&nums, left, right)
        quickSort(&nums, left, mid-1)
        quickSort(&nums, left+1, right)
    }
    
    func sort(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int{
        //把最右边的当做基准值
        let povit = right
        var i = left
        for j in left..<right {
            //最左边的依次和基准值比大小,比基准值小的 放在最前面
            if nums[i] < nums[povit] {
                if j != i {
                    nums.swapAt(i, j)
                }
            }
            i += 1
        }
        nums.swapAt(i, right)
        return i
    }
}

class Solution_s2 {
    
}












