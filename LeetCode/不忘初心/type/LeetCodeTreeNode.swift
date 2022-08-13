//
//  Created by chaox on 2021/12/7.
//


import UIKit

class LeetCodeTreeNode: NSObject {
    //144 前序遍历
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
      
        var res = [Int]()
        reverse(root, &res)
        return res
    }
    
    func reverse(_ root: TreeNode?, _ res: inout [Int]){
        guard root != nil else {
            return
        }
        res.append(root!.val)
        reverse(root?.left, &res)
        reverse(root?.right, &res)
    }

    
    //144迭代
    func preorderTraversal1(_ root: TreeNode?) -> [Int] {
            var result = [Int]()
            if root == nil {
                return result
            }
            // 辅助栈
            var stack = [TreeNode]()
            stack.append(root!)
            while !stack.isEmpty {
                let current = stack.popLast()
                if current != nil {
                    result.append(current!.val)
                } else {
                    continue
                }
                // 栈：先入后出。入栈时先入右，后入左
                if current?.right != nil {
                    stack.append(current!.right!)
                }
                if current?.left != nil {
                    stack.append(current!.left!)
                }
            }
            return result
        }
    
    //104题 二叉树深度 深度优先 递归
    func maxDepthDFS(_ root: TreeNode?) -> Int {

        if root == nil {return 0}
        return compare(maxDepthDFS(root?.left), maxDepthDFS(root?.right)) + 1
    }
    
    func compare(_ A: Int, _ B: Int) -> Int{
        if A > B {return A}
        return B
    }
    
    //借助队列 广度优先
    func maxDepthBFS(_ root: TreeNode?) -> Int {
          guard root != nil else { return 0 }
          var height = 0
          var queue:[TreeNode] = [root!]//辅助队列
          while queue.isEmpty == false {
              for _ in 0..<queue.count {
                  let node = queue.removeFirst()
                  if node.left != nil {
                      queue.append(node.left!)
                  }
                  if node.right != nil {
                      queue.append(node.right!)
                  }
              }
              height += 1
          }
          return height
      }
    
    
    //102题
    func levelOrder(_ root: TreeNode?) -> [[Int]] {

        guard root != nil else { return [] }

        //3种写法
        var res :Array<Array<Int>> = Array()
//        var res1 :[[Int]] = [[]]
//        var res2 = [[Int]]()
        
        var queue:[TreeNode] = [root!]
        
        while queue.isEmpty == false{
            var levelRes : Array<Int> = Array()
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                levelRes.append(node.val)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
            res.append(levelRes)
        }
        return res
    }
    
    //89验证二叉树
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isBST(node: root, min:Int(Int64.min), max:Int(Int64.max))
    }

    func isBST(node: TreeNode?, min: Int,max: Int) -> Bool{

        guard node != nil else { return true }

        if node!.val <= min || node!.val >= max {
            return false
        }
        return isBST(node: node?.left, min: min, max: node?.val ?? 0) &&
        isBST(node: node?.right, min: node?.val ?? 0, max: max)
    }
    
    //700 搜索 迭代解法, 递归的在kotlin
    func searchBST(root: TreeNode?, _ val: Int) -> TreeNode? {
        guard root != nil else { return nil}
        var rootNode = root
        while(rootNode != nil){
            if rootNode?.val == val{
                return rootNode
            }else if rootNode?.val ?? 0 > val {
                rootNode = rootNode?.left
            }else{
                rootNode = rootNode?.right
            }
        }
        return nil
    }
    
    //34
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var res: [Int] = [-1,-1]
        var temp: [Int] = []
        for (index, element) in nums.enumerated(){
            if element == target {
                temp.append(index)
            }
         }
        
        if temp.count == 1{
            res[0] = temp.first!
            res[1] = temp.first!
        }
        
        if temp.count > 1{
            res[0] = temp.first!
            res[1] = temp.last!
        }
        
        return res
    }
    
    //1518   9  3
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {

        var res = numBottles
        var currentBottles = numBottles
        var reminBottles = 0
        
        while currentBottles >= numExchange {
            reminBottles = currentBottles % numExchange
            currentBottles  = currentBottles / numExchange
            res = res + currentBottles
            currentBottles = currentBottles + reminBottles
        }
        
        return res
    }
    
    //637层平均值
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        
        guard root != nil else{ return [] }
        
        var queue :[TreeNode] = [root!]
        var res :[Double] = Array()
        
        while !queue.isEmpty {
            
            let length = queue.count
            var average = 0
            
            for _ in 0..<length {
                let tempNode = queue.first
                queue.removeFirst()
                average = average + tempNode!.val
                
                if tempNode?.left != nil {
                    queue.append((tempNode?.left)!)
                }
                
                if tempNode?.right != nil {
                    queue.append((tempNode?.right)!)
                }
            }
            res.append(Double(average / length))
        }
        return res
    }
    
    //429
    func levelOrder1(_ root: Node?) -> [[Int]] {
           
        guard root != nil else {return []}
        
        var queue :[Node] = [root!]
        var res: Array<Array<Int>> = Array()
        
        while !queue.isEmpty {
            
            let length = queue.count
            var levelRes: Array<Int> = Array()
            
            for _ in 0..<length{
                let tempNode = queue.first
                queue.removeFirst()
                
                for item in tempNode!.children{
                    queue.append(item)
                }
                levelRes.append(tempNode!.val)
            }
            res.append(levelRes)
        }
        
        return res
    }
    
    //226递归
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        
        guard root != nil else {return nil}
        swapChild(root)
        return root
    }
    
    func swapChild(_ root: TreeNode?){
        
        guard root != nil else {return}
        
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        
        swapChild(root?.left)
        swapChild(root?.right)
    }
    
    //226迭代
    func invertTree1(_ root: TreeNode?) -> TreeNode? {
        
        guard root != nil else {return nil}
        var queue :[TreeNode] = [root!]
        
        while !queue.isEmpty {
            
            for _ in 0..<queue.count {
                
                let tempNode = queue.first
                queue.removeFirst()
                let tempLeft = tempNode?.left
                tempNode?.left = tempNode?.right
                tempNode?.right = tempLeft
                
                if tempNode?.left != nil {
                    queue.append((tempNode?.left)!)
                }
                if tempNode?.right != nil {
                    queue.append((tempNode?.right)!)
                }
            }
        }
        return root
    }
    
    //589
    func preorder(_ root: Node?) -> [Int] {
           
        var res = [Int]()
        nRrevserse(root, &res)
        return res
    }
    
    func nRrevserse(_ root: Node?, _ res: inout [Int]){
        
        if root == nil {return}
        res.append(root!.val)
        for item in root!.children{
            nRrevserse(item, &res)
        }
    }
    
    //559
    class Solution {
        func maxDepth(_ root: Node?) -> Int {
            var res = 0
            if root == nil {return res}
            
            var queue = [root!]
            while !queue.isEmpty{

                for _ in 0..<queue.count {
                    let tempNode = queue.first
                    queue.removeFirst()
                    for item in tempNode!.children{
                        queue.append(item)
                    }
                }
                res += 1
            }
            return res
        }
    }
    
    //222 完全二叉树节点数 迭代法
    func countNodes(_ root: TreeNode?) -> Int {
        
        if root == nil {return 0}
        
        var queue :[TreeNode] = [root!]
        var res: Array<Int> = Array()
        
        while !queue.isEmpty {
            
            let length = queue.count
            
            for _ in 0..<length{
                let tempNode = queue.first
                queue.removeFirst()
                
                if tempNode?.left != nil {
                    queue.append((tempNode?.left)!)
                }
                if tempNode?.right != nil {
                    queue.append((tempNode?.right)!)
                }
                
                res.append(tempNode!.val)

            }
        }
        return res.count
    }
    //222
    func countNodes1(_ root: TreeNode?) -> Int {

        if root == nil {return 0}

        return countNodes(root?.left) +  countNodes(root?.right) + 1
    }
    
    //剑22
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        
        guard root != nil else {return nil}
        
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        return mirrorTree(root)
    }
    
    //110 验证平衡二叉树
    func isBalanced(_ root: TreeNode?) -> Bool {
        return getDepth(root) == -1 ? false : true
    }
    
    func getDepth(_ root: TreeNode?) -> Int{
        
        //递归的过程中依然是遇到空节点了为终止，返回0，表示当前节点为根节点的树高度为0
        if root == nil {
            return 0
        }
        
        //-1 表示已经不是平衡二叉树了，否则返回值是以该节点为根节点树的高度
        let leftDepth = getDepth(root?.left)
        if leftDepth == -1 {
            return -1
        }
        
        let rightDepth = getDepth(root?.right)
        if rightDepth == -1 {
            return -1
        }
        
        //单层递归的逻辑 分别求出左右子树的高度，然后如果差值小于等于1，则返回当前二叉树的高度，否则则返回-1，表示已经不是二叉树了。
        return abs(leftDepth - rightDepth) > 1 ? -1 : 1+max(leftDepth, rightDepth)
    }
    
    //110 验证平衡二叉树 另一种写法
    var isBalanced = true
    
    func isBalanced1(_ root: TreeNode?) -> Bool {
        judgeBalance(root)
        return isBalanced
    }
    
    func judgeBalance(_ root: TreeNode?) -> Int{
        
        if root == nil {
            return 0
        }
        
        let leftDepth = judgeBalance(root?.left)
        let rightDepth = judgeBalance(root?.right)
        
        if abs(leftDepth - rightDepth) > 1 {
            isBalanced = false
            return 0
        }
        
        return 1 + max(leftDepth, rightDepth)
    }
    
    //111最小深度 迭代解法
    func minDepth(_ root: TreeNode?) -> Int {

        guard root != nil else {return 0}
        
        var length = 1
        var queue: [TreeNode] = [root!]
        
        while !queue.isEmpty {
            
            for _ in 0..<queue.count {
                
                let temp = queue.removeFirst()
                
                if temp.left != nil {
                    queue.append(temp.left!)
                }
                
                if temp.right != nil {
                    queue.append(temp.right!)
                }
                
                if temp.right == nil && temp.left == nil{
                    return length
                }
            }
            length += 1
        }
        
        return length
    }
    
    //111递归解法
    // 参数返回值:  树 和 高度
    // 终止条件:  树为空return0 或者 左右子树都为空 return1
    // 单层递归条件: 判断左右子树里面最小的一个节点
    /**
     如果节点的左子节点为空，此时同时表示该节点的右子节点不为空，则需要递归求右子节点的深度
     如果节点的右子节点为空，此时同时表示该节点的左子节点不为空，则需要递归求左子节点的深度
     最后返回左子节点深度和右子节点深度的最小值
     */
    func minDepth1(_ root: TreeNode?) -> Int {
        
        if root == nil {
            return 0
        }else if root?.left == nil && root?.right == nil {
            return 1
        }else if root?.left == nil {
            return minDepth1(root?.right) + 1
        }else if root?.right == nil {
            return minDepth1(root?.left) + 1
        }
        return min(minDepth1(root?.right), minDepth1(root?.left)) + 1
    }

    //654最大的树
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {

        let node = TreeNode(0)
         if nums.count == 1 {
             //说明已经遍历到叶子节点了
             node.val = nums[0]
             return node
         }

        
        if nums.count == 0 {
                return nil
            }
            
            var maxValue = 0
            var maxIndex = 0
        
            for (index,element) in nums.enumerated() {
                if element > maxValue{
                    maxValue = element
                    maxIndex = index
                }
            }
        //赋值给node
        node.val = maxValue
        

         //最大值的下标左区间构造左子树
         if maxIndex > 0 {
             let range = 0...maxIndex-1;
             let leftArray = Array(nums[range])
             node.left = constructMaximumBinaryTree(leftArray)
         }
         
         //最大值的下标右区间构造右子树
         if maxIndex < nums.count-1 {
             let range = (maxIndex+1)...nums.count-1
             let rightArray = Array(nums[range])
             node.right = constructMaximumBinaryTree(rightArray)
         }
        
//            let leftArray = Array(nums.prefix(maxIndex < 0 ? 0 : maxIndex))
//            let rightArray = Array(nums.suffix(nums.count-maxIndex-1))
//            tree.left = constructMaximumBinaryTree(leftArray)
//            tree.right = constructMaximumBinaryTree(rightArray)
            return node
    }
    
    //105
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return build(preorder, inorder, 0, preorder.count-1, 0, inorder.count-1)
    }
    
    func build(_ preorder: [Int],
               _ inorder: [Int],
               _ prestart: Int,
               _ preend: Int,
               _ instart: Int,
               _ inend: Int) -> TreeNode? {
        
        if prestart > preend {
            return nil
        }
        
        let tree = TreeNode()
        //先序数组寻找根节点
        let val = preorder[prestart]
        tree.val = val
          
        
        var rootIndex = 0
        //中序数组寻找 左右分割
        for (index, element) in inorder.enumerated(){
            if element == val {
                rootIndex = index
            }
        }
        
        //计算中序左子树的大小
        let leftSize = rootIndex - instart
        
        //先序长度   [根节点] + [左子树] + [右子树]
        //有了左子树的大小 可以确定左子树和右子树的分界点
        
        tree.left = build(preorder, inorder, 1+prestart, prestart+leftSize, instart, rootIndex-1)
        tree.right = build(preorder, inorder, 1+prestart+leftSize, preend, rootIndex+1, inend)
    
        
        return tree
    }
}

//剑32 1
func levelOrder(_ root: TreeNode?) -> [Int] {
    
    guard root != nil else {return []}
    var res: [Int] = []
    //辅助队列
    var queue: [TreeNode] = [root!]
    while (!queue.isEmpty){
        for _ in 0..<queue.count {
            let temp = queue.removeFirst()
            res.append(temp.val)
            if temp.left != nil {
                queue.append(temp.left!)
            }
            if temp.right != nil {
                queue.append(temp.right!)
            }
        }
    }
    return res
}
//剑32 3
func levelOrder(_ root: TreeNode?) -> [[Int]] {

      guard root != nil else {return []}

      var res: Array<Array<Int>> = Array()
      var stack: [TreeNode] = [root!]
      var level = 1

      while !stack.isEmpty {

          var levelArr :[Int] = []
          for _ in 0..<stack.count{
              
              let temp = stack.removeFirst()

              if temp.left != nil {
                  stack.append(temp.left!)
              }
                if temp.right != nil {
                  stack.append(temp.right!)
              }

              //偶数层 倒着来
              if level % 2 == 0{
                  levelArr.insert(temp.val,at:0)
              }else{
                  levelArr.append(temp.val)
              }
              
          }
          level += 1
          res.append(levelArr)
      }
      return res
  }

//剑指 Offer 26. 树的子结构
func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
    
    if A == nil || B == nil{
        return false
    }
    
    // 1、A 的根节点和 B 的根节点相同情况，依次比较它们的子节点
    // 2、A 的根节点和 B 的根节点不相同情况， A 的左子树 VS B 的根节点
    // 3、A 的根节点和 B 的根节点不相同情况， A 的右子树 VS B 的根节点
    return isSub(A, B) || isSubStructure(A?.left,B) || isSubStructure(A?.right,B)
}

func isSub(_ A: TreeNode?, _ B: TreeNode?) -> Bool{
    
    // A 和 B 不匹配的情况有很多，我们需要一开始去找它们完全匹配的情况
    // 即遍历完 B ，直到为 null，说明 B 的全部节点都和 A 的子结构匹配上
    if( B == nil ){
        return true;
    }

    // A 中的节点为空，但 B 中的节点不为空，说明不匹配
    if( A == nil ){
        return false;
    }

    // A 和 B 都不为空 ，但数值不同，说明不匹配
    if(  A?.val != B?.val){
        return false;
    }
    
    // 此时，当前这个点是匹配的，继续递归判断左子树和右子树是否「分别匹配」
      return isSub(A?.left, B?.left) && isSub(A?.right, B?.right);
}


//617. 合并二叉树
func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
    if root1 == nil {
        return root2
    }
    if root2 == nil {
        return root1
    }
    
    root1!.val += root2!.val
    root1?.left = mergeTrees(root1?.left,root2?.left)
    root1?.right = mergeTrees(root1?.right,root2?.right)
    return root1
}

//116. 填充每个节点的下一个右侧节点指针
func connect(_ root: NodeNext?) -> NodeNext? {
    
    guard root != nil else {return nil}
    
    var stack: [NodeNext] = [root!]
    
    while !stack.isEmpty {
        
        var levelArray: [NodeNext] = Array()
        
        for _ in 0..<stack.count{
            let temp = stack.removeFirst()
            
            if temp.left != nil {
                stack.append(temp.left!)
            }
            
            if temp.right != nil {
                stack.append(temp.right!)
            }
            
            levelArray.append(temp)
        }
        
        for (index,value) in levelArray.enumerated(){
            if index < levelArray.count - 1{
                value.next = levelArray[index + 1]
            }
        }
    }
    
    return root
}

func isSymmetric(_ root: TreeNode?) -> Bool {
  
    return root == nil ? true : recur(root?.left, root?.right)
}

// 此函数比较二叉树中位置对称的两个节点
func recur(_ L: TreeNode?, _ R:TreeNode?) -> Bool{
    // 结束条件1：如果对称两个节点都为空，则返回true
    if L == nil && R == nil {return true}
    // 结束条件2：如果单独一个节点为空，另一个节点不为空，又或者是对称节点间的val值不等，则返回false
    if L == nil || R == nil || L?.val != R?.val {return false}
    // 该层符合对称二叉树的要求，开始比较下一层
    return recur(L?.left, R?.right) && recur(L?.right, R?.left)
}


//113

func pathSum(_ root: TreeNode?, _ target: Int) -> [[Int]] {
    
    var res = [[Int]]()
    var track = [Int]()
    
    func backtrack123(_ root:TreeNode?, _ sum: Int){
        
        if root == nil {
            return
        }
        
        //路径更新:将当前节点值 root.val 加入路径 path
        track.append(root!.val)
        
        //目标值更新： tar = tar - root.val（即目标值 tar 从 sum 减至 00 ）；
        let rest = sum - root!.val
        
        if root?.left == nil && root?.right == nil {
            if rest == 0{
                //路径记录： 当 ① root 为叶节点 且 ② 路径和等于目标值 ，则将此路径 path 加入 res 。
                res.append(track)
            }
        }
        //先序遍历： 递归左 / 右子节点
        backtrack123(root?.left, rest)
        backtrack123(root?.right, rest)
        //路径恢复： 向上回溯前，需要将当前节点从路径 path 中删除，即执行 path.pop()
        track.removeLast()
    }
    
    backtrack123(root, target)
    
    return res
}

//J54 第k大节点
func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {

    var res = [Int]()
    
    func recur(_ root: TreeNode?, _ res: inout [Int]){
        
        guard root != nil else {return}
        
        recur(root?.left, &res)
        recur(root?.right, &res)
        res.append(root!.val)
    }
    
    recur(root, &res)
    
    return res[res.count - k]
}

func maxDepth1(_ root: TreeNode?) -> Int {
    
    guard root != nil else {return 0}
    
    var height = 0
    var stack = [TreeNode]()
    stack.append(root!)
    
    while !stack.isEmpty {
        
        height += 1
        for _ in 0..<stack.count{
            let temp = stack.removeFirst()
            if temp.left != nil {
                stack.append(temp.left!)
            }
            if temp.right != nil {
                stack.append(temp.right!)
            }
        }
    }
    
    return height
}

func maxDepth2(_ root: TreeNode?) -> Int {
    
    var color: UIColor

    
    if(root == nil) { return 0 };
    return max(maxDepth2(root?.left), maxDepth2(root?.right)) + 1;
}


func inorderTraversal(_ root: TreeNode?) -> [Int] {
 
    var res: [Int] = []
    reverse(root, &res)
    return res
}

func reverse(_ node: TreeNode?, _ res : inout [Int]){
    guard node != nil else {
        return
    }
    reverse(node?.left, &res)
    res.append(node!.val)
    reverse(node?.right, &res)
}

func levelOrder12(_ root: TreeNode?) -> [[Int]] {
       var res: [[Int]] = []

       guard root != nil else {
           return res
       }

       var stack: [TreeNode] = [root!]

       while !stack.isEmpty {

           var levelArray: [Int] = []

           for _ in 0..<stack.count {

               let tempNode = stack.removeFirst()
               levelArray.append(tempNode.val)
               
               
               if tempNode.left != nil {
                   stack.append(tempNode.left!)
               }
               if tempNode.right != nil {
                   stack.append(tempNode.right!)
               }

           }

           res.append(levelArray)

       }
       return res
   }

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
       
    // 如果树为空，直接返回null
    if root == nil { return nil}
    
    // 如果 p和q中有等于 root的，那么它们的最近公共祖先即为root（一个节点也可以是它自己的祖先）
    if root?.val == p?.val || root?.val == q?.val {
        return root
    }
    
    //遍历左子树
    let left = lowestCommonAncestor(root?.left, p, q)
    let right = lowestCommonAncestor(root?.right, p, q)
    
//    当 leftleft 和 rightright 同时为空 ：说明 rootroot 的左 / 右子树中都不包含 p,qp,q ，返回 nullnull ；
    if left == nil && right == nil {
        return nil
    }
    
    //p,q 都不在root的左子树中，直接返回right
    if left == nil && right != nil {
        return right
    }
    
    //p,q 都不在root的右子树中，直接返回left
    if left != nil && right == nil {
        return left
    }
    
    
    //当 leftleft 和 rightright 同时不为空 ：说明 p, qp,q 分列在 rootroot 的 异侧 （分别在 左 / 右子树），因此 rootroot 为最近公共祖先，返回 root ；
    return root
}
