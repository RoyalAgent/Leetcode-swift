/**
 * Question Link: https://leetcode.com/problems/swap-nodes-in-pairs/
 * Primary idea: Three Pointers, each time change pointers' directions
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
 Given a linked list, swap every two adjacent nodes and return its head.
 
 Example:
 
 Given 1->2->3->4, you should return the list as 2->1->4->3.
 Note:
 
 Your algorithm should use only constant extra space.
 You may not modify the values in the list's nodes, only nodes itself may be changed.
 */
import UIKit

class ListNode{
    var val:Int
    var next:ListNode?
    init(_ val:Int) {
        self.val = val
        self.next = nil
    }
}

func swapNodesInPairs(_ list:ListNode?) -> ListNode?{
    guard list != nil else {
        return nil
    }
    let result:ListNode = list!
    var node:ListNode? = result
    while node != nil && node!.next != nil {
        (node!.val,node!.next!.val) = (node!.next!.val,node!.val)
        node = node!.next!.next
    }
    
    return result
}

func display(_ list:ListNode?) -> [Int]?{
    guard list != nil else {
        return nil
    }
    var node:ListNode? = list
    var result:[Int] = []
    
    while node != nil {
        result.append(node!.val)
        node = node!.next
    }
    return result
}

//构造list
let list = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
list.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

display(swapNodesInPairs(list))
