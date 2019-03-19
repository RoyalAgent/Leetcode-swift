/**
 * Question Link: https://leetcode.com/problems/binary-tree-postorder-traversal/
 * Primary idea: Use a stack to help iterate the tree, go right and insert at head
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
//Given a binary tree, return the postorder traversal of its nodes' values.
//
//For example(左右根):
//Given binary tree {1,#,2,3},
//1
// \
//  2
// /
//3
//return [3,2,1].

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
    
    func peak() -> TreeNode? {
        guard !self.isEmpty() else {
            return nil
        }
        return items.last
    }
    
}

func postorderTraversal(_ root:TreeNode?) -> [Int]?{
    guard root != nil else {
        return nil
    }
    var result:[Int] = []
    let stack = Stack()
    var node:TreeNode? = root
    
    while node != nil || !stack.isEmpty() {
        if node != nil {
            result.insert(node!.val, at: 0)
            stack.push(node!)
            node = node!.right
        }else{
            node = stack.pop()?.left
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

postorderTraversal(root)

