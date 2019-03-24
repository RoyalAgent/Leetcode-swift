/**
 * Question Link: https://leetcode.com/problems/reorder-list/
 * Primary idea: Use Runner Tech to split the list, reverse the second half, and merge them
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
 Given a singly linked list L: L0→L1→…→Ln-1→Ln,
 reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…
 
 You may not modify the values in the list's nodes, only nodes itself may be changed.
 
 Example 1:
 
 Given 1->2->3->4, reorder it to 1->4->2->3.
 Example 2:
 
 Given 1->2->3->4->5, reorder it to 1->5->2->4->3.
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
func reorderList(head: ListNode?) {
    guard let head = head else {
        return
    }
    
    var prev: ListNode? = head
    var post: ListNode? = head
    
    _split(&prev, &post)
    prev = head
    
    post = _reverse(head: &post)
    
    _merge(&prev, &post)
}

private func _split(_ prev: inout ListNode?, _ post: inout ListNode?) {
    while post != nil && post!.next != nil {
        prev = prev!.next
        post = post!.next!.next
    }
    
    post = prev!.next
    prev!.next = nil
}

private func _reverse( head: inout ListNode?) -> ListNode? {
    var prev = head
    var temp: ListNode?
    
    while prev != nil {
        let post = prev!.next
        
        prev!.next = temp
        
        temp = prev
        prev = post
    }
    
    return temp
}

private func _merge(_ prev: inout ListNode?, _ post: inout ListNode?) {
    while prev != nil && post != nil{
        let preNext = prev!.next
        let posNext = post!.next
        
        prev!.next = post
        post!.next = preNext
        
        prev = preNext
        post = posNext
    }
}

