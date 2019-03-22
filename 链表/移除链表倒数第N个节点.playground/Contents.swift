/**
 * Question Link: https://leetcode.com/problems/remove-nth-node-from-end-of-list/
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
 Given a linked list, remove the nth node from the end of list and return its head.
 
 For example,
 
 Given linked list: 1->2->3->4->5, and n = 2.
 
 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:
 Given n will always be valid.
 Try to do this in one pass.
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
//1,2,3,4,5 n=2
func removeNthFromEnd(_ list:ListNode?,k:Int) -> ListNode?{
    guard list != nil && k > 0 else {
        return nil
    }
    let result:ListNode = ListNode(0)
    result.next = list
    var node:ListNode? = list
    var pre:ListNode = result
    var count:Int = 1
    
    
    while node != nil {
        if count != k {
            node = node?.next
            count = count + 1
            continue
        }
        if node!.next == nil {
            pre.next = pre.next?.next
            break
        }else{
            pre = pre.next!
            node = node!.next
        }
        
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

display(removeNthFromEnd(list, k: 1))
