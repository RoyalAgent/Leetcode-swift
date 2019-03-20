/**
 * Question Link: https://leetcode.com/problems/palindrome-linked-list/
 * Primary idea: Runner tech, reverse the first half linkedlist, then compare it to the next half
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
/*
 Given a singly linked list, determine if it is a palindrome.
 
 Example 1:
 
 Input: 1->2
 Output: false
 Example 2:
 
 Input: 1->2->2->1
 Output: true
 Follow up:
 Could you do it in O(n) time and O(1) space?
 */

import UIKit

class Stack{
    var items:[Int] = []
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    func pop() -> Int? {
        guard !self.isEmpty() else {
            return nil
        }
        return items.removeLast()
    }
    
    func push(_ item:Int){
        items.append(item)
    }
    
    func peak() -> Int? {
        guard !self.isEmpty() else {
            return nil
        }
        return items.last
    }
}

class ListNode{
    var val:Int
    var next:ListNode?
    init(_ val:Int) {
        self.val = val
        self.next = nil
    }
}

func palindromeLinkedList(_ list:ListNode?) -> Bool{
    guard list != nil else {
        return false
    }
    
    var result:Bool = true
    var slow:ListNode = list!
    var fast:ListNode = list!
    let stack = Stack()
    
    while fast.next?.next != nil {
        stack.push(slow.val)
        slow = slow.next!
        fast = (fast.next?.next)!
    }
    
    stack.push(slow.val)
    
    while fast.next != nil {
        if fast.val != stack.pop() {
            result = false
            break
        }
        fast = fast.next!
    }
    
    return result
}

//构造list
let list = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(2)
let node4 = ListNode(1)
list.next = node2
node2.next = node3
node3.next = node4

palindromeLinkedList(list)
