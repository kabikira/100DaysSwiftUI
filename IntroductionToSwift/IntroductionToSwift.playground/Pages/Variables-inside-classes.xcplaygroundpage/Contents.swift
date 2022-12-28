//: [Previous](@previous)

import Foundation

"""
Swift のクラスは道標のように少し働きます。私たちが持っているクラスインスタンスのすべてのコピーは、実際にはデータの同じ基礎的な部分を指す道標です。私たちが持っているクラスのインスタンスのすべてのコピーは、実際には同じ基礎となるデータの部分を指す道標です。ほとんどの場合、1つのコピーを変更すると他のすべてのコピーが変更されるため、これは重要ですが、クラスが変数のプロパティを処理する方法のため、それも重要です。

この小さなコードサンプルは、どのように動作するかを示しています。

"""
//class User {
//    var name = "Paul"
//}
//
//let user = User()
//user.name = "Taylor"
//print(user.name)
"""
この場合、一定のUserインスタンスが作成されますが、それを変更すると、定数値も変更されます。これは悪いことでしょう？

でも、定数の値はまったく変わっていないんです。確かにクラスの中のデータは変わりましたが、クラスのインスタンス自体、つまり私たちが作ったオブジェクトは変わっていませんし、実際、定数にしているので変更することはできません。

例えば、あるユーザーを指し示すサインポイントを定数で作成し、そのユーザーのネームタグを消して別の名前を書き込んだとしましょう。そのユーザーは変わっていませんが、その人の内部データの一部が変わってしまったのです。

ここで、letを使ってnameプロパティを定数にしておけば、変更されることはありません。つまり、あるユーザーを指し示す道標は一定ですが、そのユーザーの名前は永久に消えないインクで書かれています。

それに対して、userインスタンスとnameプロパティの両方を変数にしたらどうなるでしょうか。この場合、プロパティを変更することもできますが、まったく新しいユーザー・インスタンスに変更することも可能です。例えるなら、道標を回して全く別の人を指し示すようなものです。

このコードで試してみてください。

"""
class User {
    var name = "Paul"
}

var user = User()
user.name = "Taylor"
user = User()
print(user.name)
"""
なぜなら、名前を "Taylor" に変更したにもかかわらず、ユーザーオブジェクト全体を新しいもので上書きし、"Paul" に戻してしまったからです。

最後のバリエーションは、インスタンスが変数でプロパティが定数というもので、新しいUserを作ろうと思えば作れるが、一度作ったらプロパティは変えられないというものです。

つまり、4つのオプションがあるということです。

定数インスタンス、定数プロパティ - 常に同じユーザーを指し示す道標で、常に同じ名前を持っています。
コンスタント・インスタンス、可変プロパティ - 常に同じユーザーを指し示す道標で、その名前は変更可能です。
可変インスタンス、定数プロパティ - 異なるユーザーを指し示すことができる道標ですが、その名前は決して変わりません。
可変インスタンス、可変プロパティ - 異なるユーザーを指すことができる道標で、それらのユーザーは名前を変更することもできます。
これは非常にわかりにくく、また衒学的にさえ見えるかもしれない。しかし、クラス・インスタンスを共有する方法として、重要な役割を担っています。

例えば、Userのインスタンスが与えられたとしましょう。このインスタンスは定数ですが、中のプロパティは変数として宣言されています。このことは、あなたがそのプロパティを変更することができるというだけでなく、より重要なことは、そのプロパティが他の場所で変更される可能性があるということです。あなたのクラスは他のどこかからのコピーかもしれないし、プロパティが変数であるということは、コードの他の部分が不意にそれを変更できることを意味します。

定数プロパティの場合は、現在のコードやプログラムの他の部分がそれを変更することはないと確信できますが、可変プロパティを扱うとなると、クラスインスタンス自体が定数であるかどうかにかかわらず、データが足元で変更される可能性が出てくるのです。

これは構造体とは異なる点で、定数構造体はプロパティを可変にしたとしても、そのプロパティを変更することはできないからです。構造体には道標のようなものがなく、直接データを保持するため、このようなことが起こるのです。つまり、構造体内の値を変更しようとすると、暗黙のうちに構造体自体も変更することになり、定数である構造体ではそれが不可能なのです。

このことから、クラスはデータを変更するメソッドで mutating キーワードを使用する必要がないことがわかります。このキーワードは構造体にとって本当に重要です。なぜなら、定数構造体は、それらがどのように作成されたかに関係なく、そのプロパティを変更することができないため、Swift が定数構造体のインスタンスの変異メソッドを呼び出すのを見たとき、それが許されるべきではないことがわかるからです。

クラスでは、インスタンス自体がどのように作成されたかは、もはや問題ではありません。プロパティが変更可能かどうかを決定する唯一のものは、プロパティ自体が定数として作成されたかどうかです。Swiftは、あなたがプロパティをどのように作ったかを見るだけで、自分自身でそれを見ることができるので、メソッドを特別にマークする必要はもうありません。

"""
class Park {
    var numberOfFlowers = 1000
    func plantFlowers() {
        numberOfFlowers += 50
    }
}
// 定数クラスインスタンス
let park = Park()
//変数クラスインスタンス
// var park = Park()
park.plantFlowers()
print(park.numberOfFlowers)

struct Park2 {
    var numberOfFlowers = 1000
    mutating func plantFlowers() {
        numberOfFlowers += 50
    }
}
//定数構造体インスタンス
//let park2 = Park2()

// 変数構造体インスタンス
var park2 = Park2()
park2.plantFlowers()
print(park2.numberOfFlowers)

class Sun {
    var isNova = false
    func goNova() {
        isNova = true
    }
}
let sun = Sun()
sun.goNova()
print(sun.isNova)

struct Sun2 {
    var isNova = false
    mutating func goNova() {
        isNova = true
    }
}
// let だとエラーになる
var sun2 = Sun2()
sun2.goNova()
print(sun2.isNova)
