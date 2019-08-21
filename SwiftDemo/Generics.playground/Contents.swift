import UIKit

////泛型代码让你能够根据自定义的需求，编写出适用于任意类型、灵活可重用的函数及类型。它能让你避免代码的重复，用一种清晰和抽象的方式来表达代码的意图。
//
////下面是一个标准的非泛型函数 swapTwoInts(_:_:)，用来交换两个 Int 值：
//func swapTwoInts(_ a: inout Int, _ b: inout Int) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//var someInt = 3
//var anotherInt = 107
//swapTwoInts(&someInt, &anotherInt)
//print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
//
////如果你想要交换两个 String 值或者 Double 值，就不得不写更多的函数，例如 swapTwoStrings(_:_:) 和 swapTwoDoubles(_:_:)
//func swapTwoStrings(_ a: inout String, _ b: inout String) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
////泛型函数可以适用于任何类型，下面的 swapTwoValues(_:_:) 函数是上面三个函数的泛型版本：
//func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//var someDouble = 3
//var anotherDouble = 107
//swapTwoValues(&someDouble, &anotherDouble)
//
//var someString = "hello"
//var anotherString = "world"
//swapTwoValues(&someString, &anotherString)
//
////除了泛型函数，Swift 还允许你定义泛型类型。这些自定义类、结构体和枚举可以适用于任何类型，类似于 Array 和 Dictionary。
//
////下面展示了如何编写一个非泛型版本的栈，以 Int 型的栈为例：
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
//
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element){
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
//
//var stackOfInts =  Stack<Int>()
//stackOfInts.push(1)
//stackOfInts.push(2)
//stackOfInts.push(3)
//stackOfInts.push(4)
//print(stackOfInts.pop())
//print(stackOfInts)
//
////当你扩展一个泛型类型的时候，你并不需要在扩展的定义中提供类型参数列表。原始类型定义中声明的类型参数列表在扩展中可以直接使用，并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用。
////extension Stack {
////    var topItem:Element? {
////        return items.isEmpty ? nil : items[items.count - 1]
////    }
////}
////if let topItem = stackOfInts.topItem {
////    print("The top item on the stack is \(topItem).")
////}
//
////类型约束可以指定一个类型参数必须继承自指定类，或者符合一个特定的协议或协议组合。
//func findIndex(ofString valueToFind:String, in array: [String]) ->Int? {
//    for (index, value) in array.enumerated() {
//        if(value == valueToFind){
//            return index
//        }
//    }
//    return nil
//}
//
//let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
//if let foundIndex = findIndex(ofString: "llama", in: strings) {
//    print("The index of llama is \(foundIndex)")
//}
//
////下面展示了 findIndex(ofString:in:) 函数的泛型版本 findIndex(ofString:in:)。请注意这个函数返回值的类型仍然是 Int?，这是因为函数返回的是一个可选的索引数，而不是从数组中得到的一个可选值。
//
//func findIndex<T:Equatable>(ofString valueToFind: T, in array: [T]) ->Int? {
//    for (index, value) in array.enumerated() {
//        if(value == valueToFind){
//            return index
//        }
//    }
//    return nil
//}
//
//let values = ["cat", "dog", "llama", "parakeet", "terrapin"]
//findIndex(ofString:"cat", in: values)
////定义一个协议时，有的时候声明一个或多个关联类型作为协议定义的一部分将会非常有用。关联类型为协议中的某个类型提供了一个占位名（或者说别名），其代表的实际类型在协议被采纳时才会被指定。你可以通过 associatedtype 关键字来指定关联类型。

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack1:Container{
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }

    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

////你也可以让泛型 Stack 结构体遵从 Container 协议：
struct Stack1<Element>: Container {
    // Stack<Element> 的原始实现部分
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }

    typealias Item = Element
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }

    subscript(i: Int) -> Element {
        return items[i]
    }
}

//
////通过扩展一个存在的类型来指定关联类型
extension Array:Container {}
//
////你可以给协议里的关联类型添加类型注释，让遵守协议的类型必须遵循这个约束条件。
protocol Container1 {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
////有一个协议细化了 Container 协议，添加了一个 suffix(_:) 方法
protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

protocol SuffixableContainer1: Container1 {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

extension Stack1:SuffixableContainer {
    func suffix(_ size: Int) -> Stack1{
        var result = Stack1()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
}
var stackOfInts = Stack1<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)

//有一个非泛型 IntStack 类型的扩展，它添加了 SuffixableContainer 遵循，使用 Stack<Int> 作为它的后缀类型而不是 IntStack：

extension IntStack1: SuffixableContainer {
    
    func suffix(_ size: Int) -> Stack1<Int> {
        var result = Stack1<Int>()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
}


//struct Stack<Element>: Container1 {
//    // Stack<Element> 的原始实现部分
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//
//    typealias Item = Element
//    mutating func append(_ item: Element) {
//        self.push(item)
//    }
//    var count: Int {
//        return items.count
//    }
//
//    subscript(i: Int) -> Element {
//        return items[i]
//    }
//}

//为关联类型定义约束也是非常有用的。你可以在参数列表中通过 where 子句为关联类型定义约束。
func allItemsMatch<C1:Container,C2:Container>(_ someContainer: C1,_ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item,C1.Item:Equatable {
        
        if(someContainer.count != anotherContainer.count) {
            return false
        }
    
        for i in 0..<someContainer.count {
            if(someContainer[i] != anotherContainer[i]){
                return false
            }
        }

        return true
 }

var stackOfStrings = Stack1<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
print(stackOfStrings)


var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}

//你也可以使用泛型 where 子句作为扩展的一部分。
extension Stack1 where Element:Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

if stackOfStrings.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}

struct NotEquatable:Equatable { }
let notEquatable = NotEquatable()
var notEquatableStack = Stack1<NotEquatable>()
notEquatableStack.push(notEquatable)
notEquatableStack.isTop(notEquatable)

//你可以使用泛型 where 子句去扩展一个协议。
extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}

if [9, 9, 9].startsWith(42) {
    print("Starts with 42.")
} else {
    print("Starts with something else.")
}

//上述示例中的泛型 where 子句要求 Item 符合协议，但也可以编写一个泛型 where 子句去要求 Item 为特定类型。
extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}

print([1260.0, 1200.0, 98.6, 37.0].average())

//你可以在关联类型后面加上具有泛型 where 的字句。例如，建立一个包含迭代器（Iterator）的容器，就像是标准库中使用的 Sequence 协议那样。
protocol Container2 {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}

//一个协议继承了另一个协议，你通过在协议声明的时候，包含泛型 where 子句，来添加了一个约束到被继承协议的关联类型。
protocol ComparableContainer: Container where Item: Comparable { }

//下标能够是泛型的，他们能够包含泛型 where 子句。
extension Container2 {
    
    subscript<Indices:Sequence>(indices:Indices) -> [Item] where Indices.Iterator.Element == Int {
        
        var result = [Item]()
        print("---1--",result)
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}
print([1260.0, 1200.0, 98.6, 37.0][1])
