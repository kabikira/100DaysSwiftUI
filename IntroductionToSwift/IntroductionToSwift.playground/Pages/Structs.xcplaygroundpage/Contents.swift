//: [Previous](@previous)

import Foundation

struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    // var vacationRemaining: Int
    var vacationRemaining = 14

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)
"""
Swift は init() と呼ばれる構造体の内部に特別な関数を無言で作成し、構造体のすべてのプロパティをそのパラメータとして使用します。そして、自動的にこれらの2つのコードのピースが同じであるとして扱われます。
"""
var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 35)
var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)
archer1.takeVacation(days: 5)
print(archer1.vacationRemaining)

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)
