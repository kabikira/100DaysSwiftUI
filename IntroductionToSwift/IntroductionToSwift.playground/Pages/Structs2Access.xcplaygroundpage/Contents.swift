//: [Previous](@previous)

import Foundation
"""
デフォルトでは、Swift の構造体は、そのプロパティとメソッドに自由にアクセスできますが、しばしばそれはあなたが望むものではありません - 時には、外部からのアクセスからいくつかのデータを隠したいことがあります。たとえば、プロパティに触れる前に適用する必要があるロジックがある場合や、いくつかのメソッドが特定の方法または順序で呼び出される必要があることを知っていて、外部から触れないようにする場合などです。

この問題を構造体の例で説明します。
"""
struct BankAccount {
    var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

"""
それは、銀行口座への入金や出金の方法があり、このように使うべきである。
"""
var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}
"""
しかし、ファンドプロパティは外部で公開されているだけなので、それを直接触れないようにすることはできないのでしょうか？このようなコードは許されるのです。
"""
account.funds -= 1000
print(account.funds)
"""
そうすると、人が持っている以上のお金を持ち出さないようにするためのロジックを完全に回避してしまい、今度はプログラムがおかしな動きをする可能性があります。

これを解決するために、構造体に属するメソッド、同様に計算されたプロパティ、プロパティオブザーバなどによって、資金は構造体の内部でのみアクセス可能であるべきだと Swift に伝えることができます。

これには1つだけ余分な単語が必要です。

"""
private var funds = 0
"""
そして今、構造体の外側から資金にアクセスすることはできませんが、deposit() と withdraw() の両方の内部では可能です。構造体の外側から資金を読み書きしようとすると、Swiftはコードのビルドを拒否します。

これは、構造体の外部から構造体のプロパティやメソッドにアクセスする方法を制御するため、アクセス制御と呼ばれています。

Swiftはいくつかのオプションを提供してくれますが、学習しているときにはほんの一握りしか必要ないでしょう。

private は、「構造体の外部にこれを使用させない」ために使用します。
fileprivateを使用して、「現在のファイル以外のものにこれを使用させない」ようにします。
publicは、"誰でも、どこでも、これを使えるようにする "ために使います。
もう一つ、学習者にとって便利なオプションがあります。それは、private(set)です。これは「このプロパティは誰でも読めるようにするが、私のメソッドにだけ書き込ませる」という意味だ。BankAccountでこれを使った場合、構造体の外側でaccount.fundsを表示することはできますが、実際に値を変更できるのはdeposit()とdraw()だけということになります。

この場合、private(set)が最適だと思います。現在の銀行口座の残高をいつでも読み取ることができますが、私のロジックを通さなければ変更することはできません。

考えてみれば、アクセスコントロールは、あなたやあなたのチームの他の開発者ができることを制限することであり、それは賢明なことです。もし私たちがSwift自体に私たちが間違いを犯さないようにさせることができるなら、それは常に賢い行動です。

重要：1つ以上のプロパティにプライベートアクセスコントロールを使用する場合、あなた自身のイニシャライザーを作成する必要がある可能性があります。
"""

struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: String...) {
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royalHigh = School(staff: "Mrs Hughes","panda","koara")
print(royalHigh.staffNames)
