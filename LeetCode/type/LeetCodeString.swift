//
//  Created by chaox on 2021/12/7.
//


import Foundation

//344反转
func reverseString(_ s: inout [Character]) {
    var start = 0
    var end = s.count - 1
    
    while start < end {
        let temp = s[start]
        s[start] = s[end]
        s[end] = temp
        start += 1
        end -= 1
    }
    
}

//剑2 4  把字符串 s 中的每个空格替换成"%20"。
func replaceSpace(_ s: String) -> String {
    var strArr = Array(s)
    var count = 0
    
    //统计空格个数
    for s in strArr {
        if s == " "{
            count += 1
        }
    }
    // left 指向旧数组的最后一个元素
    var left = strArr.count - 1
    // right 指向扩容后数组的最后一个元素（这里还没对数组进行实际上的扩容）
    var right = strArr.count + count * 2 - 1
    
    //填充
    for _ in 0..<count*2 {
        strArr.append(" ")
    }
    
    //从后往前判断判断
    while left < right {
        if strArr[left] == " "{
            strArr[right] = "0"
            strArr[right - 1] = "2"
            strArr[right - 2] = "%"
            left -= 1
            right -= 3
        }else{
            strArr[right] = strArr[left]
            left -= 1
            right -= 1
        }
    }

    return String(strArr)
}

//剑指 Offer 50. 第一个只出现一次的字符
func firstUniqChar(_ s: String) -> Character {
    
    
    let arr = Array(s)
    //定义一个哈希表记录 字母:是否重复出现
    //出现一次 true  出现多次,置位false
    var dic: Dictionary<Character, Bool> = [Character: Bool]()

    //找出第一个true的
    for (_,element) in arr.enumerated(){
        dic[element] = !dic.keys.contains(element)
    }
    
    for value in arr {
        if dic[value]! {
            return value
        }
    }
    return " "
}



//3
func lengthOfLongestSubstring(_ s: String) -> Int {
    
    //出现的字母 和出现的位置
    var window: [Character:Int] = [:]
    
    var maxLenght = 0
    var left = 0
    let array = Array(s)
    
    for (index, element) in array.enumerated() {
       
        //2如果当前字符 ch 包含在 map中
        
        /**
         a）当前字符包含在当前有效的子段中，如：abca，当我们遍历到第二个a，当前有效最长子段是 abc，我们又遍历到a，
        那么此时更新 left 为 window[a]+1=1，当前有效子段更新为 bca；
        
        b）当前字符不包含在当前最长有效子段中，如：abba，我们先添加a,b进map，此时left=0，我们再添加b，发现map中包含b，
        而且b包含在最长有效子段中，就是1）的情况，我们更新 left=map.get(b)+1=2，此时子段更新为 b，而且map中仍然包含a，map.get(a)=0；
        随后，我们遍历到a，发现a包含在map中，且map.get(a)=0，如果我们像1）一样处理，就会发现 left=map.get(a)+1=1，实际上，left此时应该不变，left始终为2，子段变成 ba才对。
         
         
         为了处理以上2类情况，我们每次更新left，left=Math.max(left , map.get(ch)+1).
        另外，更新left后，不管原来的 s.charAt(i) 是否在最长子段中，我们都要将 s.charAt(i) 的位置更新为当前的i，因此此时新的 s.charAt(i) 已经进入到 当前最长的子段中！
         
         */
        
        //left不能后退 针对上述情况2
        if let curr = window[element] {
            left = max(curr + 1, left)
        }
    
        //1首先，判断当前字符是否包含在map中，如果不包含，将该字符添加到map（字符，字符在数组下标）
        //此时没有出现重复的字符，左指针不需要变化。此时不重复子串的长度为：i-left+1，与原来的maxLen比较，取最大值
        window[element] = index
        maxLenght = max(maxLenght, index - left + 1)
    }
    return maxLenght
}

//567. 字符串的排列
func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    
    //S1中出现的次数
    var need :Dictionary<Character, Int> = [Character:Int]()
    var window: Dictionary<Character, Int> = [Character: Int]()
    
    //统计子串中字符出现的次数
    for value in s1 {
        if (need[value] != nil){
            need[value]! += 1
        }else {
            need[value] = 1
        }
    }
    
    
    
    
    
    
    return false
}

//76
func minWindow(_ s: String, _ t: String) -> String {
    
    var need :Dictionary<Character, Int> = [Character:Int]()
    var window: Dictionary<Character, Int> = [Character: Int]()
    
    //统计子串中字符出现的次数
    for value in s {
        if (need[value] != nil){
            need[value]! += 1
        }else {
            need[value] = 1
        }
    }
    
    //
//    var left = 0, right = 0
//    var valid = 0
//    //记录最小覆盖子串的起始索引及长度
//    var start = 0, len = Int.max
//
//    while right < s.count {
//        let c = s.index(s.startIndex, offsetBy: right)
//        right += 1
//
//
//
//    }
    
    return ""
}

func reverseString1(_ s: inout [Character]) {

    var slow = 0
    var fast = s.count - 1
    while slow <= fast{
        let temp = s[slow]
        s[slow] = s[fast]
        s[fast] = temp
        slow += 1
        fast -= 1
    }
}

func firstUniqChar1(_ s: String) -> Int {
    
    var map = [Character:Int]()
        
    for (_,c) in s.enumerated() {
        if let record = map[c]{
            map[c] = record + 1
        }else{
            map[c] = 1
        }
    }
    
    for (k,c) in s.enumerated(){
        if map[c] == 1{
            return k
        }
    }
    
    return -1
}

//有效的字母异位
func isAnagram(_ s: String, _ t: String) -> Bool {

    var hashMap = [Character:Int]()

    for char in s {
        if let record = hashMap[char] {
            hashMap[char] = record + 1
        }else{
            hashMap[char] = 1
        }
    }
    
    for char in t {
        if (hashMap[char] != nil) {
            hashMap[char]! -= 1
        }else{
            hashMap[char] = 1
        }
    }
    
    for value in hashMap.values{
        if value > 0{
            return false
        }
    }

    return true
}

//是否是回文串
func isPalindrome(_ s: String) -> Bool {
    
    let tempS = s.lowercased()

    let arr = Array(tempS)
    
    var slow = 0
    var fast = arr.count - 1
    
    while slow <= fast{
        
        while slow < fast && !(arr[slow].isLetter || arr[slow].isNumber){
            slow += 1
        }
        
        while (slow < fast && !(arr[fast].isLetter || arr[fast].isNumber)){
            fast -= 1
        }
        if arr[slow] == arr[fast] {
            slow += 1
            fast -= 1
        }else{
            return false
        }
    }
    
    return true
}


//5最长回文子串
//func longestPalindrome(_ s: String) -> String {
//
//
//    func palindrome(_ s: String, _ left: Int, _ right: Int) -> String {
//
//        var l = left
//        var r = right
//
//        while l >= 0 && r < s.count && Array(s)[l] ==  Array(s)[r]{
//            l -= 1
//            r += 1
//        }
//        let start = s.index(s.startIndex, offsetBy: l+1)
//        let end = s.index(s.startIndex, offsetBy: r)
//        let str = s[start...end]
//        return String(str)
//    }
//    
//
//    var res = ""
//
//    for i in 0..<s.count {
//
//        let s1 = palindrome(s, i, i)
//        let s2 = palindrome(s, i, i+1)
//        res = res.count > s1.count ? res : s1
//        res = res.count > s2.count ? res : s2
//    }
//
//    return res
//}


//最长公共前缀
func longestCommonPrefix(_ strs: [String]) -> String {
    
    if (strs.count == 0){
        return ""
    }
    //随机取数组一个字符串，定义为 默认结果
    var result = strs[0]
    
    for str in strs {
        //遍历各个字符串 与 默认结果 比较，只要不完全一样就while循环，缩短默认结果直到符合当前取值有 头部重合
        while ( !str.hasPrefix(result) ){
            //缩短到长度0 也就是找不到 return
            if (result.count == 0){
                return ""
            }
            //移除最后一个字符
            result.removeSubrange(result.index(result.endIndex, offsetBy: -1) ..< result.index(result.endIndex, offsetBy: 0))
        }
        
    }
    return result
}


func isUnique(_ astr: String) -> Bool {
    
    let array = Array(astr)
    var map = [Character: Bool]()
    
    for c in array{
        if map[c] ?? false {
            return false
        }else{
            map[c] = true
        }
    }
    return true
}

//面0102
func CheckPermutation(_ s1: String, _ s2: String) -> Bool {
    
    if s1.count != s2.count {
        return false
    }
    
    var map = [Character:Int]()
    
    for c in s1 {
        if let record = map[c]{
            map[c] = record + 1
        }else{
            map[c] = 1
        }
    }
    
    for char in s2 {
        if (map[char] != nil) {
            map[char]! -= 1
        }else{
            map[char] = 1
        }
    }
    
    for value in map.values{
        if value > 0{
            return false
        }
    }
    return true
}

//01.03
func replaceSpaces(_ S: String, _ length: Int) -> String {
        
    var resultArr = S.compactMap { (item) -> String? in
      return "\(item)"
    }
    
    for index in 0..<length {
        if resultArr[index] == " "{
            resultArr[index] = "%20"
        }
    }
    
    if resultArr.count > length {
        resultArr.removeLast(resultArr.count - length)
    }
    
    return resultArr.joined()
    
    //解法2
//    var newStr = ""
//    var count = 0
//    for element in S {
//        if element == " " {
//            newStr.append("%20")
//        } else {
//            newStr.append(element)
//        }
//        count += 1
//        if count == length {
//            break
//        }
//    }
//    return newStr
}

//01 04
func canPermutePalindrome(_ s: String) -> Bool {
    var map = [Character:Int]()
    for c in s {
        if let record = map[c] {
            map[c] = record + 1
        }else{
            map[c] = 1
        }
    }
    
    var count = 0
        for(_,v) in map{
            //奇数
            if v % 2 != 0 {
                count += 1
            }
            if count > 1{
                return false
            }
        }

    return true
}

//01 09字符串轮转
// 输入：s1 = "waterbottle", s2 = "erbottlewat"

func isFlipedString(_ s1: String, _ s2: String) -> Bool {
    
    if s1.count != s2.count {
        return false
    }
    
    if !(s1 + s2).contains(s1){
        return false
    }
    
    return true
}


//字符串相加
/*
 算法流程： 设定 i，j 两指针分别指向 num1，num2 尾部，模拟人工加法；

 计算进位： 计算 carry = tmp // 10，代表当前位相加是否产生进位；
 添加当前位： 计算 tmp = n1 + n2 + carry，并将当前位 tmp % 10 添加至 res 头部；
 索引溢出处理： 当指针 i或j 走过数字首部后，给 n1，n2 赋值为 00，相当于给 num1，num2 中长度较短的数字前面填 00，以便后续计算。
 当遍历完 num1，num2 后跳出循环，并根据 carry 值决定是否在头部添加进位 11，最终返回 res 即可。
 **/
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

func longestPalindrome(_ s: String) -> String {
    
    if s.count <= 1 {
        return s
    }
    //s转换为数组
    let arr = s.map{$0}
    var startIndex: Int = 0
    var endIndex = 0
    func findStartIndex(arr: Array<Character>, left: Int, right: Int)-> Void {
        var left = left
        var right = right
        while left >= 0 && right < arr.count && (arr[left] == arr[right]) {
            left -= 1
            right += 1
        }
        //此处 left + 1、right - 1；是因为上一步while中left已经减1，right已经加1
        right = right - 1
        left = left + 1
        if (endIndex - startIndex) < (right - left) {
            startIndex = left
            endIndex = right
        }
    }
    for index in 0 ..< arr.count {
        //回文为奇数的情况
        findStartIndex(arr: arr, left: index, right:index)
        //回文为偶数的情况
        findStartIndex(arr: arr, left: index, right:index+1)
    }
    let strArr = arr[startIndex ... endIndex]
    let str = String(strArr)
    return str
}

//1143最长公共子序列
func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {

    //备忘录 消除重叠子问题
    var memo: [[Int]] = []
    
    let m = text1.count
    let n = text2.count
    
    //负一代表未计算
    for _ in 0...m {
        let item = Array(repeating: -1, count:(n+1))
        memo.append(item)
    }
    
    func dp (_ s1: String, _ i: Int, _ s2: String, j: Int) -> Int{
        //递归到最后返回
        if i == s1.count || j == s2.count {
            return 0
        }
        
        //如果之前计算过 直接返回备忘录内容
        if memo[i][j] != -1 {
            return memo[i][j]
        }
        
        if Array(s1)[i] == Array(s2)[j]{
            memo[i][j] = 1 + dp(s1, i+1, s2, j: j+1)
        }else{
            memo[i][j] = max(dp(s1, i+1, s2, j: j), dp(s1, i, s2, j: j+1))
        }
        
        return memo[i][j]
    }
    
    return dp(text1, 0, text2, j: 0)
}


//反转字符串 II
//通俗一点说，每隔k个反转k个，末尾不够k个时全部反转；
func reverseStr(_ s: String, _ k: Int) -> String {
    
    var ch = Array(s)

    for i in stride(from: 0, to: ch.count, by: 2 * k) {
        var left = i
        //寻找前k的右边界 //s.count - 1是为了判断剩下,
        var right = min(s.count - 1, left + k - 1)

        //交换
        while left < right {
            (ch[left], ch[right]) = (ch[right], ch[left])
            left += 1
            right -= 1
        }
    }
    return String(ch)
}

