//: [Previous](@previous)

import Foundation

//func printTimesTables(for number: Int, end: Int) {
//    for i in 1...end {
//        print("\(i) x \(number) is \(i * number)")
//    }
//}
//
//printTimesTables(for: 5, end: 20)

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
//characters.removeAll()
print(characters.count)

"""
これは、ほとんどの場合、人々は高速道路を避けずに最速ルートで2つの場所間をドライブしたいと思うことを想定しています。ほとんどの場合、機能しそうな賢明なデフォルトであると同時に、必要に応じてカスタム値を提供する範囲を与えています。

その結果、同じ関数を3つの方法で呼び出すことができるようになりました。
"""
func findDirections(from: String, to: String, route: String = "fastest", avoidHighways: Bool = false) {
    // code here
}

findDirections(from: "London", to: "Glasgow")
findDirections(from: "London", to: "Glasgow", route: "scenic")
findDirections(from: "London", to: "Glasgow", route: "scenic", avoidHighways: true)

func fireArrow(skillLevel: Int = 1) {
    switch skillLevel {
    case 1...3:
        print("You missed the target.")
    case 4...7:
        print("You hit the target.")
    default:
        print("Great shot!")
    }
}
fireArrow()
