// https://www.hackingwithswift.com/quick-start/beginners/how-to-use-type-annotations

let surname: String = "Lasso"
var score: Double = 0

let playerName: String = "Roy"

var luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true
var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])


var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light

let username: String
// lots of complex logic
username = "@twostraws"
// lots more complex logic
print(username)

//let score: Int = "Zero"
