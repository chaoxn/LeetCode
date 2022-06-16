
import UIKit
//基操
func String_basic() {
    // 类型推断
    var str  = "Hello AAAAAAAAAAAABBBBBheiheiBBBBBBCCCCCCCCC"
    // 指定类型
//    var str1 : String = "Hello"
//    ///拼接
//    let str2 : String = "Hello"
//    let str3 = "Hello"
//    print(str2 + "\n" + str3)
//    ///追加
//    var str4 = "Hello"
//    str4.append(" World")
    
    //删除首字母
    str.removeFirst()
    // 等同于 str.remove(at: str.startIndex)
    print(str)
    
    // 删除指定位置
    str.remove(at: str.index(str.startIndex, offsetBy: 2))
    print(str)
    
    //删除最后一个字符
    str.removeLast()
    // 等同于str.remove(at: str.index(str.endIndex, offsetBy: -1))
    print(str)
    
    // 删除头尾指定位数内容
    str.removeFirst(2)
    str.removeLast(2)
    print(str)
    
    
    
    let str_p = "Hello world"
    let arr = str_p.split(separator: " ")
    print(arr)

    var _ = arr.joined(separator: " ")
    
    
    ///截取
    ///
    ///头部
    let str1 = str.prefix(2);
    print(str1)
    
    //尾部
    let str2 = str.suffix(3);
    print(str2)
    

    let index3 = str.index(str.startIndex, offsetBy: 3)
    let index4 = str.index(str.startIndex, offsetBy: 5)
    let str5 = str[index3...index4]
    print(str5)
    
    // 获取指定位置字符串
    let range = str.range(of: "heihei")!
    print(str[str.startIndex..<range.lowerBound])
    print(str[str.startIndex..<range.upperBound])
    
    
    
    
    func insert(){
        var str = "ABCDEFGH"
        // 单个字符
        str.insert("X", at:str.index(str.startIndex, offsetBy: 6))
        print(str)
        // 结果: ABCDEFXGH
        // 多个字符
        str.insert(contentsOf: "888", at: str.index(before: str.endIndex))
        print(str)
        // 结果: ABCDEFXG888H
    }
    
    
    func delete(){
        var str = "ABCDEFGH"
        let start = str.index(str.startIndex, offsetBy: 2)
        let end = str.index(str.endIndex, offsetBy: -2)
        str.removeSubrange(start...end)
        print(str)
        // 结果: ABH
    }
}
