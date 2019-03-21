/**
 * Question Link: https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
 * Primary idea: Iterate the list, jump over duplicates by replacing next with next.next
 *
 * Note: Swift provides "===" to compare two objects refer to the same reference
 *
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
 Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
 
 Example 1:
 
 Input: 1->2->3->3->4->4->5
 Output: 1->2->5
 Example 2:
 
 Input: 1->1->1->2->3
 Output: 2->3
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

func removeDuplicatesfromSortedListII(_ list:ListNode?) -> ListNode?{
    guard list != nil else {
        return nil
    }
    let result:ListNode = ListNode(0)
    result.next = list!
    var node:ListNode? = result.next
    var pre:ListNode = result
    var target:Int = result.next!.val
    
    while node != nil {
        if node!.val == target || node!.next?.val == target{
            pre.next = node!.next
            node = pre.next
        }else{
            target = node!.val
            if node!.next?.val == target {
                pre.next = node!.next
                node = pre.next
            }else{
                pre = node!
                node = node!.next
            }
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
let node2 = ListNode(1)
let node3 = ListNode(3)
let node4 = ListNode(2)
let node5 = ListNode(2)
list.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

display(removeDuplicatesfromSortedListII(list))
