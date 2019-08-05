import UIKit

//使用构造语法来创建一个由特定数据类型构成的空数组：
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
//一个函数参数或者一个已经定义好类型的常量或者变量，我们可以使用空数组语句创建一个空数组，它的写法很简单：[]
someInts.append(3)
someInts = []
//Swift 中的 Array 类型还提供一个可以创建特定大小并且所有数据都被默认的构造方法。
var threeDoubles = Array(repeating: 0.0, count: 3)
//我们可以使用加法操作符（+）来组合两种已存在的相同类型数组
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
//我们可以使用数组字面量来进行数组构造，这是一种用一个或者多个数值构造数组的简单方法
var shoppingList1: [String] = ["Eggs", "Milk"]
//由于 Swift 的类型推断机制，当我们用字面量构造只拥有相同类型值数组的时候，我们不必把数组的类型定义清楚
var shoppingList = ["Eggs", "Milk"]
//可以使用数组的只读属性 count 来获取数组中的数据项数量
print("The shopping list contains \(shoppingList.count) items.")
//使用布尔属性 isEmpty 作为一个缩写形式去检查 count 属性是否为 0
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
//也可以使用 append(_:) 方法在数组后面添加新的数据项：
shoppingList.append("Flour")
//除此之外，使用加法赋值运算符（+=）也可以直接在数组后面添加一个或多个拥有相同类型的数据项
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
//可以直接使用下标语法来获取数组中的数据项，把我们需要的数据项的索引值放在直接放在数组名称的方括号中
var firstItem = shoppingList[0]
//也可以用下标来改变某个已有索引值对应的数据值：
shoppingList[0] = "Six eggs"
//还可以利用下标来一次改变一系列数据值，即使新数据和原有数据的数量是不一样的。
shoppingList[1...6] = ["Bananas", "Apples"]
//调用数组的 insert(_:at:) 方法来在某个具体索引值之前添加数据项：
shoppingList.insert("Maple Syrup", at: 0)
//我们可以使用 remove(at:) 方法来移除数组中的某一项,数据项被移除后数组中的空出项会被自动填补
let mapleSyrup = shoppingList.remove(at: 0)
//如果我们只想把数组中的最后一项移除，可以使用 removeLast() 方法而不是 remove(at:) 方法来避免我们需要获取数组的 count 属性
let apples = shoppingList.removeLast()
//我们可以使用 for-in 循环来遍历所有数组中的数据项
for item in shoppingList {
    print(item)
}
//如果我们同时需要每个数据项的值和索引值，可以使用 enumerated() 方法来进行数组遍历
for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}





//你可以通过构造器语法创建一个特定类型的空集合
var letters = Set<Character>()
//此外，如果上下文提供了类型信息，比如作为函数的参数或者已知类型的变量或常量，我们可以通过一个空的数组字面量创建一个空的 Set
letters.insert("a")
letters = []
//你可以使用数组字面量来构造集合，并且可以使用简化形式写一个或者多个值作为集合元素
var favoriteGenres1: Set<String> = ["Rock", "Classical", "Hip hop"]
//如果你想使用一个数组字面量构造一个 Set 并且该数组字面量中的所有元素类型相同，那么你无须写出 Set 的具体类型。
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]
//为了找出一个 Set 中元素的数量，可以使用其只读属性 count
print("I have \(favoriteGenres1.count) favorite music genres.")
//使用布尔属性 isEmpty 作为一个缩写形式去检查 count 属性是否为 0：
if favoriteGenres1.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
//你可以通过调用 Set 的 insert(_:) 方法来添加一个新元素：
favoriteGenres1.insert("Jazz")
//通过调用 Set 的 remove(_:) 方法去删除一个元素，如果该值是该 Set 的一个元素则删除该元素并且返回被删除的元素值，否则如果该 Set 不包含该值，则返回 nil
if let removedGenre = favoriteGenres1.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
//Set 中的所有元素可以通过它的 removeAll() 方法删除。
favoriteGenres1.removeAll()
//使用 contains(_:) 方法去检查 Set 中是否包含一个特定的值：
if favoriteGenres2.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
//你可以在一个 for-in 循环中遍历一个 Set 中的所有值
for genre in favoriteGenres2 {
    print("\(genre)")
}
//Swift 的 Set 类型没有确定的顺序，为了按照特定顺序来遍历一个 Set 中的值可以使用 sorted() 方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定
for genre in favoriteGenres2.sorted() {
    print("\(genre)")
}
//使用intersection(_:)方法根据两个集合中都包含的值创建的一个新的集合
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.intersection(evenDigits).sorted()
//使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
//使用union(_:)方法根据两个集合的值创建一个新的集合
oddDigits.union(evenDigits).sorted()
//使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
//使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
oddDigits.isSubset(of:evenDigits)
//使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值
oddDigits.isSuperset(of:evenDigits)
//使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
oddDigits.isStrictSubset(of:evenDigits)
oddDigits.isStrictSuperset(of:evenDigits)
//使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)
oddDigits.isDisjoint(with:evenDigits)



//我们可以像数组一样使用构造语法创建一个拥有确定类型的空字典
var namesOfIntegers = [Int: String]()
//如果上下文已经提供了类型信息，我们可以使用空字典字面量来创建一个空字典，记作 [:]（中括号中放一个冒号）
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]
//可以使用字典字面量来构造字典,一个键值对是一个 key 和一个 value 的结合体.
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//和数组一样，我们可以通过字典的只读属性 count 来获取某个字典的数据项数量：
print("The dictionary of airports contains \(airports.count) items.")
//使用布尔属性 isEmpty 作为一个缩写形式去检查 count 属性是否为 0：
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
//我们也可以在字典中使用下标语法来添加新的数据项。可以使用一个恰当类型的键作为下标索引，并且分配恰当类型的新值：
airports["LHR"] = "London"
//我们也可以使用下标语法来改变特定键对应的值：
airports["LHR"] = "London Heathrow"
//updateValue(_:forKey:) 方法在这个键不存在对应值的时候会设置新值或者在存在时更新已存在的值,并返回更新值之前的原值
//如果有值存在于更新前，则这个可选值包含了旧值，否则它将会是 nil。
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
//我们也可以使用下标语法来在字典中检索特定键对应的值。因为有可能请求的键没有对应的值存在，字典的下标访问会返回对应值的类型的可选值。如果这个字典包含请求键所对应的值，下标会返回一个包含这个存在值的可选值，否则将返回 nil：
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
//我们还可以使用下标语法来通过给某个键的对应值赋值为 nil 来从字典里移除一个键值对：
airports["APL"] = "Apple Internation"
airports["APL"] = nil
//此外，removeValue(forKey:) 方法也可以用来在字典中移除键值对。这个方法在键值对存在的情况下会移除该键值对并且返回被移除的值或者在没有值的情况下返回 nil：
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
//我们可以使用 for-in 循环来遍历某个字典中的键值对。每一个字典中的数据项都以 (key, value) 元组形式返回
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
//通过访问 keys 或者 values 属性，我们也可以遍历字典的键或者值：
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
//可以直接使用 keys 或者 values 属性构造一个新数组：
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
