//: [Previous](@previous)

import Foundation

"""
待って...Swiftにはオプションのアンラップの3つ目の方法があるのですか？そうです。それは nil 結合演算子と呼ばれ、オプショナルをアンラップして、オプショナルが空だった場合にデフォルト値を提供することができます。

少し話を戻しましょう。
"""
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

//let new = captains["Serenity"]
//print(new)
"""
これは、captains辞書の存在しないキーを読み取るもので、newはnilに設定するオプションの文字列となることを意味します。

nil合体演算子(？)を使えば、このように任意のオプションにデフォルト値を設定することができます。
"""
//let new = captains["Serenity"] ?? "N/A"
//print(new)
"""
これはキャプテンズディクショナリーから値を読み取り、アンラップしようとします。もしオプションの中に値があれば、それは送り返されてnewに格納されますが、そうでなければ代わりに「N/A」が使われます。

つまり、オプショナルが何を含んでいても、つまり値であっても nil であっても、最終的には new はオプショナルではなく実際の文字列になるということです。それは、captainsの値の中にある文字列かもしれないし、「N/A」かもしれません。

辞書から読み込むときにデフォルト値を指定することはできないのだろうか？そう考えているのなら、まったくそのとおりです。
"""
let new = captains["Serenity", default: "N/A"]
"""
これでは全く同じ結果が得られるので、nil合体演算子は意味がないように思われるかもしれません。しかし、nil合体演算子は辞書だけでなく、あらゆるオプショナルでも動作します。

たとえば、配列のrandomElement()メソッドは配列からランダムに1つの項目を返しますが、これは空の配列に対して呼び出す可能性があるため、オプショナルを返します。そこで、nil合体を使ってデフォルトを提供することができます。
"""
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"
"""
また、構造体にオプションのプロパティがあり、そのプロパティがない場合のデフォルトを設定することもできます。
"""
struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)
"""
文字列から整数を作成する場合、変換に失敗した可能性があるため、実際にはオプションのInt?を返してもらうと便利です。ここでは、nil合体を使って、次のようにデフォルト値を提供することができます。
"""
let input = ""
let number = Int(input) ?? 0
print(number)
"""
ご覧のように、nil合体演算子は、オプショナルで中の値を使いたい場合や、値がない場合にデフォルト値を提供したい場合に便利です。
"""
