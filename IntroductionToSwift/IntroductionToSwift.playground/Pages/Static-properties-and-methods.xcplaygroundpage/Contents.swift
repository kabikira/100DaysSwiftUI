//: [Previous](@previous)

import Foundation

"""
構造体にプロパティとメソッドをアタッチする方法と、構造体のメソッドを呼び出しても同じ型の別の構造体のプロパティが読み込まれないように、各構造体がこれらのプロパティの独自のコピーを持っていることはお分かりいただけたと思います。

しかし、時には、構造体の特定のインスタンスではなく、構造体自体にプロパティやメソッドを追加して、それらを直接使用できるようにしたい場合があります。私はこのテクニックを2つのことのためにSwiftUIでたくさん使います：例となるデータを作成し、さまざまな場所にアクセスする必要がある固定データを保存します。

最初に、静的なプロパティとメソッドを作成して使用する方法の簡略化された例を見てみましょう。
"""
struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

"""
そこにstaticというキーワードがあることに注目してください。これは、studentCount プロパティと add() メソッドが、構造体の個々のインスタンスではなく、School 構造体自体に属していることを意味します。

このコードを使用するには、次のように記述します。
"""
School.add(student: "Taylor Swift")
print(School.studentCount)

"""
Schoolのインスタンスは作成していません。文字通り、構造体に対して直接add()とstudentCountを使用することができます。これは、これらが両方ともstaticであり、構造体のインスタンスに一意的に存在しないことを意味するからです。

これは、通常の構造体関数では、構造体のインスタンスが定数として作成され、add()を呼び出すときにインスタンスがない場合にのみ必要なことです。

静的なプロパティと非静的なメソッドを混在させたい場合、2つのルールがあります。

静的なコードから非静的なコードにアクセスする場合...運が悪いです。静的なプロパティやメソッドは非静的なプロパティやメソッドを参照することができないので、意味がありません。
静的なコードに非静的なコードからアクセスするには、School.studentCountのような型の名前を常に使用します。また、現在の型を参照するために Self を使用することもできます。
self は構造体の現在の値を指し、Self は現在の型を指します。

ヒント：self と Self の違いを忘れがちですが、考えてみれば Swift の命名の他の部分と同じです。私たちはすべてのデータ型を大文字で始めるので（Int、Double、Bool など）、Self も大文字で始まるのは理にかなっていると言えます。

今、あなたが聞くことができるその音は、"なぜこれが必要なのか？"と言っている千の他の学習者です。確かに、最初は冗長な機能に見えるかもしれません。そこで、私が静的データを使う主な方法を2つ紹介したいと思います。

まず、静的プロパティを使用して、アプリ内の共通データを整理します。たとえば、AppDataのような構造体を使って、さまざまな場所で使用する共有の値を保存することができます。
"""
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}
"""
この方法を使えば、アプリのバージョン番号のようなものを確認したり表示したりする必要がある場合（アバウトスクリーン、デバッグ出力、ログ情報、サポートメールなど）、どこでもAppData.versionを読み取ることができます。

私が静的データをよく使う2つ目の理由は、構造体の例を作成するためです。後で見るように、開発中にアプリのプレビューを表示できるとき、SwiftUIは最もよく機能し、それらのプレビューはしばしばサンプルデータを必要とします。たとえば、1人の従業員のデータを表示する画面を表示する場合、作業中にすべてが正しく見えることを確認できるように、プレビュー画面で従業員の例を表示できるようにしたいと思います。

そのためには、次のように構造体の静的なexampleプロパティを使用するのが最適です。
"""
struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}
"""
これで、デザイン・プレビューで使用する Employee インスタンスが必要な場合はいつでも Employee.example を使用すれば完了です。

冒頭で述べたように、静的なプロパティやメソッドが意味を持つ場面はほんの一握りですが、それでも持っておくと便利なツールです。
"""
print(Employee.example)
