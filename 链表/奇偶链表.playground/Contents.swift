/**
 * Question Link: https://leetcode.com/problems/odd-even-linked-list/
 * Primary idea: Prev-post two pointers; change the prev and move both at a time
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
 Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.
 
 You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.
 
 
 
 Example:
 Given 1->2->3->4->5->NULL,
 return 1->3->5->2->4->NULL.
 
 Note:
 The relative order inside both the even and odd groups should remain as it was in the input.
 The first node is considered odd, the second node even and so on ...
 
 Credits:
 Special thanks to @aadarshjajodia for adding this problem and creating all test cases.
 */
import UIKit

//1,2,3,4,5,6,7
//0,0,-,-,-,-,-
//1,3,2,4,5,6,7
//0,-,0,-,-,-,-
//1,3,2,4,5,6,7
//-,0,-,0,-,-,-
//1,3,5,2,4,6,7
//-,0,-,-,0,-,-
//1,3,5,2,4,6,7
//-,-,0,-,-,0,-

class ListNode{
    var val:Int
    var next:ListNode?
    init(_ val:Int) {
        self.val = val
        self.next = nil
    }
}

func oddEvenLinkedList(_ head: ListNode?) -> ListNode? {
    guard head != nil && head!.next != nil else {
        return head
    }
    
    let evenHead = head!.next
    var p = head
    var q = evenHead
    var isEndEven = true
    
    while q!.next != nil {
        let node = q!.next
        
        p!.next = node
        
        p = q
        q = node
        isEndEven = !isEndEven
    }
    
    if isEndEven {
        p!.next = evenHead
    } else {
        p!.next = nil
        q!.next = evenHead
    }
    
    return head
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

display(oddEvenLinkedList(list))


