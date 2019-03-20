/**
 * Question Link: https://leetcode.com/problems/valid-parentheses/
 * Primary idea: Use a stack to see whether the peek left brace is correspond to the current right one
 * Time Complexity: O(n), Space Complexity: O(n)
 */
/*
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
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
    
}

func validParentheses(_ str:String) -> Bool{
    guard !str.isEmpty else {
        return false
    }
    var result:Bool = true
    let stack = Stack()
    
    for i in str {
        if i == "{" || i == "[" || i == "(" {
            stack.push(i)
        }else if i == "}"{
            if stack.pop() != "{" {
                result = false
            }
        }else if i == "]"{
            if stack.pop() != "[" {
                result = false
            }
        }else if i == ")"{
            if stack.pop() != "(" {
                result = false
            }
        }
    }
    
    return result
}

validParentheses("{1[2)}")
