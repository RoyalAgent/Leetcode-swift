/**
 * Question Link: https://leetcode.com/problems/remove-duplicates-from-sorted-list/
 * Primary idea: Iterate the list, jump over duplicates by replacing next with next.next
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
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 Example 1:
 
 Input: 1->1->2
 Output: 1->2
 Example 2:
 
 Input: 1->1->2->3->3
 Output: 1->2->3
 */
import Cocoa

class ListNode{
    var val:Int
    var next:ListNode?
    init(_ val:Int) {
        self.val = val
        self.next = nil
    }
}
//1,1,3,2,2
func removeDuplicatesFromSortedList(_ list:ListNode?) -> ListNode?{
    guard list != nil else {
        return nil
    }
    let list:ListNode = list!
    var node:ListNode? = list.next!
    var pre:ListNode = list
    var target:Int = list.val
    
    while node != nil {
        if node!.val == target {
            pre.next = node!.next
            node = pre.next
        }else{
            target = node!.val
            pre = node!
            node = node?.next
        }
    }
    return list
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

display(removeDuplicatesFromSortedList(list))
