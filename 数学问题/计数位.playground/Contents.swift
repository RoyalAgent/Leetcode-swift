/**
 * Question Link: https://leetcode.com/problems/counting-bits/
 * Primary idea:
 *   bits[i] = bits[i - p] + 1, while p is the largest power of two that smaller than i;
 *
 *  Time Complexity: O(n), Space Complexity: O(n)
 */
/*
 Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.
 
 Example:
 For num = 5 you should return [0,1,1,2,1,2].
 
 Follow up:
 
 It is very easy to come up with a solution with run time O(n*sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
 Space complexity should be O(n).
 Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.
 Hint:
 
 You should make use of what you have produced already.
 Divide the numbers in ranges like [2-3], [4-7], [8-15] and so on. And try to generate new range from previous.
 Or does the odd/even status of the number help you in calculating the number of 1s?
 Credits:
 Special thanks to @ syedee for adding this problem and creating all test cases.
 0000    0
 -------------
 0001    1
 -------------
 0010    1
 0011    2
 -------------
 0100    1
 0101    2
 0110    2
 0111    3
 -------------
 1000    1
 1001    2
 1010    2
 1011    3
 1100    2
 1101    3
 1110    3
 1111    4
 */
import UIKit

func sqrt(_ num:Int,_ sqrtNum:Int) -> Int{
    var count:Int = 0
    var temp:Int = 1
    repeat{
        temp = temp * sqrtNum
        count = count + 1
    }while temp <= num
    return count - 1
}

func countBits(_ num:Int) -> [Int]?{
    guard num > 0 else {
        return nil
    }
    var res:[Int] = [0]

    for i in 1...num {
        let p:Int = Int(pow(2.0,Double(sqrt(i,2))))
        res.append(res[i - p] + 1)
    }
    return res
}


countBits(5)

