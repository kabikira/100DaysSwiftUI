//: [Previous](@previous)

import Foundation

"""
あなたはすでに、Swift がオプショナルをアンラップするために if let を使用する方法を見ました。そしてそれはオプショナルを使用する最も一般的な方法です。しかし、ほとんど同じことを行う2番目の方法があり、それはほとんど同じように一般的です。

それは次のようなものです。
"""
//func printSquare(of number: Int?) {
//    guard let number = number else {
//        print("Missing input")
//        return
//    }
//
//    print("\(number) x \(number) is \(number * number)")
//}
"""
if let と同様に，guard let はオプションの中に値があるかどうかをチェックし，もしあれば値を取り出して，選んだ定数に入れます．

しかし、この方法は物事を裏返します。
"""
var myVar: Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}
// 関数の中じゃないと使えないみたい
//guard let unwrapped = myVar else {
//    print("Run if myVar doesn't have a value inside")
//}
"""
つまり、if let はオプションに値がある場合にその中括弧内のコードを実行し、guard let はオプションに値がない場合にその中括弧内のコードを実行します。これは、コード中のelseの使い方を説明するものです。「オプショナルをアンラップできることを確認し、できない場合は......」ということです。

これは小さな違いに聞こえますが、重要な意味を持ちます。つまり、guard はプログラムの状態が期待通りかどうかをチェックし、もし期待通りでなければ、例えば現在の関数から抜けるという機能を提供するのです。

これはアーリーリターンと呼ばれることもあります。関数の開始時にすべての入力が有効かどうかをチェックし、有効でないものがあれば、コードを実行してすぐに終了します。すべてのチェックが通れば、関数は意図したとおりに実行されます。

guardはまさにこのようなプログラミングのために設計されており、実際、2つの点で役立っている。

関数の入力が有効であることをチェックするためにガードを使用する場合、チェックが失敗した場合、Swift は常に return を使用することを要求します。
チェックがパスし、あなたがアンラップしているオプションが内部に値を持っている場合、ガードコードが終了した後にそれを使用することができます。
先ほどのprintSquare()関数を見れば、これらのポイントの両方が動作しているのがわかると思います。
"""
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}
"""
つまり、if let を使ってオプショナルをアンラップし、何らかの方法で処理できるようにし、guard let を使ってオプショナルがその内部に何かを持っていることを確認し、そうでなければ終了させるのです。

ヒント：optionalをアンラップしないものも含めて、どんな条件でもguardを使うことができます。例えば、guard someArray.isEmpty else { return } を使うかもしれません。
"""
let num: Int? = nil
printSquare(of: num)
