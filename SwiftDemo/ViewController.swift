//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Harvey He on 2019/7/17.
//  Copyright © 2019 Harvey He. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let string = "[{\"url_camp\":\"microduino\",\"isPeaple\":true,\"peapleCamera\":{\"delayTime\":-0.001,\"type\":\"emotion\"},\"platOrAnimal\":{\"delayTime\":-0.001}}]"
    override func viewDidLoad() {
       if let data = string.data(using: .utf8) {
        var resultFromServer: Any?
        resultFromServer = try! JSONSerialization.jsonObject(with: data, options: [])
        if let respdict = resultFromServer as? [String : Any] {
            //respone in dictionary format
            print(respdict)
        }
            
        else if let respArr = resultFromServer as? [Any]{
            //response is array type
            print("1111",respArr)
        }
            
        else if let stringRespt = String(data: data, encoding: .utf8){
            //resp is string
            print(stringRespt)
        }
    }
    
    }
    
    
}
