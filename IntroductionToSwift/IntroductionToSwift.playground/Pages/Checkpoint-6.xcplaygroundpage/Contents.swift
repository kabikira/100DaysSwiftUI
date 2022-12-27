//: [Previous](@previous)

import Foundation

// ギアの概念が違った
//struct Car {
//    let model = "swift"
//    let numSeats = 4
//    let currentGear = ["P", "R", "N", "D", "2", "L"]
//    func gearChange(gear: Int) -> Void {
//        print("CarModel: \(model) numberOfSeats: \(numSeats) currentGear: \(currentGear[gear])")
//    }
//}
//var car = Car()
//car.gearChange(gear: 5)

// アップとダウンの機能つけてなかった
//struct Car {
//    let model = "swift"
//    let numSeats = 4
//    var currentGear = 1
//    mutating func gearChange(gear: Int) ->Void {
//        if gear < 10 {
//            currentGear = gear
//            print("CarModel: \(model) numberOfSeats: \(numSeats) currentGear: \(currentGear)")
//        } else {
//            print("Error")
//        }
//
//    }
//}
//var car = Car()
//car.gearChange(gear: 4)
//car.gearChange(gear: 10)

struct Car {
    let model = "swift"
    let numSeats = 4
    var currentGear = 1
    mutating func gearUp() -> Void {
        if currentGear < 10 {
            currentGear += 1
            print("CarModel: \(model) numberOfSeats: \(numSeats) currentGear: \(currentGear)")
        } else {
            print("Error")
        }
        
    }
    mutating func gearDown() -> Void {
        if currentGear > 1 {
            currentGear -= 1
            print("CarModel: \(model) numberOfSeats: \(numSeats) currentGear: \(currentGear)")
        } else {
            print("Error")
        }
    }
}
var car = Car()
car.gearUp()
car.gearDown()
