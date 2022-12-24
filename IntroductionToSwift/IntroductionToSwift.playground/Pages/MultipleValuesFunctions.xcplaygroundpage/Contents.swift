//: [Previous](@previous)

import Foundation

func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}
// 配列
//func getUser() -> [String] {
//    ["Taylor", "Swift"]
//}
//
//let user = getUser()
//print("Name: \(user[0]) \(user[1])")

// 辞書
//func getUser() -> [String: String] {
//    [
//        "firstName": "Taylor",
//        "lastName": "Swift"
//    ]
//}
//
//let user = getUser()
//print("Name: \(user["firstName", default: "Anonymous"]) \(user["lastName", default: "Anonymous"])")

// タプル
//func getUser() -> (firstName: String, lastName: String) {
//    (firstName: "Taylor", lastName: "Swift")
//}
//
//let user = getUser()
//print("Name: \(user.firstName) \(user.lastName)")


//func getUser() -> (String, String) {
//    ("Taylor", "Swift")
//}
//
//let user = getUser()
//print("Name: \(user.0) \(user.1)")

func getUser() -> (firstName: String, lastName: String) {
    (firstName:"Taylor", lastName: "Swift")
}
//let user = getUser()
//let firstName = user.firstName
//let lastName = user.lastName
//
//print("Name: \(firstName) \(lastName)")

//省略できる
//let (firstName, lastName) = getUser()
//print("Name: \(firstName) \(lastName)")

// タプルのその部分を無視するようにSwiftに伝えるために_を使用できる
//let (firstName, _) = getUser()
//print("Name: \(firstName)")
func getName(a: String, b: String) -> (firstName: String, lastName: String) {
    (firstName: a, lastName: b)
}

let user = getName(a: "panda", b: "koara")
print("Name:\(user.firstName) \(user.lastName)")

