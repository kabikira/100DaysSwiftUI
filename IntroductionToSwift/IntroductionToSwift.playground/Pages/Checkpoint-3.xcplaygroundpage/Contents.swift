

//for i in 1...100 {
//    if i % 3 == 0 && i % 5 == 0 {
//        print("FizzBuzz")
//        continue
//    } else if i % 3 == 0 {
//        print("Fizz")
//        continue
//    } else if i % 5 == 0 {
//        print("Buzz")
//        continue
//    }
//    print("\(i)")
//}

for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
        continue
    } else if i.isMultiple(of: 3) {
        print("Fizz")
        continue
    } else if i.isMultiple(of: 5) {
        print("Buzz")
        continue
    }
        print(i)
}
