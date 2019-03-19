/**
 * Question Link: https://leetcode.com/problems/simplify-path/
 * Primary idea: Use a stack, normal to push, .. to pop
 * Time Complexity: O(n), Space Complexity: O(n)
 */
//Given an absolute path for a file (Unix-style), simplify it.
//
//For example,
//path = "/home/", => "/home"
//path = "/a/./b/../../c/", => "/c"
//path = "/a/./b/../c/", => "/a/c"
//path = "/a/./b/c/", => "/a/b/c"
//
//click to show corner cases.
//
//Corner Cases:
//
//
//Did you consider the case where path = "/../"?
//In this case, you should return "/".
//Another corner case is the path might contain multiple slashes '/' together, such as "/home//foo/".
//In this case, you should ignore redundant slashes and return "/home/foo".
//这样我们就可以知道中间是"."的情况直接去掉，是".."时删掉它上面挨着的一个路径，而下面的边界条件给的一些情况中可以得知，如果是空的话返回"/"，如果有多个"/"只保留一个。那么我们可以把路径看做是由一个或多个"/"分割开的众多子字符串，把它们分别提取出来一一处理即可

import UIKit

class Stack{
    var items:[String] = []
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    func pop() -> String? {
        guard !self.isEmpty() else {
            return nil
        }
        return items.removeLast()
    }
    
    func push(_ item:String){
        items.append(item)
    }
}

func simplifyPath(_ path:String) -> String?{
    guard !path.isEmpty else {
        return nil
    }
    var result:String = ""
    //将字符串进行分割，分割后的内容将会生成一个数组,并使用filter去掉数组中“”空的元素
    let filename:[String] = path.components(separatedBy: "/").filter({$0 != ""})
    let stack = Stack()

    for i in filename{
        if i == "." {
            continue
        }else if i == ".."{
            if !stack.isEmpty() {
                stack.pop()
            }
        }else{
            stack.push(i)
        }
    }
    
    while !stack.isEmpty() {
        print(result)
        result = "/" + stack.pop()! + result
    }
    
    return result
}

simplifyPath("/a/./b/../c/")
