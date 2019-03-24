/**
 * Question Link: https://leetcode.com/problems/reverse-linked-list/
 * Primary idea: Use two helper nodes, traverse the linkedlist and change point direction each time
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
 Reverse a singly linked list.
 
 Example:
 
 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:
 
 A linked list can be reversed either iteratively or recursively. Could you implement both?
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
//1,2,3,4,5
//0
func reverseLinkedLis(_ list:ListNode?) -> ListNode?{
    guard list != nil else {
        return nil
    }
    let result:ListNode = ListNode(0)
    var node:ListNode? = list
    
    while node != nil {
        let temp:ListNode = node!
        node = node?.next
        temp.next = nil
        temp.next = result.next
        result.next = temp
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
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
list.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

display(reverseLinkedLis(list))
