
/**
 * Question Link: https://leetcode.com/problems/container-with-most-water/
 * Primary idea: First given largest width, then go to height-increase direction while width decreases
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */
/*
 Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
 
 Note: You may not slant the container.
 就是说，x轴上在1,2,...,n点上有许多垂直的线段，长度依次是a1, a2, ..., an。找出两条线段，使他们和x抽围成的面积最大。面积公式是 Min(ai, aj) X |j - i|
 O(n)的复杂度。保持两个指针i,j；分别指向长度数组的首尾。如果ai 小于aj，则移动i向后（i++）。反之，移动j向前（j--）。如果当前的area大于了所记录的area，替换之。这个想法的基础
 是，如果i的长度小于j，无论如何移动j，短板在i，不可能找到比当前记录的area更大的值了，只能通过移动i来找到新的可能的更大面积。
 */
import UIKit

func containerMostWater(_ nums:[Int]) -> Int{
    guard nums.count != 0 else {
        return 0
    }
    var res:Int = 0
    var i:Int = 0
    var j:Int = nums.count - 1
    while i < j {
        let minHeight:Int = min(nums[i], nums[j])
        let temp:Int = minHeight * (j - i)
        if temp > res {
            res = temp
        }
        if minHeight == nums[i] {
            i = i + 1
        }else{
            j = j - 1
        }
    }
    
    return res
}

containerMostWater([1,3,5,2,7,3,9,0])

