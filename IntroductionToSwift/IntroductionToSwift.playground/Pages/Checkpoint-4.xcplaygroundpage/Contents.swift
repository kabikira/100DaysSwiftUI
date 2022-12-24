//: [Previous](@previous)

import Foundation

enum sqrtError: Error {
    case outOfBounds, noRoute
}

func squareRoot(_ number: Int) throws -> Int {
    var comparison = 0
    var num = 0
    for i in 1...100 {
        comparison = (number / i) * (number / i)
        if number == comparison {
            num = i
            break
        } else if i == 100 {
            throw sqrtError.noRoute
        }
    }
    if num < 1 || 10000 < num {
        throw sqrtError.outOfBounds
    }
    return num
}

do {
    let result = try squareRoot(144)
    print(result)
} catch sqrtError.outOfBounds {
    print("Error")
} catch sqrtError.noRoute {
    print("No route")
}


//let a = 25
//var b = 0
////var count = 1
//for i in 1...100 {
//    b = (a / i ) * (a / i )
//    if a == b {
//        print(b)
//        break
//    }
//}
//while a != b {
//    b = (a / count) * (a / count)
//    count += 1
//    print(b)
//}

