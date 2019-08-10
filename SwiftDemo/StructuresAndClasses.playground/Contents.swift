import UIKit

//以下是定义结构体和定义类的示例：
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
//生成结构体和类实例的语法非常相似：
let someResolution = Resolution()
let someVideoMode = VideoMode()
//通过使用点语法，你可以访问实例的属性。其语法规则是，实例名后面紧跟属性名，两者通过点号（.）连接：
print("The width of someResolution is \(someResolution.width)")
//你也可以访问子属性，如 VideoMode 中 Resolution 属性的 width 属性：
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
//你也可以使用点语法为变量属性赋值：
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
//新实例中各个属性的初始值可以通过属性的名称传递到成员逐一构造器之中,只有构造器有,类没有：
let vga = Resolution(width: 640, height: 480)
//在 Swift 中，所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制。
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
//尽管 hd 和 cinema 有着相同的宽（width）和高（height），但是在幕后它们是两个完全不同的实例。
cinema.width = 2048
//这里，将会显示 cinema 的 width 属性确已改为了 2048：
print("cinema is now  \(cinema.width) pixels wide")
//然而，初始的 hd 实例中 width 属性还是 1920：
print("hd is still \(hd.width) pixels wide")
//枚举也遵循相同的行为准则：
enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remembered direction is still .West")
}
//与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，引用的是已存在的实例本身而不是其拷贝。
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
//然后，tenEighty 被赋予名为 alsoTenEighty 的新常量，同时对 alsoTenEighty 的帧率进行修改
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
//因为类是引用类型，所以 tenEight 和 alsoTenEight 实际上引用的是相同的 VideoMode 实例。换句话说，它们是同一个实例的两种叫法。
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
//因为类是引用类型，有可能有多个常量和变量在幕后同时引用同一个类实例
if(tenEighty === alsoTenEighty){
    print("123")
}
//Swift 中，许多基本类型，诸如 String，Array 和 Dictionary 类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。
//Objective-C 中 NSString，NSArray 和 NSDictionary 类型均以类的形式实现，而并非结构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用
