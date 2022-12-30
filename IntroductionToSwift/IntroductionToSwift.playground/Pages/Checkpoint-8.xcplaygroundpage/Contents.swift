//: [Previous](@previous)

import Foundation

protocol Buildings {
    var rooms: Int { get }
    var cost: Int { get set }
    var realtor: String { get }
    func salesPrint() -> Void
}
struct House: Buildings {
    var rooms: Int
    var cost: Int
    var realtor: String
    func salesPrint() {
        print("rooms:\(rooms), cost:\(cost), realtor:\(realtor)")
    }
    
}

struct Office: Buildings {
    var rooms: Int
    var cost: Int
    var realtor: String
    func salesPrint() {
        print("rooms:\(rooms), cost:\(cost), realtor:\(realtor)")
    }
}

let house = House(rooms: 4, cost: 1000000, realtor: "panda")
house.salesPrint()

let office = Office(rooms: 5, cost: 1500000, realtor: "koala")
office.salesPrint()
