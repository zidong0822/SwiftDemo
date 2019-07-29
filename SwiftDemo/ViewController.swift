//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Harvey He on 2019/7/17.
//  Copyright © 2019 Harvey He. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    struct Shape {
        // 宽、边长
        var width: Int
        // 边的数量
        var side: Int {
            willSet {
                print("willSetSide", newValue)
            }
            didSet {
                print("didSetSide", oldValue, side)
            }
        }
        // 周长
        var girth: Int {
            set {
                // 边长 = 周长 / 边数
                width = newValue / side
                print("setGirth", newValue,side,width)
            }
            get {
                print("getGirth",width,side)
                // 周长 = 边长 * 边数
                return width * side
            }
        }
        func show() {
            print("width=\(width), side=\(side), girth=\(girth)")
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      //  print(calculate(a:2, b: 8))
      //  print(sum(1,2,3,4))
//        var shape = Shape(width: 10, side:10)
//        test(&shape.girth)
        //shape.show()
        var set = Set<Int>()
        set.insert(1)
        set.insert(2)
        set.insert(2)
        print(set)
        
    }
    
// 可以省略Void 也可以不省略，如下三种都可以
//    func sayHello(){
//        print("hello")
//    }

//    func sayHello()->(){
//        print("hello")
//    }
//
//    func sayHello()->(Void){
//        print("hello")
//    }
    
    func pi()->Double {
        return 3.1415
    }
    
    /// 计算两个数的和
    ///
    /// - Parameters:
    ///   - a: 第一个参数
    ///   - b: 第二个参数
    /// - Returns: 返回两个参数之和
    func sum(a:Int,b:Int)->Int {
        return a + b
    }
    
    func calculate(a:Int,b:Int)-> (sum:Int,average:Int){
        let sum = a + b
        return(sum,sum >> 1)
    }

    func sum(_ numbers: Int...) -> Int{
        var total = 0
        for num in numbers {
            total += num
        }
        return total
    }
    
    func swapValues(_ v1: inout Int, _ v2: inout Int) {
       (v1,v2) = (v2,v1)
    }
    
    var num1 = 10
    var num2 = 20
    
    func data(){
        swapValues(&num1, &num2)
        print("num1 = \(num1), num2 = \(num2)")
    }

    func test(_ num: inout Int) {
        print("test");
        num = 8
    }
}
