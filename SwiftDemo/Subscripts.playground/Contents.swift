import UIKit

//与定义实例方法类似，定义下标使用 subscript 关键字，指定一个或多个输入参数和返回类型；
class table {
    subscript(index: Int) -> Int {
        get {
            // 返回一个适当的 Int 类型的值
            return 1
        }
        
        set(newValue) {
            // 执行适当的赋值操作
        }
    }
}
//如同只读计算型属性，可以省略只读下标的 get 关键字：
class table1 {
    subscript(index: Int) -> Int {
        return 1
    }
}
//这里定义了一个 TimesTable 结构体，用来表示传入整数的乘法表：
struct TimesTable {
    let multiplier:Int
    subscript(index:Int)->Int{
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier:3)
print("six times three is \(threeTimesTable[6])")
//下标通常作为访问集合，列表或序列中元素的快捷方式。你可以针对自己特定的类或结构体的功能来自由地以最恰当的方式实现下标。
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
//下标可以接受任意数量的入参，并且这些入参可以是任意类型。下标的返回值也可以是任意类型。下标可以使用变量参数和可变参数，但不能使用输入输出参数，也不能给参数设置默认值。
//一个类或结构体可以根据自身需要提供多个下标实现，使用下标时将通过入参的数量和类型进行区分，自动匹配合适的下标，这就是下标的重载。
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int,column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int ,column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
//你可以通过传入合适的 row 和 column 的数量来构造一个新的 Matrix 实例：
var matrix = Matrix(rows: 2, columns: 2)
//将 row 和 column 的值传入下标来为矩阵设值，下标的入参使用逗号分隔：
matrix[0, 1] = 1.5
matrix[29, 0] = 3.2
