//
//  Created by chaox on 2021/12/7.
//

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }
 
public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

public class NodeNext {
    public var val: Int
   public var left: NodeNext?
   public var right: NodeNext?
   public var next: NodeNext?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
 }

class LeetCodeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(twoSum([3,3],6))
//        print(reverse(x: 1230))
//        print(searchRange([1], 1))
//        numWaterBottles(15, 4)
        print(searchInsert([1,3,5,6],2))
    }

    //1 两数相加
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var tempDic: Dictionary<Int, Int> = [Int : Int]()
        for i in 0..<(nums.count) {
            let num1: Int = nums[i]
            let num2: Int = target - num1
            if tempDic.index(forKey: num2) != nil {
                return[i, tempDic[num2] ?? 0]
            }else{
                tempDic[num1] = i
            }
        }
        return[]
    }
    
    //2
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        if l1 == nil {return l2}
        if l2 == nil {return l1}
        
        //余数
        var addValue = 0
        var curtL1 = l1
        var curtL2 = l2
         
        var resultHead: ListNode? = nil
        var resultCurrent: ListNode? = nil
        
        while curtL1 != nil || curtL2 != nil || addValue != 0 {
            
            let total = (curtL1?.val ?? 0) + (curtL2?.val ?? 0) + addValue
            addValue = total/10
            let node = ListNode.init(total%10)
            if resultCurrent == nil {
                resultHead = node
                resultCurrent = node
            }else{
                //MARK 再理解下
                resultCurrent?.next = node
                resultCurrent = node
            }
            curtL1 = curtL1?.next
            curtL2 = curtL2?.next
        }
        resultCurrent?.next = nil
        return resultHead
    }
    
    //7字符串反转
    func reverse(x: Int) -> Int {
        
        var value = x
        var result = 0

        while (value != 0){
            if (result < Int32.min / 10 || result > Int32.max / 10) {
                return 0;
            }
            let diglt = value%10
            value /= 10
            result = result * 10 + diglt
        }
        return result
    }
    
   

    
    func getHeight(_ root: TreeNode?) -> Int {
        
        if root == nil {return 0}
        
        if root?.left == nil && root?.right != nil {return -1}
        if root?.left != nil && root?.right == nil {return -1}
        
        return 1
    }
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {

        var start = 0
        var end = nums.count - 1
    
        if target < nums[start] {
            return 0
        }
        
        if target > nums[end]{
            return nums.count
        }
        
        while start <= end {
            let half = (start + end) / 2
            
            if (nums[half] > target){
                end = half - 1
            }
            if (nums[half] < target){
                start = half + 1
            }
            if (nums[half] == target){
                return half
            }
        }
        
        return end + 1
    }
}



//20 有效括号
func isValid(_ s: String) -> Bool {
    
    var stack: [Character] = []
    let arrS = Array(s)
    
    for char in arrS {
        if char == "{" || char == "[" || char == "(" {
            stack.append(char)
        }else{
            
            if !stack.isEmpty && ((char == "}" && stack.last == "{") || (char == "]" && stack.last == "[") || (char == ")" && stack.last == "(")){
                stack.removeLast()
            }else{
                return false
            }
        }
    }
    
    return stack.isEmpty
}


//22括号生成
/**1、一个「合法」括号组合的左括号数量一定等于右括号数量，这个很好理解。
 2、对于一个「合法」的括号字符串组合 p，必然对于任何 0 <= i < len(p) 都有：子串 p[0..i] 中左括号的数量都大于或等于右括号的数量。
 */
func generateParenthesis(_ n: Int) -> [String] {
    
    var res: [String] = []
    
    func dfs(_ paths: String, _ left: Int, _ right: Int){
        
        //right > left是因为右括号在生成过程中不能大于左括号  eg:“())(”
        if left > n || right > left {
            return
        }
        
        //括号是成对出现的
        if paths.count == n * 2{
            res.append(paths)
            return
        }
        //left与right参数，分别代表左括号与右括号的数量，每生成一个就增加一个
        dfs(paths + "(", left + 1, right)
        dfs(paths + ")", left, right+1)
    }
    
    dfs("", 0, 0)
    
    return res
}

