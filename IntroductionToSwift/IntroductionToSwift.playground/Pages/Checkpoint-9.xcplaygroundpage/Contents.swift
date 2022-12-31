//: [Previous](@previous)

import Foundation

func getNumbers(numbers: [Int]?) -> Int {
    guard let numbers = numbers else {
        return Int.random(in: 1...100)
    }
    
    return numbers.randomElement() ?? 1
}
let nums = [1, 2, 3, 4, 5]
getNumbers(numbers: nums)
let nums2: [Int]? = nil


nums.randomElement() ?? Int.random(in: 1...100)
nums2?.randomElement() ?? Int.random(in: 1...100)

// 回答した関数
func getNumbers2(numbers: [Int]?) -> Int { numbers?.randomElement() ?? Int.random(in: 1...100)}

getNumbers2(numbers: nums2)
