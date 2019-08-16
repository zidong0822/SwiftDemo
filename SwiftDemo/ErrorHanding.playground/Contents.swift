import UIKit

//在 Swift 中，错误用符合 Error 协议的类型的值来表示。这个空协议表明该类型可以用于错误处理。
//Swift 的枚举类型尤为适合构建一组相关的错误状态，枚举的关联值还可以提供错误状态的额外信息。
enum VendingMachineError: Error {
    case invalidSelection                    //选择无效
    case insufficientFunds(coinsNeeded: Int) //金额不足
    case outOfStock                          //缺货
}
//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
//为了表示一个函数、方法或构造器可以抛出错误，在函数声明的参数列表之后加上 throws 关键字。一个标有 throws 关键字的函数被称作throwing 函数。如果这个函数指明了返回值类型，throws 关键词需要写在箭头（->）的前面。
func canThrowErrors() throws -> String {
    return ""
}
func cannotThrowErrors() -> String {
    return ""
}
//一个 throwing 函数可以在其内部抛出错误，并将错误传递到函数被调用时的作用域。
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name:String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}
//throwing 构造器能像 throwing 函数一样传递错误。例如下面代码中的 PurchasedSnack 构造器在构造过程中调用了 throwing 函数，并且通过传递到它的调用者来处理这些错误。
struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}
//你可以使用一个 do-catch 语句运行一段闭包代码来处理错误。如果在 do 子句中的代码抛出了一个错误，这个错误会与 catch 子句做匹配，从而决定哪条子句能处理它。
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}
// 打印 “Insufficient funds. Please insert an additional 2 coins.”
//可以使用 try? 通过将错误转换成一个可选值来处理错误。如果在评估 try? 表达式时一个错误被抛出，那么表达式的值就是 nil。
//func someThrowingFunction() throws -> Int {
//    // ...
//}
//
//let x = try? someThrowingFunction()
//
//let y: Int?
//do {
//    y = try someThrowingFunction()
//} catch {
//    y = nil
//}
//如果你想对所有的错误都采用同样的方式来处理，用 try? 就可以让你写出简洁的错误处理代码。
//func fetchData() -> Data? {
//    if let data = try? fetchDataFromDisk() { return data }
//    if let data = try? fetchDataFromServer() { return data }
//    return nil
//}

//有时你知道某个 throwing 函数实际上在运行时是不会抛出错误的，在这种情况下，你可以在表达式前面写 try! 来禁用错误传递，这会把调用包装在一个不会有错误抛出的运行时断言中。如果真的抛出了错误，你会得到一个运行时错误。
//let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")

//你可以使用 defer 语句在即将离开当前代码块时执行一系列语句。该语句让你能执行一些必要的清理工作，不管是以何种方式离开当前代码块的——无论是由于抛出错误而离开，或是由于诸如 return、break 的语句。
//func processFile(filename: String) throws {
//    if exists(filename) {
//        let file = open(filename)
//        defer {
//            close(file)
//        }
//        while let line = try file.readline() {
//            // 处理文件。
//        }
//        // close(file) 会在这里被调用，即作用域的最后。
//    }
//}
