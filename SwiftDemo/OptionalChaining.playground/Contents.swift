import UIKit

//通过在想调用的属性、方法，或下标的可选值后面放一个问号（?），可以定义一个可选链。这一点很像在可选值后面放一个叹号（!）来强制展开它的值。它们的主要区别在于当可选值为空时可选链式调用只会调用失败，然而强制展开将会触发运行时错误。
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}
//在下面的代码中，john 有一个值为 nil 的 residence 属性：
let john = Person()
//如果使用叹号（!）强制展开获得这个 john 的 residence 属性中的 numberOfRooms 值，会触发运行时错误，因为这时 residence 没有可以展开的值：
//let roomCount = john.residence!.numberOfRooms

//可选链式调用提供了另一种访问 numberOfRooms 的方式，使用问号（?）来替代原来的叹号（!）：
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
//可以将一个 Residence 的实例赋给 john.residence，这样它就不再是 nil 了：
//john.residence = Residence()

//john.residence 现在包含一个实际的 Residence 实例，而不再是 nil。如果你试图使用先前的可选链式调用访问 numberOfRooms，它现在将返回值为 1 的 Int? 类型的值：
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

//通过使用可选链式调用可以调用多层属性、方法和下标。这样可以在复杂的模型中向下访问各种子属性，并且判断能否访问子属性的属性、方法或下标。

class Person1 {
    var residence: Residence1?
}


class Residence1 {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}

//下面的代码创建了一个 Person 实例，然后像之前一样，尝试访问 numberOfRooms 属性：
let john1 = Person1()
if let roomCount = john.residence?.numberOfRooms {
    print("John1's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

//还可以通过可选链式调用来设置属性值：
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
//代码中的赋值过程是可选链式调用的一部分，这意味着可选链式调用失败时，等号右侧的代码不会被执行。
john1.residence?.address = someAddress

func createAddress() -> Address {
    print("Function was called")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
    
}

john1.residence?.address = createAddress()

//可以通过可选链式调用来调用方法，并判断是否调用成功，即使这个方法没有返回值。
//这样我们就可以使用 if 语句来判断能否成功调用 printNumberOfRooms() 方法，即使方法本身没有定义返回值。通过判断返回值是否为 nil 可以判断调用是否成功：
if john1.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
}else{
    print("It was not possible to print the number of rooms.")
}
//同样的，可以据此判断通过可选链式调用为属性赋值是否成功。
if (john1.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}
//用下标访问 john.residence 属性存储的 Residence 实例的 rooms 数组中的第一个房间的名称，因为 john.residence 为 nil，所以下标调用失败了：
if let firstRoomName = john1.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else{
    print("Unable to retrieve the first room name.")
}
//类似的，可以通过下标，用可选链式调用来赋值：这次赋值同样会失败，因为 residence 目前是 nil。
john1.residence?[0] = Room(name: "Bathroom")

//如果你创建一个 Residence 实例，并为其 rooms 数组添加一些 Room 实例，然后将 Residence 实例赋值给 john.residence，那就可以通过可选链和下标来访问数组中的元素：
let johnsHouse = Residence1()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john1.residence = johnsHouse

if let firstRoomName = john1.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
//如果下标返回可选类型值，比如 Swift 中 Dictionary 类型的键的下标，可以在下标的结尾括号后面放一个问号来在其可选返回值上进行可选链式调用
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

//可以通过连接多个可选链式调用在更深的模型层级中访问属性、方法以及下标。然而，多层可选链式调用不会增加返回值的可选层级。
if let johnsStreet = john1.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
//如果为 john.residence.address 赋值一个 Address 实例，并且为 address 中的 street 属性设置一个有效值，我们就能过通过可选链式调用来访问 street 属性：
let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john1.residence?.address = johnsAddress

if let johnsStreet = john1.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
//通过可选链式调用来调用 Address 的 buildingIdentifier() 方法。这个方法返回 String? 类型的值。
if let buildingIdentifier = john1.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}
//如果要在该方法的返回值上进行可选链式调用，在方法的圆括号后面加上问号即可：
if let beginsWithThe =
    john1.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}
