/**
 * Question Link: https://leetcode.com/problems/add-binary/
 * Primary idea: use Carry and iterate from last to start
 *
 * Note: Swift does not have a way to access a character in a string with O(1),
 *       thus we have to first transfer the string to a character array
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 */
/*
 Given two binary strings, return their sum (also a binary string).
 
 For example,
 a = "11"
 b = "1"
 Return "100".
 */
import UIKit

func addBinary(_ str1:String,str2:String) -> String?{
    guard isBinary(str1) && isBinary(str2) else {
        return nil
    }
    let str1Char:[Character] = Array(str1)
    let str2Char:[Character] = Array(str2)
    var result:String = ""
    var i:Int = str1Char.count - 1
    var j:Int = str2Char.count - 1
    var sum:Int = 0
    //进位
    var carry:Int = 0
    
    while i >= 0 || j >= 0 || carry > 0 {
        sum = carry
        if i >= 0 {
            sum = sum + Int(String(str1Char[i]))!
            i = i - 1
        }
        if j >= 0 {
            sum = sum + Int(String(str2Char[j]))!
            j = j - 1
        }
        carry = sum / 2
        sum = sum % 2
        result = String(sum) + result
    }
    
    return result
}
// 判断字符串是否是二进制字符串
func isBinary(_ str:String) -> Bool{
    var result:Bool = false
    for i in str {
        if i == "1" || i == "0"{
            result = true
        }else{
            result = false
            break
        }
    }
    return result
}


addBinary("##1", str2: "011")
