/**
 * Question Link: https://leetcode.com/problems/reverse-nodes-in-k-group/
 * Primary idea: Reverse one group during one loop. Construct a reversed group from back to forth.
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
 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
 
 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
 
 Example:
 
 Given this linked list: 1->2->3->4->5
 
 For k = 2, you should return: 2->1->4->3->5
 
 For k = 3, you should return: 3->2->1->4->5
 
 Note:
 
 Only constant extra memory is allowed.
 You may not alter the values in the list's nodes, only nodes itself may be changed.
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
func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    
    var prev = dummy                             // prev = A
    while prev.next != nil {                     // A->B->C->D->E => A->D->C->B->E
        var groupTail : ListNode? = prev
        for _ in 1...k {
            groupTail = groupTail?.next
        }
        guard let _ = groupTail else {            // groupTail = D
            break
        }
        
        let nextGroupHead = groupTail!.next      // nextGroupHead = E
        var last = nextGroupHead                 // last = E
        var current : ListNode? = prev.next      // current = B
        while current != nil && current !== nextGroupHead {
            let next = current!.next             // next = C
            current!.next = last                 // B -> E
            last = current                       // last = B
            current = next                       // current = C
        }
        
        groupTail = prev.next
        prev.next = last
        prev = groupTail!
    }
    
    return dummy.next
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

display(reverseKGroup(list, 2))
