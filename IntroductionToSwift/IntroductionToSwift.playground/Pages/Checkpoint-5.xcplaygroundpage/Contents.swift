//: [Previous](@previous)

import Foundation

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let numbers = luckyNumbers.filter { $0 % 2 == 1}
print(numbers)

func numChage(numbers: [Int]) -> Void {
    let nums = numbers.filter {$0 % 2 == 1}
    let num = nums.sorted()
    print(num)
    let mapNum = num.map {"\($0)is a lucky number" }
    print(mapNum)
    for i in mapNum {
        print(i)
    }
    
}
numChage(numbers: luckyNumbers)
"""
7 is a lucky number
15 is a lucky number
21 is a lucky number
31 is a lucky number
33 is a lucky number
49 is a lucky number
"""

func printNumbers(numbers: [Int], first: () -> Void) {
    first()
}
printNumbers(numbers: luckyNumbers) {
    print("Checkpoint5")
    luckyNumbers.filter {$0 % 2 == 1}.sorted().map {print("\($0) is a lucky number")}
}

func printNumbers2(numbers: [Int]) -> Void {
    print("Checkpoint5")
    numbers.filter {$0 % 2 == 1}
        .sorted()
        .map {print("\($0) is a lucky number")}
}

printNumbers2(numbers: luckyNumbers)
