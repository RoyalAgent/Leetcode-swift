/**
 * Question Link: https://leetcode.com/problems/longest-valid-parentheses/
 * Primary idea: Push index to a stack and pop encountering ")"
 * Time Complexity: O(n), Space Complexity: O(n)
 */
//Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
//
//Example 1:
//
//Input: "(()"
//Output: 2
//Explanation: The longest valid parentheses substring is "()"
//Example 2:
//
//Input: ")()())"
//Output: 4
//Explanation: The longest valid parentheses substring is "()()"

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
    
}

func longest(_ str:String?) -> Int?{
    guard str != nil else {
        return nil
    }
    let stack = Stack()
    var length:Int = 0
    
    for i in str!{
        if i == "(" {
            stack.push(i)
        }else if i == ")"{
            if stack.peak() == "(" {
                stack.pop()
                length = length + 2
            }
        }
    }
    return length
}

longest("((99999)")
