//: [Previous](@previous)

import Foundation

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}
print(try checkPassword("123456"))
let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

enum CatProblems: Error {
    case notACat
    case unfriendly
}
func strokeCat(_ name: String) throws {
    switch name {
    case "Mr Betey":
        throw CatProblems.unfriendly
    case "Lassie":
        throw CatProblems.notACat
    default:
        print("You strokd \(name).")
    }
}
try strokeCat("Mr Betey")
