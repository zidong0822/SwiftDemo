import UIKit

//常量和变量必须在使用前声明，用 let 来声明常量，用 var 来声明变量。
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
//你可以在一行中声明多个常量或者多个变量，用逗号隔开：
var x = 0.0, y = 0.0, z = 0.0
//这个例子给 welcomeMessage 变量添加了类型标注，表示这个变量可以存储 String 类型的值：
var welcomeMessage: String
//welcomeMessage 变量现在可以被设置成任意字符串：
welcomeMessage = "Hello"
//你可以在一行中定义多个同样类型的变量，用逗号分割，并在最后一个变量名之后添加类型标注：
var red, green, blue: Double
/*常量和变量名可以包含任何字符，包括 Unicode 字符：
 /*常量与变量名不能包含数学符号，箭头，保留的（或者非法的）Unicode码位，连线与制表符。也不能以数字开头，但是可以在常量与变量名的其他地方包含数字。*/
*/
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
//你可以更改现有的变量值为其他同类型的值，在下面的例子中，friendlyWelcome 的值从 "Hello!" 改为了 "Bonjour!":
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
//你可以用 print(_:separator:terminator:) 函数来输出当前常量或变量的值:
print(friendlyWelcome)
//你可以访问不同整数类型的 min 和 max 属性来获取对应类型的最小值和最大值：
let minValue = UInt8.min  // minValue 为 0，是 UInt8 类型
let maxValue = UInt8.max  // maxValue 为 255，是 UInt8 类型
//整数和浮点数的转换必须显式指定类型
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
//浮点数到整数的反向转换同样行，整数类型可以用 Double 或者 Float 类型来初始化
let integerPi = Int(pi)
//类型别名（type aliases）就是给现有类型定义另一个名字。你可以使用 typealias 关键字来定义类型别名。
typealias AudioSample = UInt16
//定义了一个类型别名之后，你可以在任何使用原始名的地方使用别名
var maxAmplitudeFound = AudioSample.min
//Swift 的 Int 类型有一种构造器，作用是将一个 String 值转换成一个 Int 值。然而，并不是所有的字符串都可以转换成一个整数。字符串 "123" 可以被转换成数字 123 ，但是字符串 "hello, world" 不行。
let possibleNumber = "1"
print(possibleNumber)
let convertedNumber = Int(possibleNumber)
//元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型
let message = ("100","harvey")
let (age,harvey) = message
print(age)
//你可以给可选变量赋值为 nil 来表示它没有值：
var serverResponseCode: Int? = 404
serverResponseCode = nil
//如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 nil
var surveyAnswer: String?
//如果可选类型有值，它将不等于 nil
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
//使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}
//你可以包含多个可选绑定或多个布尔条件在一个 if 语句中，只要使用逗号分开就行
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
//隐式解析可选类型,需要感叹号来获取值
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!
//你可以使用 错误处理（error handling） 来应对程序执行中可能会遇到的错误条件。
enum SandwichError:Error{
    case missingIngredients(data:Int)
    case outOfCleanDishes
}

func makeASandwich() throws {
    // ...
}

do {
    try makeASandwich()
} catch SandwichError.outOfCleanDishes {
   print("123")
} catch SandwichError.missingIngredients(let data) {
   print("123",data)
}
//你可以调用 Swift 标准库的 assert(_:_:file:line:) 函数来写一个断言。向这个函数传入一个结果为 true 或者 false 的表达式以及一条信息，当表达式的结果为 false 的时候这条信息会被显示
let age1 = 3
assert(age1 >= 0, "A person's age cannot be less than zero")
//你可以使用全局 precondition(_:_:file:line:) 函数来写一个先决条件。向这个函数传入一个结果为 true 或者 false 的表达式以及一条信息，当表达式的结果为 false 的时候这条信息会被显示
precondition(2 > 0, "Index must be greater than zero.")

