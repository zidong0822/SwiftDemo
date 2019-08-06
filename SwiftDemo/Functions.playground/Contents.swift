import UIKit

//当你定义一个函数时，你可以定义一个或多个有名字和类型的值，作为函数的输入，称为参数，也可以定义某种类型的值作为函数执行结束时的输出，称为返回类型。
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
//为了简化这个函数的定义，可以将问候消息的创建和返回写成一句：
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
//函数可以没有参数。下面这个函数就是一个无参数函数，当被调用时，它返回固定的 String 消息：
func sayHelloWorld() -> String {
    return "hello, world"
}
//函数可以有多种输入参数，这些参数被包含在函数的括号之中，以逗号分隔。
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
//函数可以没有返回值。下面是 greet(person:) 函数的另一个版本，这个函数直接打印一个 String 值，而不是返回它：
func greet(person: String) {
    print("Hello, \(person)!")
}
//你可以用元组（tuple）类型让多个值作为一个复合值从函数中返回
//func minMax(array: [Int]) -> (min: Int, max: Int) {
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[0..<array.count]{
//        if(value < currentMin){
//            currentMin = value
//        }else if(value > currentMax){
//            currentMax = value
//        }
//    }
//    return (currentMin,currentMax)
//}
////因为元组的成员值已被命名，因此可以通过 . 语法来检索找到的最小值与最大值
//let bounds = minMax(array:[1,2,3,4,5,6,7])
//print("min is \(bounds.min) and max is \(bounds.max)")

//为了安全地处理这个“空数组”问题，将 minMax(array:) 函数改写为使用可选元组返回类型，并且当数组为空时返回 nil
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
//你可以使用可选绑定来检查 minMax(array:) 函数返回的是一个存在的元组值还是 nil：
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
//每个函数参数都有一个参数标签（argument label）以及一个参数名称（parameter name）。
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
//你可以在参数名称前指定它的参数标签，中间以空格分隔：
func someFunction(argumentLabel parameterName: Int) {
    // 在函数体内，parameterName 代表参数值
}
//如果你不希望为某个参数添加一个标签，可以使用一个下划线（_）来代替一个明确的参数标签。
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
//你可以在函数体中通过给参数赋值来为任意一个参数定义默认值（Deafult Value）。当默认值被定义后，调用这个函数时可以忽略这个参数。
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
}
//一个可变参数（variadic parameter）可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数可以被传入不确定数量的输入值。通过在变量类型名后面加入（...）的方式来定义可变参数。
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1,2,3,4,5)
//如果果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数（In-Out Parameters）。
var someInt = 3
var anotherInt = 107
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
swapTwoInts(&someInt,&anotherInt)
//每个函数都有种特定的函数类型，函数的类型由函数的参数类型和返回类型组成
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
//在 Swift 中，使用函数类型就像使用其他类型一样。例如，你可以定义一个类型为函数的常量或变量，并将适当的函数赋值给它：
var mathFunction: (Int, Int) -> Int = addTwoInts
mathFunction = multiplyTwoInts
//就像其他类型一样，当赋值一个函数给常量或变量时，你可以让 Swift 来推断其函数类型：
let anotherMathFunction = addTwoInts
//你可以用 (Int, Int) -> Int 这样的函数类型作为另一个函数的参数类型。这样你可以将函数的一部分实现留给函数的调用者来提供。
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
//你可以用函数类型作为另一个函数的返回类型。你需要做的是在返回箭头（->）后写一个完整的函数类型。
//func stepForward(_ input: Int) -> Int {
//    return input + 1
//}
//func stepBackward(_ input: Int) -> Int {
//    return input - 1
//}
//func chooseStepFunction(backward: Bool) -> (Int) -> Int {
//    return backward ? stepBackward : stepForward
//}
chooseStepFunction(backward:false)(10)
//可以把函数定义在别的函数体中，称作 嵌套函数（nested functions）。
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
chooseStepFunction(backward:true)(10)
