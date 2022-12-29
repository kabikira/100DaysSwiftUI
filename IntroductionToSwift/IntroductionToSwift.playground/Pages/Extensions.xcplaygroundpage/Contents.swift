//: [Previous](@previous)

import Foundation
"""
拡張機能を使えば、私たちが作ったものであれ、他の人が作ったものであれ、どんな型にも機能を追加することができます。たとえ、Appleが作った型であってもです。

このことを示すために、trimmingCharacters(in:)と呼ばれる文字列に関する便利なメソッドを紹介したいと思います。これは、文字列の先頭や末尾から特定の種類の文字、たとえば英数字や小数点以下の数字、あるいは最も一般的なものとしては空白や改行などを取り除くものです。

ホワイトスペースとは、スペース文字、タブ文字、およびこれら2つの文字に付随するさまざまな文字の総称である。改行とは、テキストを改行することです。簡単そうに聞こえるかもしれませんが、実際にはもちろん改行の方法は一つではありません。

例えば、ここに左右に空白がある文字列があります。
"""
var quote = "   The truth is rarely pure and never simple   "
//print(quote)
"""
もし、左右の空白と改行を切り詰めたいなら、次のようにすればよい。
"""
//let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
//print(trimmed)
"""
.whitespacesAndNewlines の値は Apple の Foundation API から来ており、実は trimmingCharacters(in:) も同様です。

毎回 trimmingCharacters(in:) を呼び出すのは少し面倒なので、それを短くする拡張機能を書いてみましょう。
"""
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    // 拡張モジュール追加
    mutating func trim() {
        self = self.trimmed()
    }
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
"""
それを分解してみると...。

既存の型に機能を追加したいことをSwiftに伝える、extensionキーワードから始めます。
どの型ですか？次に来るのは、Stringに機能を追加したい場合です。
今、中括弧を開き、最後の閉じる中括弧までのすべてのコードは、文字列に追加するためにあります。
新しい文字列を返すtrimmed()というメソッドを追加しています。
その中で前と同じメソッド trimmingCharacters(in:) を呼び出して、その結果を返します。
ここで self を使っていることに注目してください。これは自動的に現在の文字列を参照しています。これは、現在文字列拡張の中にいるから可能なのです。
これで、空白や改行を取り除きたいときは、次のように書けばよいことになります。

"""
let trimmed = quote.trimmed()
//print(trimmed)
"""
もっと簡単に!

これで入力の手間が省けたけど、普通の関数よりそんなにいいのか？

実は、このような関数を書くこともできたのです。
"""
func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}
"""
そして、このように使いました。

"""
let trimmed2 = trim(quote)
//print(trimmed2)
"""
これは、関数の作成と使用の両方の点で、拡張機能を使用するよりも少ないコードです。このような関数はグローバル関数と呼ばれ、プロジェクト内のあらゆる場所で使用できます。

しかし、エクステンションにはグローバル関数と比較して、以下のような利点があります。

quoteを入力すると。Xcodeは、拡張機能で追加したものをすべて含む、文字列のメソッドのリストを表示します。これによって、私たちの追加機能を簡単に見つけることができます。
グローバル関数を書くと、コードがかなり乱雑になります。整理しにくく、追跡しにくいのです。一方、拡張モジュールは、拡張するデータ型によって自然にグループ化されます。
拡張メソッドは元の型の完全な一部であるため、型の内部データに完全にアクセスすることができます。つまり、例えばプライベートアクセスコントロールが設定されたプロパティやメソッドを使用することができます。
さらに、拡張機能を使用すると、その場で値を変更することが容易になります。つまり、新しい値を返すのではなく、値を直接変更することができるようになります。

たとえば先ほどは、空白や改行が取り除かれた新しい文字列を返す trimmed() メソッドを書きましたが、文字列を直接変更したい場合はこれを拡張モジュールに追加すればよいのです。

"""
//mutating func trim() {
//    self = self.trimmed()
//}
"""
引用文字列は変数として作成されたので、このようにその場でトリミングすることができます。
"""
quote
quote.trim()

"""
このメソッドが今、微妙に異なる命名をしていることに注目してください：新しい値を返すときには trimmed() を使いましたが、文字列を直接変更するときには trim() を使いました。これは意図的なもので、Swiftの設計指針の一部です：その場で変更するのではなく、新しい値を返す場合、reversed()のように、edやingのような語尾を使用すべきです。

ヒント前回は、配列のsorted()メソッドを紹介しました。このルールがわかったので、もし可変長配列を作成したら、新しいコピーを返すのではなく、その場で配列をソートするために sort() を使用できることに気づくはずです。

拡張機能を使用して、型にプロパティを追加することもできますが、ひとつだけルールがあります。その理由は、新しいストアドプロパティを追加すると、データ型の実際のサイズに影響を与えるからです。もし整数に大量のストアドプロパティを追加すると、すべての整数がメモリ上でより多くのスペースを占有する必要があり、さまざまな問題が発生します。

幸いなことに、計算されたプロパティを使っても、多くのことができる。例えば、私が文字列に追加したいプロパティのひとつに lines があります。これは、文字列を個々の行の配列に分割するものです。これは、文字列を任意の境界で分割して文字列配列にする components(separatedBy:) という別の文字列メソッドをラップしたものだ。この場合、境界は新しい行にしたいので、これを文字列拡張子に追加します。
"""
//var lines: [String] {
//    self.components(separatedBy: .newlines)
//}
"""
これで、次のように任意の文字列の lines プロパティを読み取ることができるようになりました。
"""
let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

"""
拡張機能が1行であろうと、複雑な機能の一部であろうと、拡張機能の目的は常に同じです：あなたのコードを書きやすく、読みやすく、そして長期的に保守しやすくすることです。

最後に、拡張機能で作業するときに本当に便利なトリックを1つお見せしたいと思います。以前、Swift が構造体のメンバ単位のイニシャライザを自動的に生成する方法を見たことがあると思いますが、このようなものです。
"""
//struct Book {
//    let title: String
//    let pageCount: Int
//    let readingHours: Int
//}
//
//let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
"""
また、独自のイニシャライザーを作成することは、Swiftがもはや私たちのためにメンバー的なものを提供しないことを意味することを述べました。これは意図的なもので、カスタムイニシャライザーは、このように、いくつかのカスタムロジックに基づいてデータを割り当てたいことを意味するからです。
"""
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int

//    init(title: String, pageCount: Int) {
//        self.title = title
//        self.pageCount = pageCount
//        self.readingHours = pageCount / 50
//    }
}

"""
Swiftがこのインスタンスでメンバーワイズイニシャライザを維持する場合、おおよその読み込み時間を計算するためのロジックをスキップします。

しかし、時には、両方が必要な場合があります - カスタムのイニシャライザを使用する機能が必要ですが、Swift の自動的なメンバー単位のイニシャライザも保持します。この状況では、Swift が何をしているのか正確に知る価値があります。構造体の内部にカスタムイニシャライザを実装する場合、Swift は自動的なメンバー単位のイニシャライザを無効にします。

その余分な小さな詳細は、次に来るものへのヒントを与えるかもしれません：拡張機能の内部にカスタムイニシャライザを実装する場合、Swiftは自動的なメンバー単位のイニシャライザを無効にしません。拡張機能の内部で新しいイニシャライザーを追加すると、デフォルトのイニシャライザーも無効になる場合、私たちからの1つの小さな変更が他のすべての種類のSwiftコードを壊す可能性があることを考えると、これは理にかなっています。

もし私たちがBook構造体にデフォルトのメンバーごとのイニシャライザだけでなく、私たちのカスタムイニシャライザも持たせたかったら、このようにカスタムイニシャライザを拡張機能に配置することになるでしょう。
"""
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
let lotr = Book(title: "Lord of the Rings", pageCount: 1178)
print(lotr)
let lotr2 = Book(title: "人間失格", pageCount: 120, readingHours: 60)
print(lotr2)
"""
構造体を拡張してinit機能をつけるとBook構造体の場合pageCountを渡しても渡さなくてもよい状態にできる
"""

