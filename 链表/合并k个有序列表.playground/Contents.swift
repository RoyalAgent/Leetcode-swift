/**
 * Question Link: https://leetcode.com/problems/merge-k-sorted-lists/
 * Primary idea: Divide and Conqure with merge two sorted lists as a helper function
 * Time Complexity: O(mlogn), m stands for the length of one list, n stands for the number of lists
 *                  Space Complexity: O(1)
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
import UIKit

class ListNode{
    var val:Int
    var next:ListNode?
    init(_ val:Int) {
        self.val = val
        self.next = nil
    }
}

func mergeTwoLists(l1:ListNode?,l2:ListNode?) -> ListNode?{
    let result:ListNode = ListNode(0)
    var node:ListNode = result
    var l1:ListNode? = l1
    var l2:ListNode? = l2
    
    while l1 != nil && l2 != nil {
        if l1!.val < l2!.val {
            node.next = l1
            l1 = l1!.next
        }else{
            node.next = l2
            l2 = l2!.next
        }
        node = node.next!
    }
    //如果有一个为空，就把剩下的加到node后
    node.next = l1 ?? l2
    
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

func mergeKSortedLists(_ lists:[ListNode?]) -> ListNode?{
    guard lists.count > 0 else {
        return nil
    }
    var lists:[ListNode?] = lists
    var left:Int = 0
    var right:Int = lists.count - 1
    
    while right > 0 {
        left = 0
        while left < right {
            lists[0] = mergeTwoLists(l1: lists[left], l2: lists[right])
            left = left + 1
            right = right - 1
        }
    }
    
    return lists[0]
}

//构造链表l1
let l1 = ListNode(1)
let n2 = ListNode(3)
let n3 = ListNode(4)
let n4 = ListNode(5)
let n5 = ListNode(10)
l1.next = n2
n2.next = n3
n3.next = n4
n4.next = n5
//l2
let l2:ListNode? = nil

//let l2 = ListNode(2)
//let n6 = ListNode(6)
//let n7 = ListNode(8)
//l2.next = n6
//n6.next = n7

//l3
let l3 = ListNode(9)

var lists:[ListNode?] = [l1,l2,l3]


display(l1)
display(mergeTwoLists(l1: l1, l2: l2))

display(mergeKSortedLists(lists))







