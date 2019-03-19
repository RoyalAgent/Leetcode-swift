/**
 * Question Link: https://leetcode.com/problems/binary-tree-inorder-traversal/
 * Primary idea: Use a stack to help iterate the tree
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
//Example(左根右):
//
//Input: [1,null,2,3]
//1
// \
//  2
// /
//3
//
//Output: [1,3,2]
//思路：1.使用栈实现，站里面存储的均为根，但需要申请额外的空间

import UIKit

class TreeNode{
    var val:Int
    var left:TreeNode?
    var right:TreeNode?
    
    init(_ val:Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Stack{
    var items:[TreeNode] = []
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    func pop() -> TreeNode? {
        guard !self.isEmpty() else {
            return nil
        }
        return items.removeLast()
    }
    
    func push(_ item:TreeNode){
        items.append(item)
    }
    
}
func inorderTraversal(_ root:TreeNode?) -> [Int]?{
    guard root != nil else {
        return nil
    }
    var answer:[Int] = []
    let stack = Stack()
    var node:TreeNode? = root
    
    while node != nil || !stack.isEmpty() {
        if node != nil {
            stack.push(node!)
            node = node!.left
        }else{
            node = stack.pop()
            answer.append(node!.val)
            node = node!.right
        }
    }
    
    return answer
}

//构造树
let root:TreeNode = TreeNode(1)
let node2:TreeNode = TreeNode(2)
let node3:TreeNode = TreeNode(3)
root.right = node2
node2.left = node3

inorderTraversal(root)



