
/**
 * Question Link: https://leetcode.com/problems/add-digits/
 * Primary idea: Transform number into array of string and sum the values recursively until the result is achieved
 *
 * Time Complexity: O(1), Space Complexity: O(1)
 *
 */
/*
 Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
 
 Example:
 
 Input: 38
 Output: 2
 Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2.
 Since 2 has only one digit, return it.
 Follow up:
 Could you do it without any loop/recursion in O(1) runtime?
 
 Hint:
 
 A naive implementation of the above process is trivial. Could you come up with other methods?
 What are all the possible results?
 How do they occur, periodically or randomly?
 You may find this Wikipedia article useful.
 */
import UIKit

func addDigits(_ str:String) -> Int?{
    guard Int(str) != nil else {
        return nil
    }
    var result:Int = 11
    var str:String = str
    var strChar:[Character] = []
    
    while result > 10 {
        result = 0
        strChar = Array(str)
        var i:Int = strChar.count - 1
        while i >= 0 {
            result = result + Int(String(strChar[i]))!
            i = i - 1
        }
        str = String(result)
    }
    return result
}

addDigits("38")
