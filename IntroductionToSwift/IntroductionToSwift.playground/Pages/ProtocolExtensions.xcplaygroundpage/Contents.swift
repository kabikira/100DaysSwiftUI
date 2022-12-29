//: [Previous](@previous)

import Foundation

"""
プロトコルは、適合する型が遵守すべき契約を定義し、拡張機能は既存の型に機能を追加することができます。しかし、もしプロトコルの上に拡張機能を書くことができたらどうなるだろうか？

Swift は適切な名前のプロトコル拡張を使用して、まさにこれをサポートしているので、もう不思議ではありません：メソッドの実装を追加するためにプロトコル全体を拡張することができ、そのプロトコルに適合するすべての型がそれらのメソッドを取得することを意味します。

些細な例から始めましょう。配列に値があるかどうかをチェックする条件を、このように書くのはよくあることです。

"""
let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}
"""
このように、ブール演算子「！」を使うことを好む人もいます。

"""
if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}
"""
私はどちらのアプローチもあまり好きではありません。なぜなら、「ある配列が空でない場合」というのが、私には自然に読み取れないからです。

この問題は、以下のようなArrayのシンプルな拡張で解決できます。
"""
extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
"""
ヒント：Xcodeのプレイグラウンドは、上から下に向かってコードを実行するので、その拡張機能が使用される場所の前に置くことを確認してください。

これで、より理解しやすいと思うコードを書くことができるようになりました。
"""
if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}
"""
しかし、もっといい方法があります。配列にはisNotEmptyが追加されましたが、集合や辞書にはどうでしょうか？もちろん、同じことを繰り返してコードを拡張機能にコピーすることもできますが、もっと良い解決策があります。配列、集合、辞書はすべてCollectionという組み込みプロトコルに準拠しており、contains()、sorted()、reversed()などの機能を備えている。

これは重要なことで、CollectionはisEmptyプロパティの存在を必要とするものでもあるからだ。つまり、Collectionの拡張機能を書いても、isEmptyが必須なので、アクセスすることができるのです。つまり、コードの中でArrayをCollectionに変更することで、これを得ることができるのです。
"""
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
"""
その一言の変更で、配列、セット、辞書、そして Collection に準拠した他の型でも isNotEmpty を使用できるようになりました。信じられないかもしれませんが、その小さな拡張は、他の多くの人々がそれを読みやすいと感じるので、何千ものSwiftプロジェクトに存在しています。

さらに重要なことは、プロトコルを拡張することで、そうでなければ個々の構造体の内部で行う必要がある機能を追加していることです。これは本当に強力で、Appleがプロトコル指向プログラミングと呼ぶ技術につながります。プロトコルでいくつかの必要なメソッドをリストアップし、プロトコル拡張の中にそれらのデフォルトの実装を追加することができます。そして、すべての適合する型は、これらのデフォルトの実装を使用するか、必要に応じて独自の実装を提供することになります。

例えば、次のようなプロトコルがあったとします。
"""
protocol Person {
    var name: String { get }
    func sayHello()
    func sayHey()
    var sayGood: String { get }
}
"""
つまり、全ての適合する型はsayHello()メソッドを追加しなければなりませんが、このように拡張機能としてそのデフォルトの実装を追加することも可能です。
"""
extension Person {
    
    func sayHello() {
        print("Hi, I'm \(name)")
    }
    func sayHey() {
        print("Hey")
    }
    var sayGood: String {
        "Good"
    }
}
"""

そして今、適合するタイプは、必要であれば独自の sayHello() メソッドを追加することができます。

つまり、sayHello() メソッドを使用しない従業員を作成することができます。
"""

struct Employee: Person {
    let name: String

}
"""
しかし、Personに準拠しているため、私たちの拡張機能で提供したデフォルトの実装を使用することができました。

"""
let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()
taylor.sayHey()
print(taylor.sayGood)

"""
Swift はプロトコル拡張を多用しますが、正直なところ、まだそれらを詳細に理解する必要はありません - プロトコル拡張を使用しなくても、素晴らしいアプリを構築することができます。この時点で、あなたはそれらが存在することを知っており、それで十分です!
"""

class Employee2: Person {
    let name: String
    //クラスはイニシャライザ省略できない
    init(name: String) {
        self.name = name
    }
}
let panda = Employee2(name: "panda")
panda.sayHello()
