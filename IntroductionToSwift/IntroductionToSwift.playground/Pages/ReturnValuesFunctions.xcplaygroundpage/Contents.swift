import Foundation

let root = sqrt(169)
print(root)

func rollDice() -> Int {
     Int.random(in: 1...6)
}

let result = rollDice()
print(result)

//func areLettersIdentical(string1: String, string2: String) -> Bool {
//    let first = string1.sorted()
//    let second = string2.sorted()
//    return first == second
//}

func areLettersIdentical(string1: String, string2: String) -> Bool {
     string1.sorted() == string2.sorted()
}


print(areLettersIdentical(string1: "acb", string2: "abc")
)

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)
