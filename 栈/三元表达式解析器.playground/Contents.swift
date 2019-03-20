/**
 * Question Link: https://leetcode.com/problems/ternary-expression-parser/
 * Primary idea: Use a stack and go from right to left, pop when peek is "?"
 * Time Complexity: O(n), Space Complexity: O(n)
 */
/*
 Given a string representing arbitrarily nested ternary expressions, calculate the result of the expression. You can always assume that the given expression is valid and only consists of digits 0-9, ?, :, T and F (T and Frepresent True and False respectively).
 
 Note:
 
 The length of the given string is ≤ 10000.
 Each number will contain only one digit.
 The conditional expressions group right-to-left (as usual in most languages).
 The condition will always be either T or F. That is, the condition will never be a digit.
 The result of the expression will always evaluate to either a digit 0-9, T or F.
 
 
 Example 1:
 
 Input: "T?2:3"
 
 Output: "2"
 
 Explanation: If true, then result is 2; otherwise result is 3.
 
 
 Example 2:
 
 Input: "F?1:T?4:5"
 
 Output: "4"
 
 Explanation: The conditional expressions group right-to-left. Using parenthesis, it is read/evaluated as:
 
 "(F ? 1 : (T ? 4 : 5))"                   "(F ? 1 : (T ? 4 : 5))"
 -> "(F ? 1 : 4)"                 or       -> "(T ? 4 : 5)"
 -> "4"                                    -> "4"
 
 
 Example 3:
 
 Input: "T?T?F:5:3"
 
 Output: "F"
 
 Explanation: The conditional expressions group right-to-left. Using parenthesis, it is read/evaluated as:
 
 "(T ? (T ? F : 5) : 3)"                   "(T ? (T ? F : 5) : 3)"
 -> "(T ? F : 3)"                 or       -> "(T ? F : 5)"
 -> "F"                                    -> "F"
 
 思路：做法是从右边开始找到第一个问号，然后先处理这个三元表达式，然后再一步一步向左推
 */
import UIKit

class Stack{
    var items:[Character] = []
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    func pop() -> Character? {
        guard !self.isEmpty() else {
            return nil
        }
        return items.removeLast()
    }
    
    func push(_ item:Character){
        items.append(item)
    }
    
    func peak() -> Character? {
        guard !self.isEmpty() else {
            return nil
        }
        return items.last
    }
    
    func clear(){
        while !self.isEmpty() {
            self.pop()
        }
    }
    
}

func ternaryExpressionParser(_ expression:String) -> Character?{
    guard !expression.isEmpty else {
        return nil
    }

    //存储表达式
    let expStack = Stack()
    //缓存栈
    let stack = Stack()
    
    //将表达式压入栈,去除冒号
    for i in expression {
        if i != ":" {
            expStack.push(i)
        }
    }
    
    //逆序遍历
    while !expStack.isEmpty() {
        let temp:Character = expStack.pop()!
        if temp == "?" {
            let point:Character? = expStack.peak()
            if point == "T" {
                expStack.pop()
                expStack.push(stack.pop()!)
                stack.pop()
            }else if temp == "F"{
                expStack.pop()
                stack.pop()
                expStack.push(stack.pop()!)
            }
        }else{
            stack.push(temp)
        }
        
    }
    return stack.peak()
}

ternaryExpressionParser("T?T?F:5:3")
