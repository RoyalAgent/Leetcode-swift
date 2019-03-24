/**
 * Question Link: https://leetcode.com/problems/rotate-list/
 * Primary idea: Runner Tech
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
 Given a list, rotate the list to the right by k places, where k is non-negative.
 
 For example:
 Given 1->2->3->4->5->NULL and k = 2,
 return 4->5->1->2->3->NULL.
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

func getLength(_ list:ListNode?) -> Int{
    guard list != nil else {
        return 0
    }
    var length:Int = 0
    var node:ListNode? = list!
    while node != nil {
        length = length + 1
        node = node?.next
    }
    return length
}

func rotateList(_ list:ListNode?,k:Int) -> ListNode?{
    guard list != nil && k < getLength(list) else {
        return nil
    }
    let result:ListNode = ListNode(-1)
    var count:Int = 1
    var prev:ListNode? = list!
    var tail:ListNode? = list!
    var node:ListNode? = list!
    
    while node != nil {
        if count == (getLength(list) - k) {
            prev = node
        }
        count = count + 1
        tail = node
        node = node?.next
    }

    result.next = prev?.next
    prev?.next = nil
    tail?.next = list!
    prev
    
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
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
list.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

display(rotateList(list, k: 2))

