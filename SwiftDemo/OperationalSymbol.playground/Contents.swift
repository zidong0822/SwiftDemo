//赋值运算符（a = b），表示用 b 的值来初始化或更新 a 的值
let b = 10
var a = 5
a = b
//如果赋值的右边是一个多元组，它的元素可以马上被分解成多个常量或变量:
let (x, y) = (1, 2)
//与 C 语言和 Objective-C 不同，Swift 的赋值操作并不返回任何值。所以以下陈述时无效的
if x == y{
    print("111")
}
//Swift 中所有数值类型都支持了基本的四则算术运算符:加法（+）,减法（-) ,乘法（*）,除法（/）
1 + 2       // 等于 3
5 - 3       // 等于 2
2 * 3       // 等于 6
10.0 / 2.5  // 等于 4.0
//加法运算符也可用于 String 的拼接：
"hello, " + "world"  // 等于 "hello, world"
//求余运算符（a % b）是计算 b 的多少倍刚刚好可以容入 a，返回多出来的那部分（余数）。
9 % 4    // 等于 1
//数值的正负号可以使用前缀 -（即一元负号符）来切换：
let three = 3
let minusThree = -three       // minusThree 等于 -3
let plusThree = -minusThree   // plusThree 等于 3, 或 "负负3"
//一元正号符（+）不做任何改变地返回操作数的值：
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix 等于 -6
//Swift 也提供把其他运算符和赋值运算（=）组合的组合赋值运算符，组合加运算（+=）是其中一个例子
var c = 1
c += 2
//所有标准 C 语言中的比较运算符都可以在 Swift 中使用：等于（a == b）,不等于（a != b）,大于（a > b）,小于（a < b）,大于等于（a >= b）,小于等于（a <= b）,Swift 也提供恒等（===）和不恒等（!==）这两个比较符来判断两个对象是否引用同一个对象实例
1 == 1   // true, 因为 1 等于 1
2 != 1   // true, 因为 2 不等于 1
2 > 1    // true, 因为 2 大于 1
1 < 2    // true, 因为 1 小于2
1 >= 1   // true, 因为 1 大于等于 1
2 <= 1   // false, 因为 2 并不小于等于 1
//如果两个元组的元素相同，且长度相同的话，元组就可以被比较。比较元组大小会按照从左到右、逐值比较的方式，直到发现有两个值不等时停止。如果所有的值都相等，那么这一对元组我们就称它们是相等的。
(1, "zebra") < (2, "apple")   // true，因为 1 小于 2
(3, "apple") < (3, "bird")    // true，因为 3 等于 3，但是 apple 小于 bird
(4, "dog") == (4, "dog")      // true，因为 4 等于 4，dog 等于 dog
//三元运算符的特殊在于它是有三个操作数的运算符，它的形式是 问题 ? 答案 1 : 答案 2。它简洁地表达根据 问题成立与否作出二选一的操作。如果 问题 成立，返回 答案 1 的结果；反之返回 答案 2 的结果。
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
//空合运算符（a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解封，否则就返回一个默认值 b
let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
//闭区间运算符（a...b）定义一个包含从 a 到 b（包括 a 和 b）的所有值的区间。a 的值不能超过 b。
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}
//半开区间运算符（a..<b）定义一个从 a 到 b 但不包括 b 的区间。 之所以称为半开区间，是因为该区间包含第一个值而不包括最后的值。
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}
//闭区间操作符有另一个表达形式，可以表达往一侧无限延伸的区间
for name in names[2...] {
    print(name)
}
//逻辑运算符的操作对象是逻辑布尔值。Swift 支持基于 C 语言的三个标准逻辑运算逻辑非（!a）逻辑与（a && b）逻辑或（a || b）
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//组合多个逻辑运算符来表达一个复合逻辑：
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
//为了一个复杂表达式更容易读懂，在合适的地方使用括号来明确优先级是很有效的，虽然它并非必要的。
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}


print("df" > "de")
