/**
 * Question Link: https://leetcode.com/problems/add-two-numbers/
 * Primary idea: use carry and iterate through both linked lists
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
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
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

func addTwoNumbers(_ list1:ListNode?,list2:ListNode?) -> ListNode?{
    guard list1 != nil && list2 != nil else {
        return nil
    }
    let res:ListNode = ListNode(0)
    var tail:ListNode = res
    
    var node1:ListNode? = list1
    var node2:ListNode? = list2
    var sum:Int = 0
    var carry:Int = 0
    
    
    while node1 != nil || node2 != nil {
        sum = carry
        sum = (node1?.val ?? 0)! + (node2?.val ?? 0)! + sum
        carry = sum / 10
        carry
        sum
        let temp:ListNode = ListNode(sum % 10)
        tail.next = temp
        tail = temp
        node1 = node1?.next
        node2 = node2?.next
    }
    return res.next
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
let list = ListNode(2)
let node2 = ListNode(4)
let node3 = ListNode(3)
list.next = node2
node2.next = node3

let list2 = ListNode(5)
let node4 = ListNode(6)
let node5 = ListNode(4)
list2.next = node4
node4.next = node5

display(addTwoNumbers(list, list2: list2))

