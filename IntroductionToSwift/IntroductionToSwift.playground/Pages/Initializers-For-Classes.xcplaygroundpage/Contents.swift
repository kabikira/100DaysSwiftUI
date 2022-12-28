//: [Previous](@previous)

import Foundation
"""
Swiftのクラス初期化子は、構造体初期化子よりも複雑ですが、少し選択することで、本当に重要な部分に集中できます。子クラスにカスタム初期化子がある場合、それがあれば、それ自身のプロパティを設定し終わった後、常に親の初期化子を呼び出す必要があります。

私が以前に言ったように、Swiftは自動的にクラスのためのメンバー単位のイニシャライザを生成しません。これは、継承が起こっているかどうかにかかわらず適用されます - あなたのためにメンバー単位のイニシャライザを生成することはありません。したがって、あなた自身のイニシャライザーを書くか、クラスのすべてのプロパティにデフォルト値を提供する必要があります。

まず、新しいクラスを定義することから始めましょう。
"""
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}
"""
これは、1つのBooleanプロパティと、そのプロパティの値を設定するイニシャライザを備えています。ここでselfを使うことで、isElectricパラメータを同名のプロパティに代入していることが明確になることを忘れないでください。

さて、Vehicleを継承したCarクラスを作りたい場合、まずこのような書き方から始めます。
"""
//class Car: Vehicle {
//    let isConvertible: Bool
//
//    init(isConvertible: Bool) {
//        self.isConvertible = isConvertible
//    }
//}
"""
しかし、Swiftはそのコードを構築することを拒否します：私たちは、Vehicleクラスが電気かどうかを知る必要があると言いましたが、そのための値を提供していません。

Swiftが私たちにやってほしいことは、CarにisElectricとisConvertibleの両方を含むイニシャライザーを提供することですが、私たち自身がisElectricを保存しようとするのではなく、代わりにそれを渡す必要があります。

以下はその様子です。
"""
class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}
"""
super は Swift が自動的に提供してくれる値のひとつで、self と似ています: これは、イニシャライザなどの、親クラスに属するメソッドを呼び出すことを可能にします。必要であれば、他のメソッドで使用することができます; それはイニシャライザーに限定されません。

さて、両方のクラスで有効なイニシャライザができたので、次のようにCarのインスタンスを作ってみましょう。

"""
let teslaX = Car(isElectric: true, isConvertible: false)

"""
ヒント：サブクラスが独自のイニシャライザを持たない場合、自動的に親クラスのイニシャライザを継承します。
"""
