
/**
 * Question Link: https://leetcode.com/problems/count-primes/
 * Primary idea: Create a boolean array to determine prime or not,
 *               filter numbers are times of previous ones
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
/*
 Count the number of prime numbers less than a non-negative number, n.
 
 Example:
 
 Input: 10
 Output: 4
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 References:
 How Many Primes Are There?
 
 Sieve of Eratosthenes
 
 Credits:
 Special thanks to @mithmatt for adding this problem and creating all test cases.
 */
import UIKit

func countPrimes(_ num:Int) -> Int{
    guard num > 1 else {
        return 0
    }
    var count:Int = 0
    var isPrime:[Bool] = [Bool](repeating:true, count:num + 1)
    let str:[Int] = [2,3,5,7]
    
    for i in str {
        for j in stride(from: 2 * i, to: num + 1, by: i) {
            isPrime[j] = false
        }
    }
    
    for i in 2...num{
        if isPrime[i] == true {
            count = count + 1
        }
    }
    return count
}

countPrimes(10)


