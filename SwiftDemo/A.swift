//
//  A.swift
//  SwiftDemo
//
//  Created by Harvey He on 2019/8/23.
//  Copyright © 2019 Harvey He. All rights reserved.
//

public class A{
    fileprivate func someMethod() {
        print("123")
    }
}

public class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}
