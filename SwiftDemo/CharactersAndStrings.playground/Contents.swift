import UIKit

//字符串字面量可以用于为常量和变量提供初始值
let someString = "Some string literal value"

//如果你需要一个字符串是跨越多行的，那就使用多行字符串字面量 — 由一对三个双引号包裹着的具有固定顺序的文本字符集
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.
"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

//一个多行字符串字面量包含了所有的在开启和关闭引号（"""）中的行。这个字符从开启引号（"""）之后的第一行开始，到关闭引号（"""）之前为止。这就意味着字符串开启引号之后（"""）或者结束引号（"""）之前都没有换行符号。
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

//如果你的代码中，多行字符串字面量包含换行符的话，则多行字符串字面量中也会包含换行符。
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

//为了让一个多行字符串字面量开始和结束于换行符，请将换行写在第一行和最后一行
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
//wiseWords 常量包含了两个双引号。 dollarSign、blackHeart 和 sparklingHeart 常量演示了三种不同格式的 Unicode 标量
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imageination is more important than knowledge" - Enistein
let dollarSign = "\u{24}"             // $，Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥，Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖，Unicode 标量 U+1F496
//要创建一个空字符串作为初始值，可以将空的字符串字面量赋值给变量，也可以初始化一个新的 String 实例
var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法

//您可以通过检查其 Bool 类型的 isEmpty 属性来判断该字符串是否为空：
if emptyString.isEmpty {
    print("Nothing to see here")
}
//您可以通过将一个特定字符串分配给一个变量来对其进行修改，或者分配给一个常量来保证其不会被修改
var variableString = "Horse"
variableString += " and carriage"

// 这会报告一个编译错误（compile-time error） - 常量字符串不可以被修改。
let constantString = "Highlander"
constantString += " and another Highlander"

//可通过 for-in 循环来遍历字符串，获取字符串中每一个字符的值：
for character in "Dog!🐶" {
    print(character)
}
// D
// o
// g
// !
// 🐶
//通过标明一个 Character 类型并用字符字面量进行赋值，可以建立一个独立的字符常量或变量
let exclamationMark: Character = "!"
//字符串可以通过传递一个值类型为 Character 的数组作为自变量来初始化：
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
//字符串可以通过加法运算符（+）相加在一起（或称“连接”）创建一个新的字符串：
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
//通过加法赋值运算符（+=）将一个字符串添加到一个已经存在字符串变量上
var instruction = "look over"
instruction += string2
//用 append() 方法将一个字符附加到一个字符串变量的尾部
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
//字符串插值是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式,您插入的字符串字面量的每一项都在以反斜线为前缀的圆括号中
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
//如果想要获得一个字符串中 Character 值的数量，可以使用 count 属性
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
//使用 indices 属性会创建一个包含全部索引的范围（Range），用来在一个字符串中访问单个字符。
let greeting = "Guten Tag!"
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
//调用 insert(_:at:) 方法可以在一个字符串的指定索引插入一个字符
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
//调用 insert(contentsOf:at:) 方法可以在一个字符串的指定索引插入一个段字符串。
welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
//调用 remove(at:) 方法可以在一个字符串的指定索引删除一个字符
welcome.remove(at: welcome.index(before: welcome.endIndex))
//调用 removeSubrange(_:) 方法可以在一个字符串的指定索引删除一个子字符串。
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
//字符串/字符可以用等于操作符（==）和不等于操作符（!=）
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
//通过调用字符串的 hasPrefix(_:)/hasSuffix(_:) 方法来检查字符串是否拥有特定前缀/后缀，两个方法均接收一个 String 类型的参数，并返回一个布尔值。
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
//相似地，您可以用 hasSuffix(_:) 方法来计算发生在不同地方的场景数
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

