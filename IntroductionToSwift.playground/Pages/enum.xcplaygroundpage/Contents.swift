//https://www.hackingwithswift.com/quick-start/beginners/how-to-create-and-use-enums

var selected = "Monday"
selected = "Tuesday"
selected = "January"
selected = "Friday "

//enum Weekday {
//    case monday
//    case tuesday
//    case wednesday
//    case thursday
//    case friday
//}
//
//var day = Weekday.monday
//day = Weekday.tuesday
//day = Weekday.friday


enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .tuesday
day = .friday
