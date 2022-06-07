//
//  Created by chaox on 2021/12/7.
//

import Foundation

func reversePrint(_ head: ListNode?) -> [Int] {
    
    var res: [Int] = []
    var curr = head
        
    while curr != nil {
        res.insert(curr!.val, at: 0)
        curr = curr?.next
    }
    
    return res
}

//剑9
class CQueue {

    var stack1: [Int] = []
    var stack2: [Int] = []
    
    init() {
        
    }
    
    func appendTail(_ value: Int) {
        stack1.append(value)
    }
    
    func deleteHead() -> Int {

        //优秀解法
        if stack2.isEmpty {
                  while let head = stack1.popLast() {
                      stack2.append(head)
                  }
        }
        return stack2.popLast() ?? -1


        //自己解法 其实空间复杂度都一样 
        if !stack1.isEmpty && stack2.isEmpty {
              for _ in stack1.indices {
                  stack2.append(stack1.removeLast())
              }
          }

        if !stack2.isEmpty {
            return stack2.removeLast()
        }
        return -1
    }
}

//剑30
class MinStack {

    var stack1: [Int] = [] //记录入栈的原始栈
    var stack2: [Int] = [] //记录最小值辅助栈
 
    init() {

    }
    
    func push(_ x: Int) {
        stack1.append(x)
       
        if stack2.isEmpty || stack2.last! >= x {
            stack2.append(x)
        }
    }
    
    func pop() {
        if stack1.isEmpty{
            return
        }
        
        let num = stack1.removeLast()
        if num == stack2.last{
            stack2.removeLast()
        }
    }
    
    func top() -> Int {
        return stack1.last ?? 0
    }
    
    func min() -> Int {
        return stack2.last ?? 0
    }
}

//876
func middleNode(_ head: ListNode?) -> ListNode? {
    
    var count = 0
    var curr = head

    while curr != nil {
        curr = curr?.next
        count += 1
    }
    
    curr = head
    var middle = count / 2

    while middle != 0 {
        middle -= 1
        curr = curr?.next
    }
    
//    for _ in 1...middle{
//        curr = curr?.next
//    }
    return curr
}

//876快慢指针解法
func middleNode1(_ head: ListNode?) -> ListNode? {
    
    var slow = head
    var fast = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return slow
}

//19删除链表倒数第n个节点
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    
    guard head != nil else {
        return nil
    }
    
    let dummy = ListNode(0, head)
    //定义快慢指针
    var slow = head
    var fast = head
    var pre = dummy

    //先让快指针走k布
    for _ in 0..<n{
        fast = fast?.next
    }
        
    //然后快慢指针同时走
    while fast != nil {
        pre = slow!
        fast = fast?.next
        slow = slow?.next
    }
    
    pre.next = slow?.next
    return dummy.next
}


//剑18 删除指定节点
func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
    
    let dummy = ListNode(0, head)
    var pre = dummy
    var curr = head
    
    while curr != nil{
        if curr?.val == val {
            pre.next = curr?.next
            break
        }
        curr = curr?.next
        pre = pre.next!
    }
    
    return dummy.next
}

//剑22 倒数第k个链表
// fast.next != nil 会遍历到最后一个非空节点
// fast != nil 会遍历到最后一个节点指向的空间点 nil
/**
 1 -> 2 -> 3 -> 4 -> 5 -> nil
↑ ↑                                 起始
 ↑         ↑                        fast走k补
                ↑         ↑         fast走到nil slow走到倒数第k个节点
 
 */
func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        
    var fast = head
    var slow = head
    
    for _ in 0..<k{
        fast = fast?.next
    }
    
    // fast 指向空节点, slow指向目标节点
    while fast != nil{
        
        fast = fast?.next
        slow = slow?.next
    }
    return slow
}

//剑25 合并两个有序链表
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {


    let dummy = ListNode(0)
    var curr = dummy
    
    var head1 = l1
    var head2 = l2

    while head1 != nil && head2 != nil {
        
        if head1!.val < head2!.val {
            curr.next = head1
            head1 = head1?.next
        }else{
            curr.next = head2
            head2 = head2?.next
        }
        curr = curr.next!
    }
    
    curr.next = head1 == nil ? head2 : head1
    return dummy.next
}


func deleteNode(_ node: ListNode?) {
      //把要删除结点的下一个结点的值赋给要删除的结点
    node?.val = (node?.next!.val)!;
      //然后删除下一个结点
    node?.next = node?.next?.next;
}


func isPalindrome(_ head: ListNode?) -> Bool {
    
    guard head != nil else { return true}
    //快慢指针
    var fast = head
    var slow = head
    
    //快指针走2布 慢指针1步 找到中间节点
    while fast != nil  && fast?.next != nil{
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    //如果快指针最后没有指向nil 说明是奇数个 慢指针向后一个
    /**
      1 -> 2 -> 3 -> 2 -> 1 -> nil
                ↑         ↑
               slow      fast
     
     1 -> 2 -> 2 -> 1 -> nil
               ↑         ↑
              slow      fast
     */
    if fast != nil{
        slow = slow?.next
    }
    
    //翻转后slow部分的链表
    slow = reverse(slow)
    
    //fast重新指回去
    fast = head
    
    //开始判断
    while slow != nil {
        if fast?.val != slow?.val{
            return false
        }
        fast = fast?.next
        slow = slow?.next
    }
    
    return true
}


func reverse(_ head: ListNode?) -> ListNode?{
    
    var curr = head
    var pre : ListNode? = nil
    
    while curr != nil {
        let temp = curr?.next
        //更改当前指针指向
        curr?.next = pre
        //pre和cur 同时向后移动
        pre = curr
        curr = temp
    }
    return pre
}


//02 01
func removeDuplicateNodes(_ head: ListNode?) -> ListNode? {
        
    var dummy = ListNode(0, head)
    var pre = dummy
    var curr = head
    var set = Set<Int>()
    
    while curr != nil {
        
        if set.contains(curr!.val){
            pre.next = curr?.next
        }else{
            set.insert(curr!.val)
            pre = curr!
        }
        curr = curr?.next
    }
    
    return head
}

//02 04
func partition(_ head: ListNode?, _ x: Int) -> ListNode? {

    let sml_Node = ListNode(0)
    let bid_Node = ListNode(0)
    
    var curr = head
    var sml = sml_Node
    var big = bid_Node
    
    while curr != nil{
        
        if curr!.val < x {
            sml.next = curr
            sml = sml.next!
        }else{
            big.next = curr
            big = big.next!
        }
        
        curr = curr?.next
    }
    
    sml.next = bid_Node.next
    big.next = nil
    
    return sml_Node.next
}

func mergeTwoLists1(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    
    var dummy: ListNode? = ListNode(0), p = dummy
    var p1 = list1
    var p2 = list2
    
    while p1 != nil && p2 != nil {
        
        if p1!.val < p2!.val {
            p?.next = p1
            p1 = p1?.next
        }else{
            p?.next = p2
            p2 = p2?.next
        }
        p = p?.next
    }
    
    p?.next = p1 == nil ? p2 : p1
    return dummy?.next
}

//141 环形链表
func hasCycle(_ head: ListNode?) -> Bool {
    
    
    var slow: ListNode? = head
    var fast: ListNode? = head
    
    while fast != nil && fast?.next != nil {
        
        slow = slow?.next
        fast = fast?.next?.next

        if slow === fast{
            return true
        }
    }

    
    return false
}

//面02 02倒数第k个节点
func kthToLast(_ head: ListNode?, _ k: Int) -> Int {
    
    var fast = head
    var slow = head
    
    //快指针走k步
    for _ in 0..<k {
        fast = fast?.next
    }
    
    //快慢指针同时走,走到快指针走到尾
    while fast != nil {
        fast = fast?.next
        slow = slow?.next
    }
    
    return slow!.val
}


/** 225 两个队列实现后入先出的栈
 void push(int x) 将元素 x 压入栈顶。
 int pop() 移除并返回栈顶元素。
 int top() 返回栈顶元素。
 boolean empty() 如果栈是空的，返回 true ；否则，返回 false
 */
class MyStack {

    var res = [Int]()
    
    var queue1 = [Int]()
    var queue2 = [Int]()
    
    init() {

    }
    
//    func push(_ x: Int) {
//
//    }
//    
//    func pop() -> Int {
//
//    }
//    
//    func top() -> Int {
//
//    }
//    
//    func empty() -> Bool {
//
//    }
}

//02 06
func isPalindrome1(_ head: ListNode?) -> Bool {
    
    //定义两个快慢指针
    var fast = head
    var slow = head
    
    //找到中间节点
    //此时slow在中间节点
    while fast?.next != nil && fast != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    // 1 2 3 4 5 nil
    //     -   -
    
    if fast != nil {
        slow = slow?.next
    }
    
    slow = reverse(slow)
    
    fast = head
    
    while slow != nil {
        if fast?.val != slow?.val {
            return false
        }
        fast = fast?.next
        slow = slow?.next
    }
    return true
}

func mergeTwoLists2(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {

    let dummy: ListNode? = ListNode(0)
    var p = dummy
    var l1 = list1
    var l2 = list2
    
    while l1 != nil && l2 != nil {
        if l1!.val < l2!.val {
            p?.next = l1
            l1 = l1?.next
        }else {
            p?.next = l2
            l2 = l2?.next
        }
        p = p?.next
    }
    
    if l1 == nil {
        p?.next = l2
    }else{
        p?.next = l1
    }
    
    return dummy?.next
}

//160 相交链表
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    // p1 指向 A 链表头结点，p2 指向 B 链表头结点
    var p1 = headA
    var p2 = headB
    
    while p1 !== p2 {
        // p1 走一步，如果走到 A 链表末尾，转到 B 链表
        if p1 == nil{
            p1 = headB
        }else{
            p1 = p1?.next
        }
        // p2 走一步，如果走到 B 链表末尾，转到 A 链表
        if p2 == nil{
            p2 = headA
        }else{
            p2 = p2?.next
        }
    }
    return p1
}


//164 LRU缓存策略
//单节点
public class LRUListNode{
    public var val: Int
    public var key: Int
    public var next: LRUListNode?
    public var prev: LRUListNode?

    public init(_ key: Int,_ val: Int){
        self.key = key
        self.val = val
        self.next = nil
        self.prev = nil
    }
}

public class DoubleList{
    //头尾虚节点
    private var head: LRUListNode?
    private var tail: LRUListNode?
    //链表元素数量
    private var size: Int
    
    public init(){
        //新建两个节点 head 和 tail
        self.head = LRUListNode.init(0, 0)
        self.tail = LRUListNode.init(0, 0)
        //初始化双向链表数据  head <-> tail
        self.head?.next = self.tail
        self.tail?.prev = self.head
        size = 0
    }
    
    // 在链表尾部添加节点 x，时间 O(1)
    
//   #                 hashmap[key]                 hashmap[key]
//   #                      |                            |
//   #                      V        -->                 V
//   # prev <-> tail  ...  node                prev <-> node <-> tail
    public func addLast(_ x: LRUListNode?){
        x?.prev = tail?.prev
        x?.next = tail
        tail?.prev?.next = x
        tail?.prev = x
        size += 1
    }
    
    //(删除一个节点不光要得到该节点本身的指针，也需要操作其前驱节点的指针，
    //而双向链表才能支持直接查找前驱，保证操作的时间复杂度 O(1)。)
    
    // 删除链表中的 x 节点（x 一定存在）
    // 由于是双链表且给的是目标 Node 节点，时间 O(1)
    //      hashmap[key]                               hashmap[key]
    //           |                                          |
    //           V              -->                         V
    // prev <-> node <-> next         pre <-> next   ...   node
    func remove(_ x: LRUListNode?){
        x?.prev?.next = x?.next
        x?.next?.prev = x?.prev
        size -= 1
    }
    
    // 删除链表中第一个节点，并返回该节点，时间 O(1)
    func removeFirst() -> LRUListNode? {
        if head?.next === tail {
            return nil
        }
        let first = head?.next
        remove(first)
        return first
    }
    
    // 返回链表长度，时间 O(1)
    func getSize() -> Int{
        return size
    }
}

class LRUCache {
    // key -> Node(key, val)
    var map = [Int:LRUListNode]()
    // Node(k1, v1) <-> Node(k2, v2)...
    var cache: DoubleList? = DoubleList.init()
    //最大容量
    var cap: Int
    
    init(_ capacity: Int) {
        cap = capacity
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
        let x = LRUListNode.init(key, val)
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
}



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
    
    slow = head
    
    while slow !== fast {
        fast = fast?.next
        slow = slow?.next
    }
    
    return slow
}

func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    
    //虚拟头结点
    let dummy: ListNode? = ListNode(0)
    dummy?.next = head
    
    // 初始化指针
    var pre = dummy
    var curr = dummy?.next
    
    // 将指针移到相应的位置
    // pre为要移动的前一个, curr是要移动的指针 指向第一个待反转节点
    for _ in 0..<left-1 {
        pre = pre?.next
        curr = curr?.next
    }
    
    //头插法
    // 初始状态
    //  pre.next = cur
    //  cur.next = temp
    //
    // dummy -> 1 -> 2 -> 3 -> 4 -> 5 -> nil     | 反转 2-4
    //         pre  cur  temp                      | 2是第一个待反转节点, 首先交换2和3
    // dummy -> 1 -> 3 -> 2 -> 4 -> 5 -> nil
    //         pre  temp  cur                     |   2直接指向4  curr?.next = curr?.next?.next, 把temp和pre连起来
    

    for _ in 0..<right-left {
        //当前指针的下一个是要交换的
        let removeTempNode = curr?.next
        curr?.next = curr?.next?.next
        
        removeTempNode?.next = pre?.next
        pre?.next = removeTempNode
    }
    

    return dummy?.next
}


//82 删除排序链表中的重复元素 II
/***
    dummy   ->    1  ->  2   ->  3   ->  3   ->  4   -> null
    pre          cur
 判断2                   pre     cur
 判断1                   pre            cur
    dummy   ->    1  ->  2                   ->  4   -> null
 判断3                   pre           ->         4
 
 */
//不加next 是改变自身走向
//加了next 是改变后续链接走向
func deleteDuplicates(_ head: ListNode?) -> ListNode? {

    var dummy: ListNode? = ListNode(0)
    dummy?.next = head
    var pre = dummy
    var curr = head
    
    while curr != nil {
        //判断1 跳过当前的重复节点，使得cur指向当前重复元素的最后一个位置
        while curr?.next != nil && curr?.val == curr?.next?.val {
            curr = curr?.next
        }
        
        if curr === pre?.next{
            //判断2 pre和cur之间没有重复节点，pre后移
            pre = pre?.next
        }else{
            //判断3 pre->next指向cur的下一个位置（相当于跳过了当前的重复元素）
            //但是pre不移动，仍然指向已经遍历的链表结尾
            pre?.next = curr?.next
        }
        curr = curr?.next
    }
    
    return dummy?.next
}


//148 排序链表
//归并排序思路
/***
 分割 cut 环节： 找到当前链表中点，并从中点将链表断开（以便在下次递归 cut 时，链表片段拥有正确边界）；
 我们使用 fast,slow 快慢双指针法，奇数个节点找到中点，偶数个节点找到中心左边的节点。
 找到中点 slow 后，执行 slow.next = None 将链表切断。
 递归分割时，输入当前链表左端点 head 和中心节点 slow 的下一个节点 tmp(因为链表是从 slow 切断的)。
 cut 递归终止条件： 当head.next == None时，说明只有一个节点了，直接返回此节点。
 
 合并 merge 环节： 将两个排序链表合并，转化为一个排序链表。
 双指针法合并，建立辅助ListNode h 作为头部。
 设置两指针 left, right 分别指向两链表头部，比较两指针处节点值大小，由小到大加入合并链表头部，指针交替前进，直至添加完两个链表。
 返回辅助ListNode h 作为头部的下个节点 h.next。
 时间复杂度 O(l + r)，l, r 分别代表两个链表长度。
 当题目输入的 head == None 时，直接返回None。
 */
func sortList(_ head: ListNode?) -> ListNode? {
    
    guard head != nil || head?.next != nil else {
        return head
    }
    
    var fast = head?.next
    var slow = head
    
    //快慢指针寻找中间节点
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
 
    //中间节点
    var tmp = slow?.next
    
    slow?.next = nil
    
    //开始分治
    var left = sortList(head)
    var right = sortList(tmp)
    var h = ListNode(0)
    var res = h
    
    while left != nil && right != nil {
        if left?.val ?? 0 < right?.val ?? 0{
            h.next = left
            left = left?.next
        }else{
            h.next = right
            right = right?.next
        }
        h = h.next!
    }
    
    h.next = left != nil ? left : right
    
    return res.next
}
