//: [Previous](@previous)

import Foundation
"""
プロトコルは Swift の契約のようなものです。データ型がサポートすることを期待する機能の種類を定義することができ、Swift はコードの残りの部分がこれらのルールに従うことを保証します。

私たちが、自宅からオフィスまで通勤する人をシミュレートするために、どのようにコードを書くかについて考えてみましょう。小さな Car 構造体を作成し、次のような関数を書くかもしれません。
"""
//func commute(distance: Int, using vehicle: Car) {
//    // lots of code here
//}

"""
もちろん、電車で通勤することもあるでしょうから、こうも書きます。

"""
//func commute(distance: Int, using vehicle: Train) {
//    // lots of code here
//}
"""
あるいは、バスで移動するかもしれません。
"""
//func commute(distance: Int, using vehicle: Bus) {
//    // lots of code here
//}
"""
あるいは、自転車、eスクーター、ライドシェアなど、さまざまな交通手段を利用するかもしれません。

実は、このレベルでは、基本的な移動がどのように行われるかは、あまり気にならないのです。私たちが気にするのは、各オプションを使ってユーザーが通勤するのにかかる時間や、新しい場所に移動するという実際の行為をどのように行うかといった、より広い範囲のことです。

ここでプロトコルの出番です。プロトコルは、私たちが使いたい一連のプロパティやメソッドを定義することができます。プロトコルは、私たちが使いたい一連のプロパティやメソッドを定義するもので、そのプロパティやメソッドを実装するわけではありません。

例えば、新しいVehicleプロトコルはこのように定義することができる。
"""
//protocol Vehicle {
//    func estimateTime(for distance: Int) -> Int
//    func travel(distance: Int)
//}
"""
それを分解してみよう。

新しいプロトコルを作成するには、protocol と書き、その後にプロトコル名を記述します。これは新しい型なので、大文字で始まるキャメルケースを使用する必要があります。
プロトコルの内部には、このプロトコルが期待通りに動作するために必要なすべてのメソッドをリストアップします。
これらのメソッドは内部にコードを含んでおらず、関数本体も提供されていません。そのかわり、メソッド名、パラメータ、戻り値の型を指定しています。また、必要であれば、メソッドに throw や mutating という印をつけることもできます。
さて、プロトコルを作成しましたが、これがどのように役立っているでしょうか？

さて、次はそのプロトコルで動作する型を設計することができます。これは、プロトコルの要求事項を実装した新しい構造体、クラス、列挙型を作成することを意味し、プロトコルの採用または適合と呼ぶプロセスです。

プロトコルは、存在しなければならない機能の全てを指定するのではなく、必要最低限の機能のみを指定します。つまり、プロトコルに準拠した新しい型を作れば、必要に応じて様々なプロパティやメソッドを追加することができるのです。

例えば、Vehicleに準拠したCar構造体を作るには、次のようにします。
"""
//struct Car: Vehicle {
//    func estimateTime(for distance: Int) -> Int {
//        distance / 50
//    }
//
//    func travel(distance: Int) {
//        print("I'm driving \(distance)km.")
//    }
//
//    func openSunroof() {
//        print("It's a nice day!")
//    }
//}
"""
このコードには、特に注意していただきたい点がいくつかあります。

サブクラスをマークする方法と同じように、Carという名前の後にコロンを使用することで、CarがVehicleに準拠していることをSwiftに伝えています。
私たちがVehicleにリストしたすべてのメソッドは、Carに正確に存在しなければなりません。それらがわずかに異なる名前を持っている場合、異なるパラメータを受け入れ、異なる戻り値の型を持っているなど、Swiftは私たちがプロトコルに準拠していないことを言います。
Car のメソッドは、プロトコルで定義したメソッドの実際の実装を提供します。この場合、私たちの構造体は、ある距離をドライブするのに何分かかるかの概算を提供し、travel()が呼び出されたときにメッセージを表示することを意味します。
openSunroof()メソッドはVehicleプロトコルのものではありませんし、多くの車種にはサンルーフがないので、実際には意味を持ちません。しかし、プロトコルは適合する車種が持つべき最低限の機能のみを記述しており、必要に応じて独自に追加することができるので、それは問題ありません。
というわけで、プロトコルを作成し、そのプロトコルに準拠したCar構造体を作成しました。

最後に、先ほどのcommute()関数を更新して、Carに追加した新しいメソッドを使用するようにしましょう。

"""
//func commute(distance: Int, using vehicle: Car) {
//    if vehicle.estimateTime(for: distance) > 100 {
//        print("That's too slow! I'll try a different vehicle.")
//    } else {
//        vehicle.travel(distance: distance)
//    }
//}
//
//let car = Car()
//commute(distance: 100, using: car)

"""
このコードはすべて動作しますが、ここではプロトコルは実際には何の価値も付加していません。確かにCarの内部で2つの非常に特殊なメソッドを実装するようになりましたが、プロトコルを追加しなくてもできたはずです。

ここで賢い部分がやってきます。SwiftはVehicleに適合する型はestimateTime()とtravel()メソッドの両方を実装しなければならないことを知っているので、実際にCarではなくVehicleをパラメータの型として使用することができます。私たちはこの関数を次のように書き直すことができます。
"""
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}
"""
今、私たちは、この関数が、そのタイプがVehicleプロトコルに準拠している限り、データの任意のタイプで呼び出されることができると言っています。Swift は estimateTime() と travel() メソッドが存在することを確実に知っているので、関数の本体は変更する必要がありません。

なぜこれが便利なのかまだ不思議に思っているのであれば、次の構造体を考えてみてください。

"""
//struct Bicycle: Vehicle {
//    func estimateTime(for distance: Int) -> Int {
//        distance / 10
//    }
//
//    func travel(distance: Int) {
//        print("I'm cycling \(distance)km.")
//    }
//}
//
//let bike = Bicycle()
//commute(distance: 50, using: bike)
//let car = Car()
//commute(distance: 50, using: car)
"""
今、私たちは同じくVehicleに準拠した2番目の構造体を持っており、プロトコルの力が明らかになるところです：今、私たちはCarまたはBicycleのどちらかをcommute()関数に渡すことができます。内部では、この関数はすべてのロジックを持つことができ、estimateTime() や travel() を呼び出すと Swift は自動的に適切なものを使用します - 車を渡すと「運転しています」と言い、自転車を渡すと「自転車に乗っています」と言うのです。

つまり、プロトコルは、正確な型ではなく、どのような機能を扱うかについて話すことができます。このパラメータは車でなければならない」ではなく、「このパラメータは、移動時間の推定と新しい場所への移動ができれば、どんなものでもよい」と言えるのです。

メソッドと同様に、適合する型に必ず存在するプロパティを記述するプロトコルも書くことができる。そのためには、var と書き、次にプロパティ名を書き、そしてそれが読み取り可能か書き込み可能かを列挙します。

例えば、Vehicleに適合する全ての型は、座席の数と現在の乗客の数を指定しなければならない、と指定することができます。
"""
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

"""
そのため、2つのプロパティが追加されます。

nameと呼ばれる文字列で、読み取り可能である必要があります。これは定数という意味かもしれませんが、ゲッターを持つ計算されたプロパティという意味かもしれません。
currentPassengersと呼ばれる整数。これは、変数であることを意味するかもしれないが、ゲッターとセッターを持つ計算されたプロパティである可能性もある。
プロトコルがメソッドの実装を提供できないのと同じように、プロトコルではデフォルト値を提供できないので、両方とも型アノテーションが必要である。

これらの2つの余分な要件がある状態で、Swift は、Car と Bicycle の両方が、プロパティがないため、もはやプロトコルに適合していないことを警告します。それを修正するために、Car に以下のプロパティを追加することができます。
"""

struct Car: Vehicle {
    // 追加したプロパティ
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}
let car = Car()
commute(distance: 50, using: car)

"""
そして、これらをバイシクルに。

"""
struct Bicycle: Vehicle {
    // 追加したプロパティ
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)

"""
もし { get set } を使うなら、定数プロパティを使ったプロトコルに準拠することはできないのです。

今、私たちのプロトコルは、2つのメソッドと2つのプロパティを必要とし、私たちのコードが動作するために、すべての適合する型は、これらの4つのものを実装する必要があることを意味します。これは、Swift が機能が存在することを確実に知っていることを意味するので、それに依存したコードを書くことができます。

たとえば、車両の配列を受け取り、それを使ってオプションの範囲にわたって見積もりを計算するメソッドを書くことができます。
"""
func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}
"""
つまり、Vehicleプロトコルに準拠したCarやBicycleなどの構造体を渡すと、自動的に動作するようになるのです。
"""
getTravelEstimates(using: [car, bike], distance: 150)

"""
プロトコルをパラメータとして受け取るだけでなく、必要であれば関数からプロトコルを返すこともできます。

ヒント: プロトコルは、カンマで区切ってひとつずつ列挙すれば、必要な数だけ適合させることができます。もし、サブクラスを作成してプロトコルに準拠する必要がある場合は、親クラスの名前を先に記述し、その後にプロトコルを記述するようにしましょう。
"""
