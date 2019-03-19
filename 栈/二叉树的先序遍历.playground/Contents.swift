/**
 * Question Link: https://leetcode.com/problems/binary-tree-preorder-traversal/
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
//Given a binary tree, return the preorder traversal of its nodes' values.
//
//For example(根左右):
//Given binary tree {1,#,2,3},
//
//1
// \
//  2
// /
//3
//
//
//return [1,2,3].


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

func preorderTraversal(_ root:TreeNode?) -> [Int]?{
    guard root != nil else {
        return nil
    }
    var result:[Int] = []
    let stack = Stack()
    var node:TreeNode? = root
    
    while !stack.isEmpty() || node != nil {
        if node != nil {
            result.append(node!.val)
            stack.push(node!)
            node = node!.left
        }else{
            node = stack.pop()?.right
        }
    }
    return result
}

//构造树
let root = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)
root.right = node2
node2.left = node3

preorderTraversal(root)

