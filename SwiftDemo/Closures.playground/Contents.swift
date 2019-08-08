import UIKit

//下面的闭包表达式示例使用 sorted(by:) 方法对一个 String 类型的数组进行字母逆序排序。以下是初始数组：
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//提供排序闭包函数的一种方式是撰写一个符合其类型要求的普通函数，并将其作为 sorted(by:) 方法的参数传入：
func forward(_ s1:String,_ s2:String) -> Bool{
    return s1 < s2
}
var reversedNames =  names.sorted(by:forward)
//下面的例子展示了之前 backward(_:_:) 函数对应的闭包表达式版本的代码：
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
//由于这个闭包的函数体部分如此短，以至于可以将其改写成一行代码：
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
//因为排序闭包函数是作为 sorted(by:) 方法的参数传入的，Swift 可以推断其参数和返回值的类型。
reversedNames = names.sorted(by:{s1,s2 in return s1 > s2})
//单行表达式闭包可以通过省略 return 关键字来隐式返回单行表达式的结果
reversedNames = names.sorted(by:{s1,s2 in s1 > s2})
//Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推
reversedNames = names.sorted(by:{$0 < $1})
//实际上还有一种更简短的方式来编写上面例子中的闭包表达式。Swift 的 String 类型定义了关于大于号（>）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值。而这正好与 sorted(by:) 方法的参数需要的函数类型相符合。
reversedNames = names.sorted(by:<)
//如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // 函数体部分
    print("someFunctionThatTakesAClosure")
}

// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    // 闭包主体部分
    print("789")
})

// 以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    // 闭包主体部分
    print("123")
}

someFunctionThatTakesAClosure {
    print("456")
}
//在闭包表达式语法一节中作为 sorted(by:) 方法参数的字符串排序闭包可以改写为：
reversedNames = names.sorted(){$0 < $1}
//如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
reversedNames = names.sorted{$0 < $1}
//当提供给数组的闭包应用于每个数组元素后，map(_:) 方法将返回一个新的数组，数组中包含了与原数组中的元素一一对应的映射后的值。
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
//你现在可以通过传递一个尾随闭包给 numbers 数组的 map(_:) 方法来创建对应的字符串版本数组：
let strings = numbers.map{
    (number)-> String in
    var number = number
    var output = ""
    repeat {
        print(number)
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
print(strings)
//闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    print("----",runningTotal)
    func incrementer()->Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
print(makeIncrementer(forIncrement:1)())
print(makeIncrementer(forIncrement:2)())
//当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。
var completionHandlers:[()->Void] = []
func someFunctionWithEscapingClosures(completionHandler:@escaping ()->Void){
    completionHandlers.append(completionHandler)
}
//将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self,否则,意味着它可以隐式引用self
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosures {
            self.x = 100
            print("123",self.x)
        }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x)
completionHandlers.first? ()
print(instance.x)
//自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
customerProvider()
print(customersInLine.count)
//将闭包作为参数传递给函数时，你能获得同样的延时求值行为。
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
//如果你想让一个自动闭包可以“逃逸”，则应该同时使用 @autoclosure 和 @escaping 属性。@escaping 属性的讲解见上面的逃逸闭包
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))
print(customerProviders.count)
