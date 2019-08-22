import UIKit

//引用计数仅仅应用于类的实例。结构体和枚举类型是值类型，不是引用类型，也不是通过引用的方式存储和传递。
//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//reference1 = Person(name: "Johns Appleseed")
//reference2 = reference1
//reference3 = reference1
//reference1 = nil
//reference2 = nil
//reference3 = nil

//如果两个类实例互相持有对方的强引用，因而每个实例都让对方一直存在，就是这种情况。这就是所谓的循环强引用。你可以通过定义类之间的关系为弱引用或无主引用，以替代强引用，从而解决循环强引用的问题。
//class Person {
//    let name: String
//    init(name: String) { self.name = name }
//    var apartment: Apartment?
//    deinit { print("\(name) is being deinitialized") }
//}
//
//class Apartment {
//    let unit: String
//    init(unit: String) { self.unit = unit }
//    var tenant: Person?
//    deinit { print("Apartment \(unit) is being deinitialized") }
//}
//
//var john: Person?
//var unit4A: Apartment?
//
//john = Person(name: "John Appleseed")
//unit4A = Apartment(unit: "4A")
//john!.apartment = unit4A
//unit4A!.tenant = john
//john = nil
//unit4A = nil

//Swift 提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：弱引用（weak reference）和无主引用（unowned reference）。
//弱引用和无主引用允许循环引用中的一个实例引用而另外一个实例不保持强引用。这样实例能够互相引用而不产生循环强引用。
//当其他的实例有更短的生命周期时，使用弱引用
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")
john!.apartment = unit4A
unit4A!.tenant = john
john = nil
unit4A = nil

//和弱引用类似，无主引用不会牢牢保持住引用的实例。和弱引用不同的是，无主引用在其他实例有相同或者更长的生命周期时使用。你可以在声明属性或者变量时，在前面加上关键字 unowned 表示这是一个无主引用。
//无主引用通常都被期望拥有值。不过 ARC 无法在实例被销毁后将无主引用设为 nil，因为非可选类型的变量不允许被赋值为 nil。
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer:Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var harvey: Customer?
harvey = Customer(name: "harvey")
harvey!.card = CreditCard(number: 1234_5678_9012_3456, customer: harvey!)
harvey = nil

//存在着第三种场景，在这种场景中，两个属性都必须有值，并且初始化完成后永远不会为 nil。在这种场景中，需要一个类使用无主属性，而另外一个类使用隐式解析可选属性。
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

//循环强引用还会发生在当你将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了这个类实例时。
class HTMLElement {

    let name: String?
    let text: String?

    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("1111\(name) is being deinitialized")
    }

}
//
//var heading:HTMLElement?
//heading = HTMLElement(name: "h1",text: "helloworld")
//let defaultText = "some default text"
//heading!.asHTML()
//heading = nil

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil

//在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为 无主引用。相反的，在被捕获的引用可能会变为 nil 时，将闭包内的捕获定义为 弱引用
//如果被捕获的引用绝对不会变为 nil，应该用无主引用，而不是弱引用。
//class HTMLElement {
//
//    let name: String
//    let text: String?
//
//    lazy var asHTML: () -> String = {
//        [unowned self] in
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name) />"
//        }
//    }
//
//    init(name: String, text: String? = nil) {
//        self.name = name
//        self.text = text
//    }
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//
//}
//
//var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
//print(paragraph!.asHTML())
//paragraph = nil
