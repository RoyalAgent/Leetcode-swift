/**
 * Question Link: https://leetcode.com/problems/string-to-integer-atoi/
 * Primary idea: Trim, positive and negative, integer overflow, is character digit
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
/*
 Implement atoi which converts a string to an integer.
 
 The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
 
 The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
 
 If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
 
 If no valid conversion could be performed, a zero value is returned.
 
 Note:
 
 Only the space character ' ' is considered as whitespace character.
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
 Example 1:
 
 Input: "42"
 Output: 42
 Example 2:
 
 Input: "   -42"
 Output: -42
 Explanation: The first non-whitespace character is '-', which is the minus sign.
 Then take as many numerical digits as possible, which gets 42.
 Example 3:
 
 Input: "4193 with words"
 Output: 4193
 Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
 Example 4:
 
 Input: "words and 987"
 Output: 0
 Explanation: The first non-whitespace character is 'w', which is not a numerical
 digit or a +/- sign. Therefore no valid conversion could be performed.
 Example 5:
 
 Input: "-91283472332"
 Output: -2147483648
 Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
 Thefore INT_MIN (−231) is returned.
 */
import UIKit

func myAtoi(_ str:String) -> Int?{
    guard str.count != 0 else {
        return nil
    }
    var res:[Character] = []
    var resInt:Int? = 0
    var isNegativeNumber:Bool = false
    var isNil:Bool = false
    var strChar:[Character] = Array(str)
    //判断是否是负数
    if strChar[0] == "-" {
        isNegativeNumber = true
        strChar.remove(at: 0)
    }
    strChar
    //提取数字
    for i in strChar {
        if Int(String(i)) == nil {
            isNil = true
            break
        }else{
            res.append(i)
        }
    }
    //查看是否越界并确定结果
    if isNil == true {
        resInt = nil
    }else if Int(String(res)) == nil && isNegativeNumber == false {
        resInt = Int.max
    }else if Int(String(res)) == nil && isNegativeNumber == true{
        resInt = Int.min
    }else if isNegativeNumber == true{
        resInt = Int(String(res))! * -1
    }else{
        resInt = Int(String(res))!
    }
    
    return resInt
}

myAtoi("-123")
