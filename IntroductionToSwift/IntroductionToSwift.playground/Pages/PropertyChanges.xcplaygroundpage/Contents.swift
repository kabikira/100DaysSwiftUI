//: [Previous](@previous)

import Foundation

"""
Swift では、プロパティが変更されたときに実行される特別なコードの部分である、プロパティオブザーバを作成することができます。これらは 2 つの形式を取ります: プロパティがちょうど変更されたときに実行する didSet オブザーバーと、プロパティが変更される前に実行する willSet オブザーバーです。

プロパティオブザーバがなぜ必要なのか、次のようなコードを考えてみてください。
"""
//struct Game {
//    var score = 0
//}
//
//var game = Game()
//game.score += 10
//print("Score is now \(game.score)")
//game.score -= 3
//print("Score is now \(game.score)")
//game.score += 1

"""
Game構造体を作成し、そのスコアを数回変更します。スコアが変わるたびにprint()行が続くので、変更を追跡することができる。ただし、バグがある。最後にスコアがプリントされずに変化してしまったのだ。

プロパティオブザーバでは、didSet を使って print() 呼び出しをプロパティに直接アタッチすることで、この問題を解決することができ、いつどこで変更されても、常に何らかのコードを実行することができます。

以下は同じ例で、今度はプロパティオブザーバを設置したものです
"""
//struct Game {
//    var score = 0 {
//        didSet {
//            print("Score is now \(score)")
//        }
//    }
//}
//
//var game = Game()
//game.score += 10
//game.score -= 3
//game.score += 1

"""
必要であれば、Swift は自動的に didSet 内の定数 oldValue を提供し、あなたが何から変更したかに基づいてカスタム機能を持つ必要がある場合に備えています。また、プロパティが変更される前にいくつかのコードを実行する willSet バリアントがあり、それに基づいて別のアクションを取りたい場合に、割り当てられる新しい値を提供します。

コードが実行されたときの流れを見ることができるように、値が変更されるときにメッセージを表示します。
"""
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")
"""
はい、配列に追加すると、willSet と didSet の両方がトリガーされるので、このコードは実行時にたくさんのテキストを表示します。

実際には、willSetはdidSetよりもはるかに少ない回数しか使用されませんが、それでも時々目にすることがあるので、その存在を知っておくことは重要なことです。game.score += 1 のような些細なことがきっかけで集中的な作業を行うと、定期的に問題が発生し、パフォーマンスの問題が生じます。
"""
