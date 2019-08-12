import UIKit

//实例方法要写在它所属的类型的前后大括号之间。实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。实例方法只能被它所属的类的某个特定实例调用。实例方法不能脱离于现存的实例而被调用。
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
//和调用属性一样，用点语法（dot syntax）调用实例方法：
let counter = Counter()
// 初始计数值是0
counter.increment()
// 计数值现在是1
counter.increment(by: 5)
// 计数值现在是6
counter.reset()
// 计数值现在是0
////类型的每一个实例都有一个隐含属性叫做 self，self 完全等同于该实例本身。你可以在一个实例的实例方法中使用这个隐含的 self 属性来引用当前实例。
//func increment() {
//    self.count += 1
//}
//使用这条规则的主要场景是实例方法的某个参数名称与实例的某个属性名称相同的时候。在这种情况下，参数名称享有优先权，并且在引用属性时必须使用一种更严格的方式。这时你可以使用 self 属性来区分参数名称和属性名称。
//struct Point {
//    var x = 0.0, y = 0.0
//    func isToTheRightOfX(_ x: Double) -> Bool {
//        return self.x > x
//    }
//}
//let somePoint = Point(x: 4.0, y: 5.0)
//if somePoint.isToTheRightOfX(1.0) {
//    print("This point is to the right of the line where x == 1.0")
//}
//结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。但是，如果你确实需要在某个特定的方法中修改结构体或者枚举的属性，你可以为这个方法选择可变（mutating）行为，然后就可以从其方法内部改变它的属性；并且这个方法做的任何改变都会在方法执行结束时写回到原始结构中。方法还可以给它隐含的 self 属性赋予一个全新的实例，这个新实例在方法结束时会替换现存实例。
//struct Point {
//    var x = 0.0, y = 0.0
//    mutating func moveByX(_ deltaX: Double, y deltaY: Double) {
//        self.x += deltaX
//        self.y += deltaY
//    }
//}
//var somePoint = Point(x: 1.0, y: 1.0)
//somePoint.moveByX(2.0, y: 3.0)
//print("The point is now at (\(somePoint.x), \(somePoint.y))")
//可变方法能够赋给隐含属性 self 一个全新的实例。上面 Point 的例子可以用下面的方式改写：
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}
//枚举的可变方法可以把 self 设置为同一枚举类型中不同的成员：
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
// ovenLight 现在等于 .High
ovenLight.next()
// ovenLight 现在等于 .Off

//实例方法是被某个类型的实例调用的方法。你也可以定义在类型本身上调用的方法，这种方法就叫做类型方法。在方法的 func 关键字之前加上关键字 static，来指定类型方法。类还可以用关键字 class 来允许子类重写父类的方法实现。
class SomeClass {
    class func someTypeMethod() {
        print("456")
    }
}
SomeClass.someTypeMethod()

