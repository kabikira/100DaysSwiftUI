//: [Previous](@previous)

import Foundation

"""
Swift は予測可能であることを好みます。つまり、可能な限り、安全で私たちが期待する方法で動作するコードを書くことを推奨しています。あなたはすでに投げ関数に出会いましたが、Swiftにはオプショナルと呼ばれる予測可能性を確保するための別の重要な方法があります - 「このものは値を持つかもしれないし、持たないかもしれない」という意味の言葉です。

オプショナルが実際に使われているのを見るには、次のコードを考えてみてください。

"""
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]
"""
そこで、2つのキーを持つ[String: String]辞書を作成します。マリオとルイージです。そして、キー "Peach" に付随する値を読み取ろうとしますが、これは存在しません。また、不足データの代わりに送り返すデフォルト値も用意していません。

このコードが実行された後、peachOppositeはどうなるでしょうか？これは [String: String] 辞書で、キーは文字列、値は文字列ですが、存在しないキーを読み込もうとしただけです。

Swiftの解決策は、存在するかもしれないし、しないかもしれないデータを意味する、オプショナルと呼ばれるものです。それらは主に、データ型の後にクエスチョンマークを置くことで表現されるので、この場合、peachOppositeはStringではなく、String?

オプショナルは、中に何かが入っているかどうかわからない箱のようなものです。つまり、String?は中に文字列が入っているかもしれないし、何も入っていないかもしれない、つまり「値なし」を意味するnilという特別な値が入っているかもしれないということです。int、double、boolはもちろん、enum、struct、classのインスタンスなど、どのようなデータもオプションにすることができる。

さて、ここで何が変わったのだろう？以前はStringで、今はString? で、実際に書くコードはどう変わるのだろう？" と思っていることでしょう。

まあ、これが決定的なことです。Swiftはコードが予測可能であることを好みます。それは、そこにないかもしれないデータを使わせないことを意味します。オプショナルの場合、それはそれを使用するためにオプショナルをアンラップする必要があることを意味します - 値があるかどうかを確認するためにボックスの内側を見て、ある場合は、それを取り出して使用する必要があります。

Swift はオプショナルをアンラップする 2 つの主要な方法を提供しますが、最もよく目にするのは次のような方法です。
"""
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}
"""
この if let 構文は Swift では非常に一般的で、条件 (if) を作成することと定数 (let) を作成することを組み合わせています。一緒になって、3つのことを行います。

辞書からオプションの値を読み取ります。
オプションの中に文字列がある場合、それはラップ解除されます - つまり、中の文字列は marioOpposite 定数に入れられます。
条件が成功した - オプショナルをアンラップできた - ので、条件のボディが実行される。
コンディションのボディが実行されるのは、オプショナルに値が含まれていた場合のみです。もちろん、elseブロックを追加したければ、追加すればいい。
"""
var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}
"""
オプションはシュレーディンガーのデータ型のようなものだと考えてください。箱の中に値があるかもしれないし、ないかもしれない。

しかし、より良いソフトウェアを作るためには、オプショナルは本当に重要なものなのです。オプショナルがデータが存在するかしないかを意味するのと同じように、非オプショナル（通常の文字列、整数など）はデータが利用可能でなければならないことを意味しますよね。

もし非オプションのIntがあれば、その中には必ず数字が入っていることになる。それは100万かもしれないし0かもしれませんが、それでも数字であることに変わりはなく、必ず存在することが保証されています。それに比べて、nilに設定されたオプションのIntは全く値を持ちません。

同様に、非オプションのStringがある場合、そこに文字列が確実に存在することを意味します。それは「Hello」のようなものかもしれませんし、空の文字列かもしれませんが、どちらもnilに設定されたオプションの文字列とは異なります。

ArrayやDictionaryのようなコレクションを含め、あらゆるデータ型は必要に応じてオプションにすることができます。ここでも、整数の配列には一つ以上の数字が含まれるかもしれないし、あるいはまったく数字が含まれないかもしれないが、どちらもnilに設定されたオプションの配列とは異なるものである。

はっきり言って、nil に設定されたオプションの整数は、0 を保持する非オプションの整数と同じではありません。nil に設定されたオプションの文字列は、現在空の文字列に設定されている非オプションの文字列と同じではありませんし、nil に設定されたオプションの配列は、現在項目を持たない非オプションの配列と同じではありません - 空かどうかにかかわらず、まったくデータがないことを話しているのです。

Zev Eisenbergが言ったように、「Swiftはオプショナルを導入しませんでした。それは非オプショナルを導入したのです"

このように、非オプションの整数を必要とする関数に、オプションの整数を渡そうとすると、これを実際に見ることができます。
"""
func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
//print(square(number: number))
"""
オプショナルな整数がアンラップされる必要があるため、Swift はそのコードのビルドを拒否します - 内部に値がない場合、問題にぶつかるので、非オプショナルが必要な場所でオプショナルな値を使用することはできません。

つまり、オプショナルを使うには、まずこのようにアンラップしなければならない。


"""
if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}
"""
オプショナルをアンラップするとき、それらを同じ名前の定数にアンラップすることは非常に一般的です。これは Swift で完全に許可されており、定数を unwrappedNumber または同様の名前にし続ける必要がないことを意味します。

このアプローチを使用して、我々は前のコードを次のように書き換えることができます。
"""
if let number = number {
    print(square(number: number))
} 
"""
このスタイルは、最初に読んだときは少し戸惑いましたが、今では量子物理学のように感じられます。数は、本当にオプションとノンオプションの両方を同時に持つことができるのでしょうか？そうですね、違いますね。

ここで起こっていることは、一時的に同じ名前の定数をもうひとつ作り、条件のボディの中だけで利用できるようにしているということです。これはシャドウイングと呼ばれ、主に上のようなオプションのアンラップで使用されます。

つまり、コンディションのボディ内部ではラップされていない値、つまりオプショナルなIntではなく本物のIntを使用することができます。- しかし、外側にはまだオプショナルがあります。
"""

func getUsername() -> String? {
    "Taylor"
}
print(getUsername())

if let username = getUsername() {
    print("Username is \(username)")
} else {
    print("No username")
}


let menuItems: [String]? = ["Pizza", "Pasta"]
if let items = menuItems {
    print("There are \(items.count) items to choose from.")
}
