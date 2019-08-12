import UIKit

//一个类可以继承另一个类的方法，属性和其它特性。当一个类继承其它类时，继承类叫子类，被继承类叫超类（或父类）。在 Swift 中，继承是区分「类」与其它类型的一个基本特征。
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // 什么也不做-因为车辆不一定会有噪音
    }
}
//您可以用初始化语法创建一个 Vehicle 的新实例，即类名后面跟一个空括号：
let someVehicle = Vehicle()
//现在已经创建了一个 Vehicle 的新实例，你可以访问它的 description 属性来打印车辆的当前速度：
print("Vehicle: \(someVehicle.description)")
//子类生成指的是在一个已有类的基础上创建一个新的类。子类继承超类的特性，并且可以进一步完善。你还可以为子类添加新的特性。
class Bicycle: Vehicle {
    var hasBasket = false
}
//默认情况下，你创建任何新的 Bicycle 实例将不会有一个篮子（即 hasBasket 属性默认为 false），创建该实例之后，你可以为特定的 Bicycle 实例设置 hasBasket 属性为 ture：
let bicycle = Bicycle()
bicycle.hasBasket = true
//你还可以修改 Bicycle 实例所继承的 currentSpeed 属性，和查询实例所继承的 description 属性：
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")
//子类还可以继续被其它类继承，下面的示例为 Bicycle 创建了一个名为 Tandem（双人自行车）的子类：
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
//如果你创建了一个 Tandem 的实例，你可以使用它所有的新属性和继承的属性，还能查询从 Vehicle 继承来的只读属性 description：
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")
//子类可以为继承来的实例方法，类方法，实例属性，或下标提供自己定制的实现。我们把这种行为叫重写。
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
//你可以重写继承来的实例属性或类型属性，提供自己定制的 getter 和 setter，或添加属性观察器使重写的属性可以观察属性值什么时候发生改变。
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
//如果你创建了 Car 的实例并且设置了它的 gear 和 currentSpeed 属性，你可以看到它的 description 返回了 Car 中的自定义描述：
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
//你可以通过重写属性为一个继承来的属性添加属性观察器。这样一来，当继承来的属性值发生改变时，你就会被通知到，无论那个属性原本是如何实现的
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
//无论何时当你设置 AutomaticCar 的 currentSpeed 属性，属性的 didSet 观察器就会自动地设置 gear 属性，为新的速度选择一个合适的挡位。
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
//你可以通过把方法，属性或下标标记为final来防止它们被重写，只需要在声明关键字前加上 final 修饰符即可
