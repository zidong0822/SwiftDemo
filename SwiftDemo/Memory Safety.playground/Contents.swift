import UIKit

//默认情况下，Swift 会阻止你代码里不安全的行为。例如，Swift 会保证变量在使用之前就完成初始化，在内存被回收之后就无法被访问，并且数组的索引会做越界检查。
//内存的访问，会发生在你给变量赋值，或者传递参数给函数时。例如，下面的代码就包含了读和写的访问：
// 向 one 所在的内存区域发起一次写操作
var one = 1

// 向 one 所在的内存区域发起一次读操作
print("We're number \(one)!")

//内存访问冲突有三种典型的状况：访问是读还是写，访问的时长，以及被访问的存储地址。
func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)

//重叠的访问主要出现在使用 in-out 参数的函数和方法或者结构体的 mutating 方法里。
var stepSize = 1

func increment(_ number: inout Int) {
    number += stepSize
}

//increment(&stepSize)

//解决这个冲突的一种方式，是复制一份 stepSize 的副本：
var copyOfStepSize = stepSize
increment(&copyOfStepSize)
stepSize = copyOfStepSize

//长期写访问的存在还会造成另一种结果，往同一个函数的多个 in-out 参数里传入同一个变量也会产生冲突，例如：
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
//var playerOneScore = 42
//var playerTwoScore = 30
//balance(&playerOneScore, &playerOneScore)

//一个结构体的 mutating 方法会在调用期间对 self 进行写访问
struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}
extension Player {
    
    mutating func shareHealth(with teamate: inout Player) {
        balance(&teamate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)

//如结构体，元组和枚举的类型都是由多个独立的值组成的，例如结构体的属性或元组的元素。。因为它们都是值类型，修改值的任何一部分都是对于整个值的修改，意味着其中一个属性的读或写访问都需要访问整一个值。
//var playerInformation = (health: 10, energy: 20)
//balance(&playerInformation.health, &playerInformation.energy)

//var holly = Player(name: "Oscar", health: 10, energy: 10)
//balance(&holly.health, &holly.energy)

//将上面例子里的变量 holly 改为本地变量而非全局变量，编译器就会可以保证这个重叠访问时安全的：
func someFunction() {
    var playerInformation = (health: 10, energy: 20)
    balance(&playerInformation.health, &playerInformation.energy)

}

someFunction()

/*如果编译器可以保证这种非专属的访问是安全的，那 Swift 就会允许这种内存安全的行为。特别是当你遵循下面的原则时，它可以保证结构体属性的重叠访问是安全的：

你访问的是实例的存储属性，而不是计算属性或类的属性
结构体是本地变量的值，而非全局变量
结构体要么没有被闭包捕获，要么只被非逃逸闭包捕获了
 
如果编译器无法保证访问的安全性，它就不会允许访问。
 
*/

public class A {
    fileprivate func someMethod() {
        print("123")
    }
}

public class B: A {
    override public func someMethod() {
        super.someMethod()
    }
}

public class C {
    func anotherMethod(){
        A().someMethod()
        //print("456")
    }
}
C().anotherMethod()
//
//A().someMethod()
