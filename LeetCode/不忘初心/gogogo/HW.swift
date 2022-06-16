
// 整形数组转字符串输出 : array.map { "\($0)" }.joined(separator: " ")
// 字符串转整形数组:   var list = str.split(separator: " ").map{Int(String($0))!}

//华为机试练习题

import UIKit

func hjTest(){
    let str = readLine() ?? "abc"
    pivotEight(str)

    func pivotEight(_ str: String?){
        
        let strLength = str?.count
        
        var temp = str!
        
        //尾部存在不足8位的
        if strLength! % 8 != 0 {
             temp = temp + "00000000"
         }
        
        //计算出字符串可以拆分成几个8
        let eightCount = temp.count / 8
         
        for _ in 0..<eightCount {
            
            let indexStart = temp.startIndex
            let index = temp.index(indexStart, offsetBy: 8)
            print(String(temp[indexStart..<index]))
            temp.removeFirst(8)
        }
    }
    
    let input = "aabcddd"
    
    //记录字母出现次数的map
      var map = [Character: Int]()
      
      //遍历字符串 统计次数
      for c in input {
          if let count = map[c] {
              map[c] = count + 1
          }else{
              map[c] = 1
          }
      }
    
    var minValue = Int.max
    for (_, value) in map {
        minValue = min(minValue, value)
    }
       
    var res = [Character]()
    for (key, value) in map {
        if value == minValue {
            res.append(key)
        }
    }
    
    let resArr = Array(input).filter {
        !res.contains($0)
    }
    
    print(String(resArr))
    
    
    let n = 3
    var nums = Array(repeating: 1, count: n+1)
    nums[1] = 1
    nums[2] = 1
    for index in 3...n{
        nums[index] = nums[index-1] + nums[index-2]
    }
    print(nums[n])
    
    
    var node = ListNode(1)
    node.next = ListNode(2)
    node.next?.next = ListNode(2)
    node.next?.next?.next = ListNode(1)
    node.next?.next?.next?.next = nil
    var array = [23,2,12,3,45]
    
    let letterArr = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    let numberArr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    let spaceArr = [" "]
    var letterCount = 0
    var numberCount = 0
    var spaceCount = 0
    var otherCount = 0
    for c in input {
          if letterArr.contains(String(c)){
              letterCount += 1
          }else if numberArr.contains(String(c)){
              numberCount += 1
          }else if c == " "{
              spaceCount += 1
          }else {
              otherCount += 1
          }
      }
    print(letterCount, spaceCount, numberCount, otherCount, separator: "\n")
    
}

public class ListNode_HJ {
    public var val: Int
    public var next: ListNode_HJ?
    public init(_ val: Int) {
        self.val = val;
        self.next = nil;
    }
}
func HJ51(){
    
    func buildNode(_ nodeArr: inout [Int]) -> ListNode_HJ? {
        
        var root: ListNode_HJ?
        var node: ListNode_HJ?
        
        while !nodeArr.isEmpty{
            
            let val = nodeArr.removeFirst()
            
            if root == nil {
                root = ListNode_HJ.init(val)
                node = root
            }else{
                node?.next = ListNode_HJ.init(val)
                node = node?.next
            }
        }
        return root
    }


    while let countStr = readLine(), let listStr = readLine(), let kStr = readLine() {
        
        let count = Int(countStr) ?? 0
        var list = listStr.split(separator: " ").map{
            Int(String($0))!
        }
        let k = Int(kStr) ?? 0
        
        var node = buildNode(&list)
        
        //正数节点
        var p = count - k
        var dummy: ListNode_HJ? = node
        while p > 0 {
            dummy = dummy?.next
            p -= 1
        }
        print(dummy!.val)
    }
}

//61
func HJ61(){
    let m = 7
    let n = 3
    
    var arr = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
    
    func resolve(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 1 {
            return 1
        }
        
        if arr[m][n] == 0 {
            if m < n {
                //如果盘子数量多于苹果，说明必定有n-m个盘子会空着，因此必定的事情不会影响方案数
                arr[m][n] = resolve(m,m)
            }else{
                //如果苹果多，则要考虑盘子中是否要放苹果，如果空一个，则要递归(m,n-1)；如果不空，则相当于所有盘子都要放至少一个苹果，这个条件等价于所有盘子都少掉一个苹果的方案数
                arr[m][n] = resolve(m,n-1) + resolve(m-n,n)
            }
        }
        
        return arr[m][n]
    }
    
    print(resolve(m,n))
}

func HJ76(){
    
    var n = 6
    var a = n * (n-1) + 1
    var res = String(a)
    
    while n > 1{
        a += 2
        res += "+\(a)"
        n -= 1
    }
    print(res)
}

func HJ81(){
    let s = "okekwgktczxeposiirjmquypjbohexyinlktaunjyhkjw" //子串
    let t = "yjynxoawaobtbpyxhbqpzdqjehydzfistxtlzrqzdotglpcunfmpvaparnxkmsybwo" //主串
    
    //1统计子串各字母出现次数
    var map: Dictionary<Character, Int> = [Character:Int]()

    
    for char in s {
        map[char] = 1
    }
    
    for char in t {
        if map.keys.contains(char){
            map[char] = map[char]! + 1
        }
    }
    
    var perfect = true
    
    for value in map.keys {
        if map[value] == 1 {
            perfect = false
        }
    }
    
    print(perfect)
//       for char in s {
//           if let record = map[char] {
//               map[char] = record + 1
//           }else{
//               map[char] = 1
//           }
//       }
//
//       //主串中减去子串出现的数量
//       for char in t {
//           if let record = map[char], record > 0{
//               map[char] = record - 1
//           }
//       }
//
//       var isPerfect = true
//
//       //如果记录的map还有说明否
//       for value in map.values{
//           if value > 0{
//               isPerfect = false
//           }
//       }
//       print(isPerfect)
}



//CPU算力
/**
 为了充分发挥GPU算力，需要尽可能多的将任务交给GPU执行。
 现在有一个任务数组，数组元素表示在这1s内新增的任务个数，且每秒都有新增任务。
 假设GPU最多一次执行n个任务，一次执行耗时1s，在保证GPU不空闲的情况下，最少需要多长时间执行完成。
 输入描述：
 第一个参数为GPU最多执行的任务个数，取值范围1-10000
 第二个参数为任务数组的长度，取值范围1-10000
 第三个参数为任务数组，数字范围1-10000
 输出描述：
 执行完所有任务需要多少秒
 示例
 输入：
 3
 5
 1 2 3 4 5
 输出：
 6
 说明：
 一次最多执行3个任务 最少耗时6s
 输入：
 4
 5
 5 4 1 1 1
 输出：
 5
 说明：
 一次最多执行4个任务 最少耗时5s
 (easy,从第一个数往后迭代即可,记录一下每次剩余的量留给下次,最后做一次剩余的处理)
 
 */
func HWTest1(){
    
    let n = 4 //最大执行任务数
    let m = 5 //任务数组
    let listString = "5 4 1 1 1"
    
    let array = listString.split(separator: " ").map{
        Int($0)!
    }
    
    var time = 0
    var more = 0 //记录每次执行多的任务
    
    //走完本身的任务
    for val in array {
        if val + more > n {
            more = more + val - n
        }else{
            more = 0
        }
        time += 1
    }
    
    //处理最后剩下的
    while more > 0{
        more = more - n
        time += 1
    }
    
    print(time)
}


/**
 现在有一队小朋友，他们高矮不同，，我们以正整数数组表示这一队小朋友的身高，如数组{5,3,1,2,3}。
 我们现在希望小朋友排队，以“高”“矮”“高”“矮”顺序排列，每一个“高”位置的小朋友要比相邻的位置高或者相等；每一个“矮”位置的小朋友要比相邻的位置矮或者相等；要求小朋友们移动的距离和最小，第一个从“高”位开始排，输出最小移动距离即可。
 移动距离的定义如下所示：第二位小朋友移到第三位小朋友后面，移动距离为1，若移动到第四位小朋友后面，移动距离为2。
 输入描述：
 排序前的小朋友，以英文空格的正整数：4 3 5 7 8
 小朋友<100个
 输出描述：
 排序后的小朋友，以英文空格分割的正整数：4 3 7 5 8
 输出结果为最小移动距离，只有5和7交换了位置，移动距离都是1
 **/
func HWTest2(){
    let input = "4 1 3 5 2"
    
    var array = input.split(separator: " ").map{
        Int($0)!
    }
    
    for i in 0..<array.count-1 {
        //偶数列 - 高
        if i % 2 == 0 && array[i] < array[i+1] {
            array.swapAt(i, i+1)
        }
        //奇数列 - 矮
        if i % 2 == 1 && array[i] > array[i+1] {
            array.swapAt(i, i+1)
        }
    }
    
//    var res = ""
//    array.forEach { value in
//        res = res  + String(value) + " "
//    }
    
    let res = array.map { "\($0)" }.joined(separator: " ")
    print(res)
}

/***
 给定一组书的长宽，并且只有当一本书的长宽同时小于另一本书的长宽时，两书才能叠放在一起，求改组书中最多能有多少本书叠放在一起
 输入：[[20,16],[15,11],[10,10],[9,10]]
 输出：3，前三本可叠放在一起

 */
func HWTest3(){
    
    var input = "[[20,16],[15,11],[10,10],[9,10]]"
    
    input = input.replacingOccurrences(of: " ", with: "")
    input = input.replacingOccurrences(of: "[[", with: "[")
    input = input.replacingOccurrences(of: " ]]", with: "]")
    input = input.replacingOccurrences(of: "],[", with: "];[")
    let arr = input.split(separator: ";")
    
    var array = [[Int]]()
    
    arr.forEach { value in
        var tempS = value.replacingOccurrences(of: "[", with: "")
        tempS = tempS.replacingOccurrences(of: "]", with: "")
        let tempArr = tempS.split(separator: ",").map{ Int($0)! }
        array.append(tempArr)
    }
    
    let len = array.count
    
    // dp数组 dp[i]表示前i本书的最长子序列长度  默认为1即每个序列本身就是一个子序列，长度为1
    var dp = Array.init(repeating: 1, count: len)
    
    array = array.sorted(by: {
        if  $0[0] != $1[0]{
           return $0[0] < $1[0]
        }else{
           return $0[1] < $1[1]
        }
    })
    
    //结果 默认一本
    var res = 1
    
    for i in 1..<len {
        let curr = array[i]
        for j in 0..<i {
            let pre = array[j]
            if curr[0] > pre[0] && curr[1] > pre[1]{
                dp[i] = max(dp[i], dp[j] + 1)
            }
            res = max(res, dp[i])
        }
    }
    print(res)
}

/**
 括号的最大嵌套深度
 输入一个仅由 "()[]{}" 组成的字符串，计算出有效的括号最大嵌套深度
 输入：([]{()})
 输出：3
 */
func HWTest4(){
    var input = "([)]"
    if input.isEmpty{
        print("")
        return
    }
    var stack = [Character]()
    
    var i = 0
    var depth = 0
    
    for char in input {
        
        if char == "(" || char == "{" || char == "["{
            stack.append(char)
            depth = max(depth, stack.count)
        }else{
            if !stack.isEmpty && ((char == "}" && stack.last == "{") || (char == "]" && stack.last == "[") || (char == ")" && stack.last == "(")){
                stack.removeLast()
            }else{
                break
            }
        }
        i += 1
    }
    
    if i == input.count && stack.count == 0 {
        print(depth)
    }else{
        print(0)
    }
}

/*
 积木宽高相等，长度不等，每层只能放一个或拼接多个积木，每层长度相等，求最大层数，最少2层。
 输入
 给定积木的长度，以空格分隔，例如:3 6 6 3。
 输出
 如果可以搭建，返回最大层数，如果不可以返回-1。

 样例输入
 3 6 6 3
 样例输出
 3
 
 样例输入
 3 5
 样例输出
 -1
 (我运气好看到过这题好几次,原博文里有答案,他用的贪心策略过了,事实上应该是用例比较弱,正解得用DFS+剪枝,我当时第二题没做出来,有点烦,就用贪心策略过了,回去调第二题,正解可参考leetcode 698. 划分为k个相等的子集,比较好转化,稍作修改即可).
 
 **/

func HWTest5(){
    
}

/**
 因式分解：求素数乘积
  输入一个数，求该数的素数乘积
  输入：21
  输出：3 7
 */

func HWTest6(){
    
    let input = "21"
    var num =  Int(input)!
    
    var a = -1
    var b = -1
    
    func isPeime(_ number: Int) -> Bool {

        guard number >= 2 else { return false }
           // 把整数2排除
           guard number != 2 else { return true }
           // ceil(_: )向上取整，sqrt(_: )返回非负的平方根
           let max = Int(ceil(sqrt(Double(number))))
           // 除数只需要从2取到max就可以了
           for i in 2 ... max {
               // 如果能被i整除
               if number % i == 0 {
                   // 则说明它不是素数，直接返回false
                   return false
               }
           }
           return true
    }
    
    let maxNumber = Int(ceil(sqrt(Double(num))))
    for i in 2...maxNumber{
        // 假设i走到了5，5是素数
        if isPeime(i){
            // 35对5能整除 余数0
            if num % i == 0{
                // 检查35对5商7，商是素数
                if isPeime(num / i){
                    a = i
                    b = num / i
                }
            }
        }
    }

    print("\(a)" + " " + "\(b)")
}


/***
 计算矩阵的最大值， 之前做到过原题。
  给定一个仅包含0和1的N*N二维矩阵，请计算二维矩阵的最大值，计算规则如下：
      每行元素按下标顺序组成一个二进制数（下标越大越排在低位），二进制数的值就是该行的值。矩阵各行值之和为矩阵的值。
      允许通过向左或向右整体循环移动每行元素来改变各元素在行中的位置。 比如：
      [1,0,1,1,1]向右整体循环移动2位变为[1,1,1,0,1]，二进制数为11101，值为29。
      [1,0,1,1,1]向左整体循环移动2位变为[1,1,1,1,0]，二进制数为11110，值为30。
  输入描述:
      输入的第一行为正整数，记录了N的大小，0 < N <= 20。
      输入的第2到N+1行为二维矩阵信息，行内元素半角逗号分隔。
  输出描述:
      矩阵的最大值
  https://www.cnblogs.com/huangyuanni/p/15871921.html
 */
func HWTest7(){
    
    let input = "5"
    let n1 = "1,0,0,0,1"
    let n2 = "0,0,0,1,1"
    let n3 = "0,1,0,1,0"
    let n4 = "1,0,0,1,1"
    let n5 = "1,0,1,0,1"

    let tempArr = [n1,n2,n3,n4,n5]
    var n = Int(input)!
    
    func handle(_ arr: [String]) -> Int {
        
        var maxValue = 0
        for i in 0..<arr.count {
            //找到第一个为1的排在最前面
            if arr[i] == "1" {
                var temp = ""
                //先加后半部分
                for m in i..<arr.count {
                    temp = temp + arr[m]
                }
                //再加前半部分
                for n in 0..<i{
                    temp = temp + arr[n]
                }
                maxValue = max(maxValue, Int(temp, radix: 2)!)
            }
        }
        return maxValue
    }
    
    var res = 0
    for i in 0..<n{
        let temp = tempArr[i]
        let tempA = temp.split(separator: ",").map{ "\($0)"}
        res += handle(tempA)
    }
    print(res)
}

/***
 第二题  很简单 日志时间排序，将时间转换成毫秒再排序即可。
 运维工程师采集到某产品线网运行一天产生的日志n条，现需根据日志时间先后顺序对日志进行排序，日志时间格式为H:M:S.N。

 H表示小时(0~23)
 M表示分钟(0~59)
 S表示秒(0~59)
 N表示毫秒(0~999)

 时间可能并没有补全，也就是说，01:01:01.001也可能表示为1:1:1.1。
 https://blog.csdn.net/weixin_47243236/article/details/122550078
 
 输入描述：

 第一行输入一个整数n表示日志条数，1<=n<=100000，接下来n行输入n个时间。
 输出描述：

 按时间升序排序之后的时间，如果有两个时间表示的时间相同，则保持输入顺序。
 示例
 输入
3
23:41:08.023
1:1:09.211
08:01:22.0
输出
 1:1:09.211
 08:01:22.0
 23:41:08.023

 */
func HWTest8(){
    
    var input = "3"
    let n1 = "23:41:08.023"
    let n2 = "1:1:09.211"
    let n3 = "08:01:22.0"
    //实际根据输入 循环添加到数组
    var tempArr = [n1,n2,n3]
    
    let n = Int(input)!
    
    //eg 23:41:08.023
    func getTime(_ str: String) -> Int64 {
        
        let time1 = str.split(separator: ":")
        let time2 = time1[2].split(separator: ".").map{Int64($0)!}
        
        let h = Int64(time1[0])! * 60 * 60 * 1000
        let m = Int64(time1[1])! * 60 * 1000
        let s = time2[0] * 1000
        let n = time2[1]
        
        let res =  h + m + s + n
        return res
    }
    
    tempArr.sort(){
        getTime($0) < getTime($1)
    }
    
    tempArr.forEach {
        print($0)
    }
}

/**
 第二题，是一个关于员工工号问题
  * 创建工号,例如 a1,aa1,aa01
  * 根据人数生成工号,求工号中数字最短长度,比如a1，数字最短为1,aa01,数字最短为01,不能全为字母或者全为数字
  * x表示人数,y表示字母数
  * 输入x(0<x<2^50-1),y(0<y<=5)
  * 输入:26 1
  * 输出:1
  * 输入:260 1
  * 输出:1
  * 输入:2600 1
  * 输出:2
 */
func HWTest9(){
    
    let input = "260 1"
    let arr = input.split(separator: " ")
    
    let x = Int64(arr[0])!
    let y = Int(arr[1])!
    var z = 1
    
    let wordCount = pow(Decimal(26), y)
    let numberCount =  pow(Decimal(10), z)
    
    let word = (wordCount as NSDecimalNumber).int64Value
    let number = (numberCount as NSDecimalNumber).int64Value

    while word * number  < x {
        z += 1
    }
    print("HWTest9")
    print(z)
}

/** 模拟一个连续的内存块，其大小固定为100字节：
 - 1.用户输入"REQUEST=10"表示从内存中分配一个连续的大小为10字节的空间，当分配成功时，输出内存区块的首地址，分配失败(内存空间不足)时输出"error"
- 2.用户输入“RELEASE=0”,表示释放首地址为0所对应的区块，如果不存在相应区块，则输出“error”,反之不输出
属实不会做，随便写了写不会做。*/
func HWTest10(){
    
}

/**
 ** 题目1描述：
 https://www.nowcoder.com/discuss/937877?type=post&order=create&pos=&page=1&ncTraceId=&channel=-1&source_id=search_post_nctrack&gio_id=2FE426E12BEBB291E63F7C6DA416EC79-1652751220817
 
 幼儿园两个班的小朋友在排队时混在了一起，每位小朋友都知道自己是否与前面一位小朋友同班，请你帮忙把同班的小朋友找出来。
 小朋友的编号是整数，与前一位小朋友同班用Y表示，不同班用N表示。
 输入描述：
 输入为空格分开的小朋友编号和是否同班标志。
 输出描述：
 输出为两行，每一行记录一个班小朋友的编号，编号用空格分开，且：

 1.编号需按照升序排列。
 2.若只有一个班的小朋友，第二行为空行。
 比如：
 输入 1/N 2/Y 3/N 4/Y
 输出 1 2
 3 4
 */
func HWTest11(){
    
    let input = "1/N 2/Y 3/N 4/Y"
    let arr = input.split(separator: " ")
    
    //两个set放两个班的同学
    var s1 = Set<Int>()
    var s2 = Set<Int>()
    var is1 = true //默认第一个人是1班的
    
    for (index, str) in arr.enumerated() {
        //每个人信息拿到
        let infoArray = str.split(separator: "/")
        let name = infoArray[0] //编号
        let info = infoArray[1] //和前一个是否一个班的
        //默认把第一个人放到一班
        if index == 0 {
            s1.insert(Int(name)!)
        }else{
            //如果和前面不是一个班 重置下标记
            if info == "N" {
                is1 = !is1
            }
            if is1{
                s1.insert(Int(name)!)
            }else{
                s2.insert(Int(name)!)
            }
        }
    }
    
    print("HWTest11")
    let s1Array = s1.sorted().flatMap{String($0)}
    let resS1 = s1Array.map { "\($0)" }.joined(separator: " ")
    
    let s2Array = s2.sorted().flatMap{String($0)}
    let resS2 = s2Array.map { "\($0)" }.joined(separator: " ")
    //如果二班有人 输出两个班 不然只输出一班
    if s2.count > 0 {
        if s1.first! < s2.first!{
            print(resS1)
            print(resS2)
        }else{
            print(resS2)
            print(resS1)
        }
    }else{
        print(resS1)
    }
}
/**
 题目2描述：
 100个人围成一圈，每个人有一个编码，编号从1开始到100，他们从1开始依次报数，报到为M的人自动退出圆圈，然后下一个人接着从1开始报数，知道剩余的人数小于M，请问最后剩余的人在原先的编号是多少？
 例如输入M=3时，输出为：“58,91”，
 输入为M=4时，输出为：“34,45,97”
 */
public class ListNode_12 {
    public var val: Int
    public var next: ListNode_12?
    public init(_ val: Int) {
        self.val = val;
        self.next = nil;
    }
}

func HWTest12(){
    print("HWTest12")
    let n = 10 //多少人
    let m = 3 //m
//    let k = 1 //从k开始
    
    //初始化头结点
    let header = ListNode_12.init(1)
    var current = header
    //生成链表
    for i in 2...n {
        current.next = ListNode_12.init(i)
        current = current.next!
    }
    //头尾相连
    current.next = header
    
//    //让current结点为第k个编号结点的前一个结点
//    for _ in 1..<k{
//        current = current.next!
//    }
//
    //出列操作
    while current !== current.next! {
        for _ in 1..<m {
            current = current.next!
        }
//        print("\(current.next?.val ?? 0)" + " ")
        current.next = current.next?.next
    }
    print("\(current.next?.val ?? 0)")
}
/**
 题目3描述：
 破解保险箱密码
 小明拥有一个保险箱，但是忘记了密码。已知密码在范围在0~9中，且每位数字仅出现一次。现小明只记得密码是由序列s[]里的数字组成(s[i] ∈ [0, 9], s.length ∈ [1, 10]s[i]∈[0,9],s.length∈[1,10]),密码最少为N位(N ∈ [0, 10]N∈[0,10])，且密码各位上的数字，是从左到右依次递增的。
 已知密码不会为空，请输出所有可能出现的密码。

 输出结果要求: 输出结果需要按位数数字从小到大排列(即字典序)。

 示例1：
 输入： s[] = [2, 5, 3], N = 2
 输出： [[2,3],[2,3,5],[2,5],[3,5]]

 示例2：
 输入：s[] = [2,5,3], N = 0
 输出：[[2],[2,3],[2,3,5],[2,5],[3],[3,5],[5]]

 */
func HWTest13(){
    
    print("HWTest13")
    
    let input1 = "2,5,3"
    let input2 = "2"
    
    var nums = input1.split(separator: ",").map{Int($0)!}
    nums = nums.sorted()
    let N = Int(input2)!
    
    var res = [[Int]]()
    var track = [Int]()

    func backTrack(_ nums: [Int], _ track: inout [Int], _ count: Int, _ index: Int){
        
        if track.count >= count {
            res.append(Array(track))
        }
        
        if index >= nums.count {
            return
        }
        
        for i in index..<nums.count {
            track.append(nums[i])
            backTrack(nums, &track, count, i+1)
            track.removeLast()
        }

    }
    
    backTrack(nums, &track, N, 0)
    
    print(res.map { $0.map{ "\($0)" }.joined(separator: ",") }.joined(separator: " "))
    
}
/**
 猴子爬楼梯，一次可以爬1个台阶或者3个台阶，n个台阶有多少种爬法
 */
func HWTest14(){
    
    let input = "50"
    let n = Int(input)!
    
    var step1 = 1
    var step2 = 1
    var step3 = 2
    var step4 = n == 1 || n == 2 ? 1 : 2
    
    for _ in 4...n{
        step4 = step3 + step1
        step1 = step2
        step2 = step3
        step3 = step4
    }
    
    print("HWTest14")
    print(step4)
}
/**
 给出三个矩形的左上角x、y坐标、长和宽
 求三个矩形相交的面积
 */
func HWTest15(){
    
}
/**
 两个长度为N的二进制进行或操作 (N<=10000000)
 第一个二进制中某两个比特位会进行交换 交换位置随机 只交换这两位数
 各种交换的可能下 结果发生改变的情况有多少种
 前两个题20分钟就做完了
 */
func HWTest16(){
    
}

/**
 最长子序列：给定一个数组array和一个数target，如果array存在连续的几个数相加等于target，返回这几个数的最大个数，否则返回-1
 输入: 1,2,3,4,2
 sum:6
 输出: 3
 */
func HWTest17(){
    let input = "1,2,3,4,2"
    let intArray = input.split(separator: ",").map{Int($0)!}
    let sum = Int("6")!
    
    var max_len = 0
    
    for _ in 0..<intArray.count {
        var tmp_sum = 0
        var sub_len = 0
        for j in 0..<intArray.count {
            if tmp_sum > sum {
                break
            }
            tmp_sum += intArray[j]
            sub_len += 1
            if tmp_sum == sum && sub_len > max_len{
                max_len = sub_len
            }
        }
    }
    
    max_len = max_len == 0 ? -1 : max_len
    print("HWTest17")
    print(max_len)
}


func HWTest18(){
    
}


/**
 停车位：给定一个类似"10000100101"的字符串，1代表有车停着，0代表空车位，求在停车位停车与最近的车之间的最大距离
 输入
       1,0,0,0,0,1,0,0,1,0,1,0,0,1,1,0,0
 输出
       2
 */
func HWTest19(){
    print("HWTest19")
    let input = "1,0,0,0,0,1,0,0,1,0,1,0,0,1,1,0,0"
    let sites = input.split(separator: ",").map{Int($0)!}
    
    var maxLenght = 0
    
    for i in 0..<sites.count {
                
        if sites[i] == 0 {
            var left = 0
            var right = 0
            var j = i - 0
            while j >= 0{
                left = i - j
                if sites[j] == 1 {
                    break
                }
                j -= 1
            }
            var k = i+1
            while k <= sites.count - 1 {
                right = k - i
                if sites[k] == 1 {
                    break
                }
                k += 1
            }
            maxLenght = max(maxLenght, min(left, right))
        }
    }
    print(maxLenght)
}

/**
 /*
喊7 是一个传统的聚会游戏,N个人围成一圈按顺时针从1-7编号,编号为1的人从1开始喊数下一个人喊得数字是上一个人喊得数字+1,但是当将要喊出数字7的倍数或者含有7的话
不能喊出 而是要喊过.
假定N个人都没有失误。当喊道数字k时可以统计每个人喊 “过"的次数,现给定一个长度n的数组,存储打乱的每个人喊”过"的次数,请把它还原成正确顺序

即数组的第i个元素存储编号i的人喊“过“的次数

输入为1行 空格分割的喊过的次数 注意k并不提供k不超过200数字个数为n
输出描述 输出为1行,顺序正确的喊过的次数  空格分割

例子
输入
 0 1 0
输出
 1 0 0
  
只有一次过,发生在7 按顺序编号1的人遇到7  所以100结束时的k不一定是7 也可以是 8 9 喊过都是100

 例子
输入
 0 0 0 2 1
输出
 0 2 0 1 0
一共三次喊过 发生在7 14 17,编号为2 的遇到7 17 编号为4 的遇到14
         */
*/
func HWTest20(){
    
    print("HWTest20")
    
    let input = "0 0 0 2 1"
    
    //计算喊过总次数
    let array = input.split(separator: " ").map{ Int($0)!}

    var total = 0
    
    for value in array{
        total += value
    }
    
    //模拟游戏 按顺序输出m
    var m = Array(repeating: 0, count: array.count) //以人数初始化数组
    var count = 0 //喊7次数
    var pos = 0 //位次
    for i in 1...200{
        //达到人数上线 重新编号
        if pos == m.count {
            pos = 1
        }else{
            pos += 1
        }
        
        if i % 7 == 0 || i % 10 == 7{
            m[pos-1] = m[pos-1]+1
            count += 1
        }
        
        if count == total {
            break
        }
    }
    
    print(m.map{"\($0)"}.joined(separator: " "))
}

/**

 */
