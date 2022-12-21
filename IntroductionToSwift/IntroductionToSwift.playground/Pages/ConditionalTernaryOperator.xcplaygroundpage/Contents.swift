let age = 18
let canVote = age >= 18 ? "Yes" : "No"


let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

// 無効なコード
//print(
//    if hour < 12 {
//        "It's before noon"
//    } else {
//        "It's after noon"
//    }
//)
// 2回printを実行しなければいけない
if hour < 12 {
    print("It's before noon")
} else {
    print("It's after noon")
}
