/**
 * Question Link: https://leetcode.com/problems/partition-list/
 * Primary idea: Tail Insert and merge two lists, use dummy to avoid edge case
 *
 * Time Complexity: O(n), Space Complexity: O(1)
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
 Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.
 
 You should preserve the original relative order of the nodes in each of the two partitions.
 
 For example,
 Given 1->4->3->2->5->2 and x = 3,
 return 1->2->2->4->3->5.
 
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
func partitionList(_ head: ListNode?, _ x: Int) -> ListNode? {
    let prevDummy = ListNode(0), postDummy = ListNode(0)
    var prev = prevDummy, post = postDummy
    
    var node = head
    
    while node != nil {
        let next = node!.next
        node!.next = nil
        
        if node!.val < x {
            prev.next = node
            prev = prev.next!
        } else {
            post.next = node
            post = post.next!
        }
        node = next
    }
    
    prev.next = postDummy.next
    
    return prevDummy.next
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
let node2 = ListNode(4)
let node3 = ListNode(3)
let node4 = ListNode(2)
let node5 = ListNode(5)
list.next = node2
node2.next = node3
node3.next = node4
node4.next = node5


display(partitionList(list,3))

