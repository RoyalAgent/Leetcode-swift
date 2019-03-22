/**
 * Question Link: https://leetcode.com/problems/remove-linked-list-elements/
 * Primary idea: Iterate the list, jump over vals by replacing next with next.next
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
 Remove all elements from a linked list of integers that have value val.
 
 Example
 Given: 1 --> 2 --> 6 --> 3 --> 4 --> 5 --> 6, val = 6
 Return: 1 --> 2 --> 3 --> 4 --> 5
 
 Credits:
 Special thanks to @mithmatt for adding this problem and creating all test cases.
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

func removeLinkedListElements(_ list:ListNode?,k:Int) -> ListNode?{
    guard list != nil else {
        return nil
    }
    let result:ListNode = ListNode(0)
    result.next = list
    var node:ListNode? = list
    var pre:ListNode = result
    
    while node != nil {
        if node!.val == k {
            pre.next = node!.next
            node = pre.next
            continue
        }
        pre = node!
        node = node!.next
    }
    return result.next
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
let node2 = ListNode(1)
let node3 = ListNode(3)
let node4 = ListNode(1)
let node5 = ListNode(2)
list.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

display(removeLinkedListElements(list, k: 1))
