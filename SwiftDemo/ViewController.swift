//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Harvey He on 2019/7/17.
//  Copyright © 2019 Harvey He. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var a = 1
    var b = 2
    override func viewDidLoad() {
        changeValue(value1:a,value2:b)
        printValue()
        
    }

    func changeValue(value1:Int,value2:Int){
       // self.a = 2
        let c = value1
        a = value2
        b = c
    }
    
    func printValue(){
         print(a,b)
    }
}
