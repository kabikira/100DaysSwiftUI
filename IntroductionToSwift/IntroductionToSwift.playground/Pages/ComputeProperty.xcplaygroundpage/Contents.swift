//: [Previous](@previous)

import Foundation
"""
構造体は2種類のプロパティを持つことができます。ストアドプロパティは構造体のインスタンス内のデータの一部を保持する変数または定数で、コンピューテッドプロパティはアクセスされるたびにプロパティの値を動的に計算します。つまり、ストアドプロパティと関数の両方が混ざったようなプロパティで、ストアドプロパティのようにアクセスでき、関数のように動作するプロパティです。

例として、以前は Employee 構造体があり、その従業員の休暇があと何日残っているかを追跡することができました。以下は、その簡略版です。
"""

//struct Employee {
//    let name: String
//    var vacationRemaining: Int
//}
//
//var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
//archer.vacationRemaining -= 5
//print(archer.vacationRemaining)
//archer.vacationRemaining -= 3
//print(archer.vacationRemaining)

"""
この従業員に14日間の休暇を割り当て、取得した日数に応じてそれを差し引くのですが、そうすると、その従業員にもともと与えられていた日数がわからなくなってしまいます。

これを調整して、次のように計算されたプロパティを使用することができます。
"""
//struct Employee {
//    let name: String
//    var vacationAllocated = 14
//    var vacationTaken = 0
//
//    var vacationRemaining: Int {
//        vacationAllocated - vacationTaken
//    }
//}
"""
現在では、vacationRemainingを直接割り当てるのではなく、割り当てられた休暇の量から取得した休暇を差し引くことで計算されるようになっています。

vacationRemainingを読み出すときは、通常のストアドプロパティと同じように見える。
"""
//var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
//archer.vacationTaken += 4
//print(archer.vacationRemaining)
//archer.vacationTaken += 4
//print(archer.vacationRemaining)
"""
これは本当に強力なものです。私たちはプロパティのように見えるものを読んでいますが、裏ではSwiftが毎回その値を計算するためにいくつかのコードを実行しているのです。

しかし、私たちはそれに書き込むことができません。なぜなら、それがどのように処理されるべきか Swift に伝えていなかったからです。それを解決するために、私たちはゲッターとセッターの両方を提供する必要があります - それぞれ「読み取るコード」と「書き込むコード」のための空想の名前です。

この場合、ゲッターは既存のコードだけなので、十分にシンプルだ。ある従業員の vacationRemaining を設定する場合、その従業員の vacationAllocated の値を増やすのか減らすのか、それとも vacationAllocated はそのままで vacationTaken を変更するのか、興味深いところです。

前者が正しいと仮定して、その場合のプロパティを以下に示します。

"""
//var vacationRemaining: Int {
//    get {
//        vacationAllocated - vacationTaken
//    }
//
//    set {
//        vacationAllocated = vacationTaken + newValue
//    }
//}
struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    // ゲッターとセッター追加
    var vacationRemaining: Int {
        get {
            print("よびだされました")
            return vacationAllocated - vacationTaken

        }

        set {
            print("かきかえられました")
            vacationAllocated = vacationTaken + newValue
            print("newValue",newValue)
            print(vacationAllocated)
        }
    }
}
"""
get と set が、値を読み書きするときに実行するコードの個々のピースをマークする方法に注目してください。より重要なのは、newValue に注目してください。これは Swift によって自動的に提供され、ユーザーがプロパティに割り当てようとしていたどんな値でも保存します。

ゲッターとセッターの両方があることで、今 vacationRemaining を修正することができます。

"""
var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
//archer.vacationTaken += 4
//print(archer.vacationRemaining)

archer.vacationRemaining += 1

"""
SwiftUIは計算されたプロパティを広範囲に使用します。
"""
"""
ゲッターは普通に呼び出したときに発動
セッターは数値などをプロパティに書き込んだりした時ゲッターの次に発動
newValueはプロパティで返された数値や渡された数値全て
"""
