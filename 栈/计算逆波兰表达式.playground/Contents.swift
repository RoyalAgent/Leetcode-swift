/**
 * Question Link: https://leetcode.com/problems/evaluate-reverse-polish-notation/
 * Primary idea: Push a number to a stack and pop two for operation when encounters a operator
 * Time Complexity: O(n), Space Complexity: O(n)
 */
//Example 1:
//
//Input: ["2", "1", "+", "3", "*"]
//Output: 9
//Explanation: ((2 + 1) * 3) = 9
//Example 2:
//
//Input: ["4", "13", "5", "/", "+"]
//Output: 6
//Explanation: (4 + (13 / 5)) = 6
//Example 3:
//
//Input: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
//Output: 22
//Explanation:
//((10 * (6 / ((9 + 3) * -11))) + 17) + 5
//= ((10 * (6 / (12 * -11))) + 17) + 5
//= ((10 * (6 / -132)) + 17) + 5
//= ((10 * 0) + 17) + 5
//= (0 + 17) + 5
//= 17 + 5
//= 22

import UIKit

class Stack{
    var items:[Int] = []
    
    func  isEmpty() -> Bool {
        return items.isEmpty
    }
    
    func pop() -> Int? {
        guard !self.isEmpty() else {
            return nil
        }
        return items.removeLast()
    }
    
    func push(_ num:Int){
        items.append(num)
    }
    
    func peak() -> Int? {
        guard !self.isEmpty() else {
            return nil
        }
        return items.last
    }
}

func operation(prev:Int,post:Int,opt:String) -> Int?{
    switch opt {
    case "+":
        return prev + post
    case "-":
        return prev - post
    case "*":
        return prev * post
    case "/":
        guard prev != 0 else {
            print("wrong")
            return nil
        }
        return post / prev
    default:
        print("wrong option")
        return nil
    }
}

func reversePolish(_ str:[String]) -> Int?{
    guard !str.isEmpty else {
        return nil
    }
    let stack = Stack()
    for i in str {
        if let num = Int(i) {
            stack.push(num)
        }else{
            let prev:Int? = stack.pop()
            let post:Int? = stack.pop()
            
            guard prev != nil,post != nil else {
                return nil
            }
            
            let opt:Int? = operation(prev: prev!, post: post!, opt: i)
            guard opt != nil else {
                return nil
            }
            stack.push(opt!)
        }
    }
    return stack.peak()
}

reversePolish(["2","1","+","3","*"])
reversePolish(["4","13","5","/","+"])
reversePolish(["10","6","9","3","+","-11","*","/","*","17","+","5","+"])
reversePolish(["1","2","+","0","/"])
reversePolish(["1","2","+","0","a"])
