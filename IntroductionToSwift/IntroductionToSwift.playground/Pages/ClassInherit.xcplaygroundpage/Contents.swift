//: [Previous](@previous)

import Foundation

"""
Swift では、既存のクラスをベースにしてクラスを作成することができます。これは、継承として知られている処理です。あるクラスが別のクラス (その「親」または「スーパー」クラス) から機能を継承するとき、Swift は新しいクラスにその親クラスからのプロパティとメソッドへのアクセス (「子クラス」または「サブクラス」) を与え、新しいクラスの振る舞いをカスタマイズするために小さな追加や変更を行うことができるようにします。

あるクラスを別のクラスから継承させるには、子クラスの名前の後にコロンを書き、親クラスの名前を追加します。例えば、1つのプロパティとイニシャライザを持つEmployeeクラスは次のとおりです。
"""
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    // メゾット追加
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}
"""
Employee のサブクラスを 2 つ作成し、それぞれが hours プロパティとイニシャライザを獲得することができます。

"""
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    // 継承したメソッドを変更
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}
"""
これらの2つの子クラスが時間を直接参照できることに注目してください。まるで自分たちでそのプロパティを追加したかのようですが、私たちは同じことを繰り返す必要はありません。

これらの各クラスは Employee を継承しますが、その後、それぞれ独自のカスタマイズを追加します。したがって、それぞれのインスタンスを作成して work() を呼び出すと、異なる結果が得られます。
"""
let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()
"""
プロパティの共有だけでなく、メソッドの共有も可能で、そのメソッドは子クラスから呼び出すことができます。例として、Employee クラスに次のコードを追加してみます。
"""
//func printSummary() {
//    print("I work \(hours) hours a day.")
//}
"""
Developer は Employee を継承しているので、このように Developer のインスタンスに対して printSummary() をすぐに呼び出すことができます。


"""
let novall = Developer(hours: 8)
novall.printSummary()


"""
継承したメソッドを変更する場合は、少し複雑になります。例えば、Employee に printSummary() を組み込みましたが、子クラスの 1 つに少し異なる動作が必要かもしれません。

子クラスが親クラスからメソッドを変更したい場合、あなたは子クラスのバージョンでオーバーライドを使用する必要があります。これは2つのことを行います。

オーバーライドを使用せずにメソッドを変更しようとすると、Swift はコードのビルドを拒否します。これは、誤ってメソッドをオーバーライドすることを阻止します。
オーバーライドを使用しても、メソッドが実際には親クラスから何かをオーバーライドしていない場合、おそらくミスを犯したので、Swift はコードのビルドを拒否します。
ですから、開発者がユニークな printSummary() メソッドを持つことを望むなら、これを Developer クラスに追加するでしょう。


"""
//override func printSummary() {
//    print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
//}
"""
Swift は、メソッドのオーバーライドがどのように機能するかについてスマートです。親クラスに何も返さない work() メソッドがあり、子クラスに作業が行われる場所を指定する文字列を受け入れる work() メソッドがある場合、親のメソッドを置き換えるわけではないので、オーバーライドは必要ではありません。

ヒント: クラスが継承をサポートすべきでないことが確実に分かっている場合は、 そのクラスを final としてマークすることができます。これは、そのクラス自身が他のクラスを継承することはできるが、継承元として使用することはできないことを意味します - 子クラスが final クラスを親として使用することはできません。
"""

