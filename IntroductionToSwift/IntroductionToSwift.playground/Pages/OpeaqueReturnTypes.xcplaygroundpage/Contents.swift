//: [Previous](@previous)

import Foundation


"""
Swiftは、不透明な戻り値型と呼ばれる、本当に不明瞭で、本当に複雑で、しかし本当に重要な機能を提供し、私たちのコードの複雑さを取り除くことができます。正直なところ、もし1つの非常に重要な事実がなければ、私は初心者コースでそれをカバーしないでしょう：あなたが最初のSwiftUIプロジェクトを作るとすぐに、それを見ることができます。

重要：不透明な戻り値の型がどのように機能するか、詳細に理解する必要はありません。しかし、私を信じてください：それは重要であり、有用です。

それでは、2つの簡単な関数を実装してみましょう。
"""
//func getRandomNumber() -> Int {
//    Int.random(in: 1...6)
//}
//
//func getRandomBool() -> Bool {
//    Bool.random()
//}
"""
ヒント：Bool.random()はtrueかfalseのどちらかを返します。ランダムな整数や小数と違って、カスタマイズのオプションがないため、パラメータを指定する必要はありません。

つまり、getRandomNumber() はランダムな整数を返し、getRandomBool() はランダムなブール値を返します。

Int と Bool の両方は、"等しいかどうか比較できる" という意味の Equatable と呼ばれる共通の Swift プロトコルに適合しています。Equatable プロトコルは、次のように == を使用できるようにするものです。
"""
//print(getRandomNumber() == getRandomNumber())

"""
これらの型は両方ともEquatableに適合しているので、このようにEquatableの値を返すように関数を修正することができる。

"""
//func getRandomNumber() -> Equatable {
//    Int.random(in: 1...6)
//}
//
//func getRandomBool() -> Equatable {
//    Bool.random()
//}

"""
しかし、そのコードは動作せず、Swiftは、あなたのSwiftキャリアのこの時点で役に立つとは思えないエラーメッセージを投げつけます。「プロトコル 'Equatable' は、Self または関連する型の要件を持っているので、一般的な制約としてのみ使用することができます。Swift のエラーが意味するのは、Equatable を返すことは意味をなさないということで、なぜ意味をなさないのかを理解することは、不透明な戻り値の型を理解するためのキーとなります。

最初に：はい、あなたは関数からプロトコルを返すことができ、多くの場合、それは本当に役に立つことです。たとえば、ユーザーのためにレンタカーを検索する関数があるとします。この関数では、必要な乗客の数と必要な荷物の量を受け取りますが、いくつかの構造体のうちの 1 つを返送する場合があります。コンパクト、SUV、ミニバン、などです。

そのため、この関数を呼び出した人は、すべての車種を処理するために10種類の関数を書かなくても、リクエストに合った種類の車を受け取ることができます。つまり、コーディングの観点からは、どの車種が返ってくるかは気にする必要はありません。

ここで、IntやBoolを送り返すことを考えてみてください。はい、両方とも Equatable に準拠していますが、それらは互換性がありません。Swift が、それらがどのプロトコルに準拠しているかに関係なく、私たちをさせないので、Int と Bool を比較する == を使用することはできません。

関数からプロトコルを返すことは、情報を隠すことができるので便利です：返される正確な型を述べるのではなく、返される機能に焦点を合わせることができます。Vehicleプロトコルの場合、座席数、おおよその燃料消費量、価格などが返されることになります。つまり、Vehicleが要求するプロパティやメソッドを実装していれば、RaceCarやPickUpTruckなどを返すことができるのです。

このように情報を隠すことは非常に便利ですが、2つの異なるEquatableを比較することができないため、Equatableでは不可能です。getRandomNumber()を2回呼んで2つの整数を取得しても、正確なデータ型を隠してしまっているので比較できません。

これは不透明な戻り値の型が登場するところです。この型は私たちのコードに情報を隠しますが、Swiftコンパイラーからは隠さないようにします。これは、将来的に異なるものを返すことができるように、私たちのコードを内部的に柔軟にする権利を留保することを意味しますが、Swiftは常に返される実際のデータ型を理解し、それを適切にチェックします。

私たちの2つの関数を不透明な戻り値の型にアップグレードするには、次のように、それらの戻り値の型の前にキーワードsomeを追加してください。
"""
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}
print(getRandomNumber() == getRandomNumber())
print(getRandomBool() == getRandomBool())
"""
そして今、getRandomNumber()を2回呼び、==を使用して結果を比較することができます。 私たちの観点から、私たちはまだいくつかのEquatableデータを持っているだけですが、Swiftは舞台裏でそれらが実際に2つの整数であることを知っています。

不透明な戻り値の型を返すことは、私たちが特定の型よりもむしろ返したい機能にまだ焦点を当てることができることを意味します。例えば、getRandomNumber()はDouble.random(in:)を使うように変更しても、コードはうまくいくでしょう。

しかし、ここでの利点は、Swift が常に本当の基礎となるデータ型を知っているということです。微妙な違いですが、Vehicleを返すことは、「どんな種類のVehicle型でも、それが何かはわからない」ことを意味し、一方、あるVehicleを返すことは「特定の種類のVehicle型でも、それがどれなのかは言いたくない」ことを意味します。

この時点であなたの頭はクラクラしていると思いますので、SwiftUIでなぜこれが重要なのか、実際の例を挙げてみましょう。SwiftUIは画面に表示したいレイアウトの種類を正確に知る必要があるので、それを記述するコードを書きます。

英語では、次のようなことを言うかもしれません。"上部にツールバー、下部にタブバーがある画面があり、中央にはカラーアイコンのスクロールグリッドがあり、それぞれのアイコンの下には太字で書かれたアイコンの意味を示すラベルがあり、アイコンをタップするとメッセージが表示されます。"

SwiftUIが私たちのレイアウトを求めるとき、その説明-全体-はレイアウトのための戻り型になります。位置、色、フォントサイズなどを含め、画面に表示したいすべてのものを明示する必要があります。それを返り値としてタイプすることを想像できますか？1マイル（約1.6km）もの長さになってしまいますよ。そして、レイアウトを生成するコードを変更するたびに、それに合わせて戻り値の型を変更する必要があります。

これは、ある種のビュースクリーンが返されることを意味しますが、その1マイルに及ぶ型を書き出す必要がないようにするためです。同時に、Swiftは、それが不透明な戻り値の型がどのように動作するかであるため、実際の基礎となる型を知っています。Swiftは常に返されるデータの正確な型を知っており、SwiftUIはそれを使ってレイアウトを作成します。

私が最初に言ったように、不透明な戻り値は本当に不明瞭で、本当に複雑ですが、本当に重要な機能です。

SwiftUIのコードでいくつかのViewを見るとき、それは事実上Swiftに「これはレイアウトするためにある種のビューを送り返すつもりですが、私は正確なものを書き出したくありません - あなた自身でそれを見つけてください」と伝えているのです。
"""
