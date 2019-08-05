import UIKit

//你可以使用 for-in 循环来遍历一个集合中的所有元素，例如数组中的元素、范围内的数字或者字符串中的字符。
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
//你也可以通过遍历一个字典来访问它的键值对
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
//for-in 循环还可以使用数字范围
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
//如果你不需要区间序列内每一项的值，你可以使用下划线（_）替代变量名来忽略这个值：
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
//在某些情况下，你可能不想使用闭区间,使用半开区间运算符（..<）来表示一个左闭右开的区间
let minutes = 60
for _ in 0..<minutes {
    // 每一分钟都渲染一个刻度线（60次）
}
//一些用户可能在其 UI 中可能需要较少的刻度。他们可以每5分钟作为一个刻度。使用 stride(from:to:by:) 函数跳过不需要的标记。
let minuteInterval = 5
for _ in stride(from: 0, to: minutes, by: minuteInterval) {
    // 每5分钟渲染一个刻度线（0, 5, 10, 15 ... 45, 50, 55）
   
}
//可以在闭区间使用 stride(from:through:by:) 起到同样作用
let hours = 12
let hourInterval = 3
for _ in stride(from: 3, through: hours, by: hourInterval) {
    // 每3小时渲染一个刻度线（3, 6, 9, 12）
}

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
//while 循环从计算一个条件开始。如果条件为 true，会重复运行一段语句，直到条件变为 false
//while square < finalSquare {
//    // 掷骰子
//    diceRoll += 1
//    if diceRoll == 7 { diceRoll = 1 }
//    // 根据点数移动
//    square += diceRoll
//    if square < board.count {
//        // 如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去
//        square += board[square]
//    }
//}
//print("Game over!")
//while 循环的另外一种形式是 repeat-while，它和 while 的区别是在判断循环条件之前，先执行一次循环的代码块。然后重复循环直到条件为 false。
repeat {
    // 顺着梯子爬上去或者顺着蛇滑下去
    square += board[square]
    // 掷骰子
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // 根据点数移动
    square += diceRoll
} while square < finalSquare
print("Game over!")
//if 语句最简单的形式就是只包含一个条件，只有该条件为 true 时，才执行相关代码
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
//当然，if 语句允许二选一执行，叫做 else 从句。也就是当条件为 false 时，执行 else 语句：
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
//你可以把多个 if 语句链接在一起，来实现更多分支
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
//实际上，当不需要完整判断情况的时候，最后的 else 语句是可选的
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}
//switch 语句最简单的形式就是把某个值与一个或若干个相同类型的值作比较
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
//为了让单个 case 同时匹配 a 和 A，可以将这个两个值组合成一个复合匹配，并且用逗号分开
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
//case 分支的模式也可以是一个值的区间
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
//我们可以使用元组在同一个 switch 语句中测试多个值。元组中的元素可以是值，也可以是区间。另外，使用下划线（_）来匹配所有可能的值。
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
//case 分支允许将匹配的值声明为临时常量或变量，并且在 case 分支体内使用 —— 这种行为被称为值绑定
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
//case 分支的模式可以使用 where 语句来判断额外的条件
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
//当多个条件可以使用同一种方法来处理时，可以将这几种可能放在同一个 case 后面，并且用逗号隔开。
let someCharacter1: Character = "e"
switch someCharacter1 {
case "a", "e", "i", "o", "u":
    print("\(someCharacter1) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter1) is a consonant")
default:
    print("\(someCharacter1) is not a vowel or a consonant")
}
//continue 语句告诉一个循环体立刻停止本次循环，重新开始下次循环。
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)
//break 语句会立刻结束整个控制流的执行。break 可以在 switch 或循环语句中使用，用来提前结束 switch 或循环语句。
let numberSymbol: Character = "三"  // 简体中文里的数字 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
//如果你确实需要 C 风格的贯穿的特性，你可以在每个需要该特性的 case 分支中使用 fallthrough 关键字。下面的例子使用 fallthrough 来创建一个数字的描述语句
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
//声明一个带标签的语句是通过在该语句的关键词的同一行前面放置一个标签，作为这个语句的前导关键字（introducor keyword），并且该标签后面跟随一个冒号。
//gameLoop: while square != finalSquare {
//    diceRoll += 1
//    if diceRoll == 7 { diceRoll = 1 }
//    switch square + diceRoll {
//    case finalSquare:
//        // 骰子数刚好使玩家移动到最终的方格里，游戏结束。
//        break gameLoop
//    case let newSquare where newSquare > finalSquare:
//        // 骰子数将会使玩家的移动超出最后的方格，那么这种移动是不合法的，玩家需要重新掷骰子
//        continue gameLoop
//    default:
//        // 合法移动，做正常的处理
//        square += diceRoll
//        square += board[square]
//    }
//}
//print("Game over!")

//一个 guard 语句总是有一个 else 从句，如果条件不为真则执行 else 从句中的代码。
func greet(_ person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}
greet(["name": "John"])
//Swift 内置支持检查 API 可用性，这可以确保我们不会在当前部署机器上，不小心地使用了不可用的 API。
if #available(iOS 10, macOS 10.12, *) {
    // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
} else {
    // 使用先前版本的 iOS 和 macOS 的 API
}
